package controller;

import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PostApiController extends BaseApiController {

    public PostApiController() {
        super();
        this.addUrlMapping_Post("post/like", "addLike");
        this.addUrlMapping_Post("post/delete", "deletePost");
        this.addUrlMapping_Get("post/getposts", "getPosts");
        this.addUrlMapping_Get("post/getpostsbyuser", "getPostsByUser");
        this.addUrlMapping_Post("post/like", "likePost");
        this.addUrlMapping_Post("post/unlike", "unlikePost");
    }

    public void deletePost(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        int user_id = SessionController.getCurrentUserId(request);

        int id = data.getInt("id");
        DatabaseController.executeUpdate("DELETE from posts WHERE id='"+id+"';");
        response.setStatus(204);
    }

    public void getPosts(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/includes/feed-posts.jsp?limit=" + request.getParameter("limit") + "&offset=" + request.getParameter("offset")+"&current="+SessionController.getCurrentUserId(request));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void getPostsByUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/includes/profile-posts.jsp?id=" + request.getParameter("id") + "&limit=" + request.getParameter("limit") + "&offset=" + request.getParameter("offset")+"&current="+SessionController.getCurrentUserId(request));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void likePost(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        int user_id = SessionController.getCurrentUserId(request);

        int id = data.getInt("id");
        DatabaseController.executeUpdate("INSERT INTO likes (post_id, user_id) VALUES ("+id+", "+user_id+");");
        response.setStatus(200);
        sendResponse(response, "OK");
    }
    public void unlikePost(HttpServletRequest request, HttpServletResponse response) {
        JSONObject data = getJSON(request);
        int user_id = SessionController.getCurrentUserId(request);

        int id = data.getInt("id");
        DatabaseController.executeUpdate("DELETE from likes WHERE post_id='"+id+"' AND user_id='"+user_id+"';");
        response.setStatus(200);
        sendResponse(response, "OK");
    }
}
