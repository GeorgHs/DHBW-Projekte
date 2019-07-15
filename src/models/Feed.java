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
    private int current;
    private ArrayList<Profile> suggestions = new ArrayList<>();

    public void setUser(int user) {
        this.user = user;
    }
    public void setCurrent(int current) {
        this.current = current;
    }

    public ArrayList<Post> getPosts() {
        posts.clear();
        Profile currentUser = new Profile();
        currentUser.setId(String.valueOf(current));
        ArrayList<Profile> subscriptions = currentUser.getSubscriptions();
        String sql = "SELECT * FROM posts";
        if (subscriptions.size() > 0) {
            sql += " WHERE ";
            for (int i = 0; i < subscriptions.size(); i++) {
                sql += "user_id='" + subscriptions.get(i).getId() + "' ";
                if (i + 1 != subscriptions.size()) {
                    sql += "OR ";
                }
            }
            sql += "ORDER BY created_at DESC " + (limit != 0 ? "LIMIT " + limit + " OFFSET " + offset : "");
        }else{
            return null;
        }
        ResultSet rs = DatabaseController.executeQuery(sql);
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
                    post.getLikes();
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

    public ArrayList<Profile> getSuggestions(){
        Profile currentUser = new Profile();
        currentUser.setId(Integer.toString(user));
        ArrayList<Profile> subscriptions = currentUser.getSubscriptions();
        String sql = "SELECT * FROM profiles WHERE id!='"+ user+"'";
        for (Profile p: subscriptions) {
            sql += " AND id!='"+p.getId()+"'";
        }
        ResultSet rs = DatabaseController.executeQuery( sql + (limit != 0 ? "LIMIT " + limit + " OFFSET " + offset : ""));
        try {
            while (rs != null && rs.next()) {
                Profile p = new Profile();
                p.setId(rs.getString("id"));
                p.getProfilePicture();
                suggestions.add(p);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return suggestions;
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
