package controller;

import org.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

class LoginApiController extends BaseApiController {

    LoginApiController() {
        super();
        this.addUrlMapping_Post("login", "doLogin");
    }

    /**
     * Validate Credentials and send JWT to client
     * @param request
     * @param response
     * @throws IOException
     */
    public void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = "";
        Cookie jwt_cookie = new Cookie("token", SessionController.createJWT(id));
        response.addCookie(jwt_cookie);
    }
}

