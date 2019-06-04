package controller;

import org.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.awt.image.DataBuffer;
import java.sql.ResultSet;
import java.sql.SQLException;

class LoginApiController extends BaseApiController {

    LoginApiController() {
        super();
        this.addUrlMapping_Post("login", "doLogin");
        this.addUrlMapping_Post("register", "doRegister");
    }

    /**
     * Validate Credentials and send JWT to client
     *
     * @param request  http request
     * @param response http response
     */
    public void doLogin(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        String email = data.getString("email");
        String password = data.getString("password");

        ResultSet rs = DatabaseController.executeQuery("SELECT id FROM profiles WHERE email='" + email + "' AND password='" + password + "';");

        try {
            if (rs != null && rs.next()) {
                String id = rs.getString("id");

                Cookie jwt_cookie = new Cookie("token", SessionController.createJWT(id));
                jwt_cookie.setPath("/");
                jwt_cookie.setMaxAge(604800);
                response.addCookie(jwt_cookie);
                response.setStatus(200);
            } else {
                response.setStatus(403);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Validate Credentials and send JWT to client
     *
     * @param request  http request
     * @param response http response
     */
    public void doRegister(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        String username = data.getString("username");
        String email = data.getString("email");
        String password = data.getString("password");
        String handle = data.getString("handle");

        if (username.length() == 0 || email.length() == 0 || password.length() == 0 || handle.length() == 0) {
            response.setStatus(500);
            return;
        }

        // Validate Handle
        ResultSet rs = DatabaseController.executeQuery("SELECT id FROM profiles WHERE handle='" + handle + "';");
        try {
            if (rs != null && rs.next()) {
                response.setStatus(500);
                sendResponse(response, "false");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String sql = "INSERT INTO profiles (username, email, password, handle) VALUES ('" + username + "', '" + email + "', '" + password + "', '" + handle + "')";
        int id = DatabaseController.executeUpdate(sql);
        if (id == -1) {
            response.setStatus(500);
        } else {
            Cookie jwt_cookie = new Cookie("token", SessionController.createJWT(Integer.toString(id)));
            jwt_cookie.setPath("/");
            jwt_cookie.setMaxAge(604800);
            response.addCookie(jwt_cookie);
            response.setStatus(200);
        }
    }
}

