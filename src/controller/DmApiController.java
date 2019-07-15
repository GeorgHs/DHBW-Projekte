package controller;

import models.Profile;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DmApiController extends BaseApiController{
    DmApiController() {
        super();
        this.addUrlMapping_Post("dm", "sendMessage");
        this.addUrlMapping_Post("markasread", "markAsRead");
        this.addUrlMapping_Get("dm", "getMessages");
    }

    public void sendMessage(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        int recipient = data.getInt("recipient");
        String message = data.getString("message");

        Profile sender_profile = new Profile();
        sender_profile.setId(Integer.toString(SessionController.getCurrentUserId(request)));
        String sql = "INSERT INTO messages (user_id_from, user_id_to, message, is_read, created_at) VALUES (\"" + sender_profile.getId() + "\", \"" + recipient + "\", \"" + message + "\", \"0\", \"" + System.currentTimeMillis() + "\")";
        DatabaseController.executeUpdate(sql);
        WebsocketController.sendMessage(Integer.toString(recipient), "message", "{\"username_from\": \"" + sender_profile.getUsername() + "\", \"id_from\": " + sender_profile.getId() + ", \"message\": \"" + message + "\"}");
        response.setStatus(200);
    }

    public void getMessages(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        if (id.equals("undefined")) {
            return;
        }
        if (id != null && id.length() != 0) {
            Profile p = new Profile();
            p.setId(id);
            ArrayList<JSONObject> messages = new ArrayList<>();
            String sql = "SELECT * FROM messages WHERE (user_id_to=" + p.getId() + " AND user_id_from=" + SessionController.getCurrentUserId(request) + ") OR (user_id_from=" + p.getId() + " AND user_id_to=" + SessionController.getCurrentUserId(request) + ");";
            ResultSet rs = DatabaseController.executeQuery(sql);
            try {
                while(rs != null && rs.next()) {
                    JSONObject message = new JSONObject();
                    message.put("user_id_from", rs.getString("user_id_from"));
                    message.put("user_id_to", rs.getString("user_id_to"));
                    message.put("message", rs.getString("message"));
                    message.put("created_at", rs.getString("created_at"));
                    messages.add(message);
                    DatabaseController.executeUpdate("UPDATE messages SET is_read=1 WHERE id=" + rs.getString("id"));
                }
            } catch(SQLException e) {
                e.printStackTrace();
            }
            JSONObject res = new JSONObject();
            res.put("messages", messages);
            response.setCharacterEncoding("UTF-8");
            sendResponse(response, res.toString());
            response.setStatus(200);
        }
    }

    public void markAsRead(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        DatabaseController.executeUpdate("UPDATE messages SET is_read=1 WHERE user_id_from=" + data.getString("id") + " AND user_id_to=" + SessionController.getCurrentUserId(request));
        response.setStatus(200);
    }
}