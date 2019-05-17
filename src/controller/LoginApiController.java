package controller;

import org.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

class LoginApiController extends BaseApiController {

    LoginApiController() {
        super();
        this.addUrlMapping_Post("login", "doLogin");
    }

    /**
     * Validate Credentials and send JWT to client
     *
     * @param request http request
     * @param response http response
     */
    public void doLogin(HttpServletRequest request, HttpServletResponse response){
        JSONObject data = getJSON(request);
        String username = data.getString("username");
        String password = data.getString("password");

        // @TODO get id from database
        String id = "1";

        Cookie jwt_cookie = new Cookie("token", SessionController.createJWT(id));
        jwt_cookie.setPath("/");
        jwt_cookie.setMaxAge(604800);
        response.addCookie(jwt_cookie);
        response.setStatus(200);
    }
}

