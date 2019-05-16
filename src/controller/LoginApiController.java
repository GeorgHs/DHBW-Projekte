package controller;

import org.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

class LoginApiController extends BaseApiController {

    LoginApiController() {
        super();
        this.addUrlMapping_Get("login", "checkLogin");
        this.addUrlMapping_Post("login", "doLogin");
    }

    public void checkLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie[] cookies = request.getCookies();
        String jwt = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                jwt = cookie.getValue();
            }
        }
        // check if logged in
        if (SessionController.decodeJWT(jwt) != null) {
            response.sendRedirect("/feed.jsp");
        } else {
            response.sendRedirect("/login.jsp");
        }
    }

    public void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = "";
        Cookie jwt_cookie = new Cookie("token", SessionController.createJWT(id));
        response.addCookie(jwt_cookie);
    }
}

