package controller;

import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

class ProfileApiController extends BaseApiController {

    ProfileApiController() {
        super();
        this.addUrlMapping_Get("profile/username", "getUsername");
        this.addUrlMapping_Post("profile/postexample", "postexample");
    }

    public void getUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        sendResponse(response, "Elon Musk");
    }

    public void postexample(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject data = this.parseJSON(request);
        String test = data.getString("test");
        sendResponse(response, test);
    }
}
