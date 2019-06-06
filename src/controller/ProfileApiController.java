package controller;

import com.auth0.jwt.JWT;
import org.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

class ProfileApiController extends BaseApiController {

    ProfileApiController() {
        super();
        this.addUrlMapping_Get("profile/username", "getUsername");
        this.addUrlMapping_Post("profile/profilepicture", "setProfilepicture");
        this.addUrlMapping_Post("profile/titlepicture", "setTitlepicture");
        this.addUrlMapping_Post("profile/postexample", "postexample");
        this.addUrlMapping_Post("profile/follow", "followUser");
        this.addUrlMapping_Post("profile/isValidHandle", "isValidHandle");
        this.addUrlMapping_Post("profile/post", "createPost");
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

    public void setProfilepicture(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject data = this.getJSON(request);
        String picture = data.getString("picture");
        String token = this.getTokenId(request);

        DatabaseController.executeUpdate("UPDATE media SET media='"+picture+"' WHERE user_id="+token+" AND media_type='profile';");
        response.setStatus(200);
        sendResponse(response, picture);
    }
    public void setTitlepicture(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject data = this.getJSON(request);
        String picture = data.getString("picture");
        String token = this.getTokenId(request);

        DatabaseController.executeUpdate("UPDATE media SET media='"+picture+"' WHERE user_id="+token+" AND media_type='title';");
        response.setStatus(200);
        sendResponse(response, picture);
    }

    private String getTokenId(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String jwt = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                jwt = cookie.getValue();
            }
        }

        String token = JWT.decode(jwt).getSubject();
        return token;
    }

    public void followUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
        JSONObject data = this.getJSON(request);
        String idToFollow = data.getString("id");
        String tokenId = this.getTokenId(request);
        ResultSet resultSet = DatabaseController.executeQuery("SELECT * FROM followings where user_id1="+ idToFollow +" AND user_id2="+ tokenId +";");
        try {
            if (!resultSet.next()) {
                DatabaseController.executeUpdate("INSERT INTO followings (user_id1, user_id2) VALUES ('"+idToFollow +"','"+tokenId+"');");
            }else {
                DatabaseController.executeUpdate("DELETE FROM followings WHERE user_id1=" + idToFollow + " AND user_id2= "+ tokenId +";");
            }
        }catch (Exception e){

        }
        response.setStatus(200);
        sendResponse(response, "OK");
    }

    public void isValidHandle(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String handle = data.getString("handle");
        ResultSet rs = DatabaseController.executeQuery("SELECT id FROM profiles WHERE handle='" + handle + "';");
        try {
            response.setStatus(200);
            if (rs != null && rs.next()) {
                sendResponse(response, "false");
            } else {
                sendResponse(response, "true");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createPost(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = this.getJSON(request);
        String media = data.getString("media");
        if(!media.equals("undefined")){
             int mediaId = DatabaseController.executeUpdate("INSERT into media (user_id, media_type, media) VALUES ('"+this.getTokenId(request)+"', 'image', '"+data.getString("media")+"');");
            DatabaseController.executeUpdate("INSERT into posts (user_id, text, media_id) VALUES ('"+this.getTokenId(request)+"', '"+data.getString("text")+"', '"+mediaId+"');");
        }else {
            DatabaseController.executeUpdate("INSERT into posts (user_id, text) VALUES ('"+this.getTokenId(request)+"', '"+data.getString("text")+"');");
        }

    }
}
