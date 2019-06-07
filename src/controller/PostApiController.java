package controller;

import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostApiController extends BaseApiController {

    public PostApiController() {
        super();
        //this.addUrlMapping_Post("post", "createPost");
        this.addUrlMapping_Post("post/like", "addLike");
        this.addUrlMapping_Post("post/delete", "deletePost");
    }

    public void createPost(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        int media_id = -1;
        int user_id = SessionController.getCurrentUserId(request);
        if (data.has("media")) {
            media_id = DatabaseController.executeUpdate("INSERT INTO media (user_id, media_type, media) VALUES ('" + user_id + "', '" + "image" + "', '" + data.getString("media") + "');");
        }
        DatabaseController.executeUpdate("INSERT INTO posts (user_id, text, media_id, created_at) VALUES ('" + user_id + "', '" + data.getString("text") + "', " + (media_id == -1 ? "NULL" : "'" + media_id + "'") + ", '" + System.currentTimeMillis() + "');");
        response.setStatus(201);
    }
    public void deletePost(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        int user_id = SessionController.getCurrentUserId(request);

        int id = data.getInt("id");
        DatabaseController.executeUpdate("DELETE from posts WHERE id='"+id+"';");
        response.setStatus(204);
    }
}
