package controller;

import com.auth0.jwt.JWT;
import models.Profile;
import org.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

class ProfileApiController extends BaseApiController {

    ProfileApiController() {
        super();
        this.addUrlMapping_Get("profile/username", "getUsername");
        this.addUrlMapping_Get("profile/current", "getCurrent");
        this.addUrlMapping_Post("profile/profilepicture", "setProfilepicture");
        this.addUrlMapping_Post("profile/titlepicture", "setTitlepicture");
        this.addUrlMapping_Post("profile/postexample", "postexample");
        this.addUrlMapping_Post("profile/follow", "followUser");
        this.addUrlMapping_Post("profile/isValidHandle", "isValidHandle");
        this.addUrlMapping_Post("profile/isValidUsername", "isValidUsername");
        this.addUrlMapping_Post("profile/isValidEmail", "isValidEmail");
        this.addUrlMapping_Post("profile/isValidPassword", "isValidPassword");
        this.addUrlMapping_Post("profile/updateUsername", "updateUsername");
        this.addUrlMapping_Post("profile/updateHandle", "updateHandle");
        this.addUrlMapping_Post("profile/updatePassword", "updatePassword");
        this.addUrlMapping_Post("profile/updateEmail", "updateEmail");
        this.addUrlMapping_Post("profile/post", "createPost");
        this.addUrlMapping_Get("profile/getsuggestions", "getSuggestions");
    }

    public void getCurrent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = this.getTokenId(request);
        Profile user = new Profile();
        user.setId(id);
        sendResponse(response, user.getId() + "," + user.getUsername() + "," + user.getHandle() + "," + user.getProfilePicture() + "," + user.getEmail());
    }

    public void getUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = request.getRequestURI();
        String id = url.substring(url.lastIndexOf('/') + 1);
        ResultSet rs = DatabaseController.executeQuery("SELECT username FROM profiles WHERE id=" + id);
        try {
            if (rs != null && rs.next()) {
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

    public void setProfilepicture(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject data = this.getJSON(request);
        String picture = data.getString("picture");
        String token = this.getTokenId(request);

        DatabaseController.executeUpdate("UPDATE media SET media='" + picture + "' WHERE user_id=" + token + " AND media_type='profile';");
        response.setStatus(200);
        sendResponse(response, picture);
    }

    public void setTitlepicture(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject data = this.getJSON(request);
        String picture = data.getString("picture");
        String token = this.getTokenId(request);

        DatabaseController.executeUpdate("UPDATE media SET media='" + picture + "' WHERE user_id=" + token + " AND media_type='title';");
        response.setStatus(200);
        sendResponse(response, picture);
    }

    private boolean jwtExists(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        boolean ret = false;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                ret = true;
            }
        }
        return ret;
    }

    private String getTokenId(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String jwt = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                jwt = cookie.getValue();
            }
        }

        if (jwt == null) {
            return null;
        }

        return JWT.decode(jwt).getSubject();
    }

    public void followUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject data = this.getJSON(request);
        String idToFollow = data.getString("id");
        String tokenId = this.getTokenId(request);
        ResultSet resultSet = DatabaseController.executeQuery("SELECT * FROM followings where user_id1=" + idToFollow + " AND user_id2=" + tokenId + ";");
        try {
            if (!resultSet.next()) {
                DatabaseController.executeUpdate("INSERT INTO followings (user_id1, user_id2) VALUES ('" + idToFollow + "','" + tokenId + "');");
            } else {
                DatabaseController.executeUpdate("DELETE FROM followings WHERE user_id1=" + idToFollow + " AND user_id2= " + tokenId + ";");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.setStatus(200);
        sendResponse(response, "OK");
    }

    public static boolean validateHandle(String handle) {
        if (handle.trim().equals("")) {
            return false;
        } else {
            ResultSet rs = DatabaseController.executeQuery("SELECT id FROM profiles WHERE handle='" + handle + "';");
            try {
                return rs == null || !rs.next();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public void isValidHandle(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String handle = data.getString("handle");
        response.setStatus(200);
        if (validateHandle(handle)) {
            sendResponse(response, "true");
        } else {
            sendResponse(response, "false");
        }
    }

    public static boolean validateUsername(String username) {
        return !username.trim().equals("");
    }

    public void isValidUsername(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String username = data.getString("username");
        response.setStatus(200);
        if (validateUsername(username)) {
            sendResponse(response, "true");
        } else {
            sendResponse(response, "false");
        }
    }

    public static boolean isValidEmailAddress(String email) {
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);
        return m.matches();
    }

    public static boolean validateEmail(String email) {
        if (email.trim().equals("") || !isValidEmailAddress(email)) {
            return false;
        } else {
            ResultSet rs = DatabaseController.executeQuery("SELECT id FROM profiles WHERE email='" + email + "';");
            try {
                return rs == null || !rs.next();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public void isValidEmail(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String email = data.getString("email");
        response.setStatus(200);
        if (validateEmail(email)) {
            sendResponse(response, "true");
        } else {
            sendResponse(response, "false");
        }
    }

    public static boolean validatePassword(String password, String passwordNew, String passwordNewWdh, String id) {
        if (!id.equals("")) {
            if (passwordNew.equals(passwordNewWdh) && !passwordNew.equals("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855") /* empty string */) {
                ResultSet rs = DatabaseController.executeQuery("SELECT id FROM profiles WHERE id='" + id + "' AND password='" + password + "';");
                try {
                    return rs != null && rs.next();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                return false;
            }
        }
        return !password.equals("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
    }

    public void isValidPassword(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String password = data.getString("password");
        String passwordNew = data.getString("password-new");
        String passwordNewWdh = data.getString("password-new-wdh");
        String id = "";
        if (jwtExists(request)) {
            id = getTokenId(request);
        }

        response.setStatus(200);
        if (validatePassword(password, passwordNew, passwordNewWdh, id)) {
            sendResponse(response, "true");
        } else {
            sendResponse(response, "false");
        }
    }

    public void updateUsername(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String username = data.getString("username");
        DatabaseController.executeUpdate("UPDATE profiles SET username='" + username + "' WHERE id=" + getTokenId(request));
    }

    public void updateHandle(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String handle = data.getString("handle");
        DatabaseController.executeUpdate("UPDATE profiles SET handle='" + handle + "' WHERE id=" + getTokenId(request));
    }

    public void updateEmail(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String email = data.getString("email");
        DatabaseController.executeUpdate("UPDATE profiles SET email='" + email + "' WHERE id=" + getTokenId(request));
    }

    public void updatePassword(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String password = data.getString("password");
        DatabaseController.executeUpdate("UPDATE profiles SET password='" + password + "' WHERE id=" + getTokenId(request));
    }

    public void createPost(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String media = data.getString("media");
        Calendar now = Calendar.getInstance();
        now.setTimeInMillis(System.currentTimeMillis());
        if (!media.equals("undefined")) {
            int mediaId = DatabaseController.executeUpdate("INSERT into media (user_id, media_type, media) VALUES ('" + this.getTokenId(request) + "', 'image', '" + data.getString("media") + "');");
            DatabaseController.executeUpdate("INSERT into posts (user_id, text, media_id, created_at) VALUES ('" + this.getTokenId(request) + "', '" + data.getString("text") + "', '" + mediaId + "', '" + now.getTimeInMillis() + "');");
        } else {
            String sql = "INSERT into posts (user_id, text, created_at) VALUES ('" + this.getTokenId(request) + "', '" + data.getString("text") + "', '" + now.getTimeInMillis() + "');";
            DatabaseController.executeUpdate(sql);
        }

        Profile p = new Profile();
        p.setId(this.getTokenId(request));
        ArrayList<Profile> followers = p.getFollower();
        for (Profile f : followers) {
            WebsocketController.sendMessage(f.getId(), "info", "New Posts available. Please reload page");
        }
    }

    public void getSuggestions(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            response.sendRedirect("/includes/feed-suggestions.jsp?limit=" + request.getParameter("limit") + "&offset=" + request.getParameter("offset") + "&id=" + this.getTokenId(request));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
