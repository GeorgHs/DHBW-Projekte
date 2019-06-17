package controller;

import models.Profile;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DmApiController extends BaseApiController{
    DmApiController() {
        super();
        this.addUrlMapping_Post("dm", "sendMessage");
        this.addUrlMapping_Get("dm", "getMessages");
    }

    public void sendMessage(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        int recipient = data.getInt("recipient");
        String message = data.getString("message");

        Profile sender_profile = new Profile();
        sender_profile.setId(Integer.toString(SessionController.getCurrentUserId(request)));
        WebsocketController.sendMessage(Integer.toString(recipient), "info", "<b>New Message from " + sender_profile.getUsername() + ":</b> <br>" + message);
        response.setStatus(200);
    }

    public void getMessages(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        if (id != null && id.length() != 0) {
            Profile p = new Profile();
            p.setId(id);
            sendResponse(response, "{'messages': ['text': 'asdf', 'timestamp': '13548746486']} " + p.getUsername());
            response.setStatus(200);
        }
    }
}
