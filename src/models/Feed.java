package models;

import controller.DatabaseController;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Feed {

    private ArrayList<Post> posts = new ArrayList<>();
    private int user;
    private int limit = 0;
    private int offset = 0;

    public void setUser(int user) {
        this.user = user;
    }

    public ArrayList<Post> getPosts() {
        posts.clear();
        ResultSet rs = DatabaseController.executeQuery("SELECT * FROM posts ORDER BY created_at DESC " + (limit != 0 ? "LIMIT " + limit + " OFFSET " + offset : ""));
        try {
            if (rs != null) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getString("id"));
                    Profile user = new Profile();
                    user.setId(rs.getString("user_id"));
                    post.setUser(user);
                    if (rs.getString("media_id") != null) {
                        ResultSet rs_media = DatabaseController.executeQuery("SELECT * FROM media WHERE id=" + rs.getString("media_id"));
                        Media media = new Media();
                        if (rs_media != null && rs_media.next()) {
                            media.setMedia_id(rs_media.getInt("id"));
                            media.setMedia_type(rs_media.getString("media_type"));
                            media.setMedia(rs_media.getString("media"));
                            post.setMedia(media);
                        }
                    }
                    post.setText(rs.getString("text"));
                    post.setCreated_at((rs.getString("created_at")));
                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getUser() {
        return user;
    }
}
