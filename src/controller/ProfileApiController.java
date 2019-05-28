package controller;

import org.json.JSONObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

class ProfileApiController extends BaseApiController {

    ProfileApiController() {
        super();
        this.addUrlMapping_Get("profile/username", "getUsername");
        this.addUrlMapping_Post("profile/postexample", "postexample");
    }

    public void getUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = request.getRequestURI();
        String id = url.substring(url.lastIndexOf('/') + 1);
        ResultSet rs = DatabaseController.executeQuery("SELECT username FROM profiles WHERE id=" + id);
        try {
            if (rs != null && rs.next()){
                sendResponse(response, rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void postexample(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject data = this.getJSON(request);
        String test = data.getString("test");
        sendResponse(response, test);
    }
}
