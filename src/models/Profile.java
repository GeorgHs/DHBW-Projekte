package models;

import controller.DatabaseController;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Profile {

    private String id;
    private String username;
    private String handle;
    private String email;
    private int profilePictureId;
    private int titlePictureId;
    private String profilePicture;
    private String titlePicture;
    private ArrayList<Profile> follower = new ArrayList<Profile>();
    private ArrayList<Profile> subscriptions = new ArrayList<Profile>();
    private boolean following;
    private ArrayList<Post> posts = new ArrayList<Post>();
    private int limit;
    private int offset;
    private int chatPartner;
    private ArrayList<Profile> availableChatPartners;
    private String theme = "light";

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
        if (id == null || id.equals("undefined") || id.equals("-1")) {
            return;
        }
        try {
            ResultSet resultSet = DatabaseController.executeQuery("SELECT * FROM profiles WHERE id=" + this.id + ";");
            if (resultSet != null && resultSet.next()) {
                this.username = resultSet.getString("username");
                this.handle = resultSet.getString("handle");
                this.email = resultSet.getString("email");
                this.profilePictureId = resultSet.getInt("profilepicture_id");
                this.titlePictureId = resultSet.getInt("titlepicture_id");
                this.theme = resultSet.getString("theme");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
        DatabaseController.executeUpdate("UPDATE profiles SET username=" + username + " WHERE id=" + this.id);
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
        DatabaseController.executeUpdate("UPDATE profiles SET email=" + email + " WHERE id=" + this.id);
    }

    public String getProfilePicture() {
        try {
            ResultSet mediaQuery = DatabaseController.executeQuery("SELECT * FROM media WHERE id=" + this.profilePictureId + ";");
            if (mediaQuery != null && mediaQuery.next()) {
                this.profilePicture = mediaQuery.getString("media");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return this.profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getTitlePicture() {
        try {
            ResultSet mediaQuery = DatabaseController.executeQuery("SELECT * FROM media WHERE id=" + this.titlePictureId + ";");
            if (mediaQuery != null && mediaQuery.next()) {
                this.titlePicture = mediaQuery.getString("media");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.titlePicture;
    }

    public void setTitlePicture(String titlePicture) {
        this.titlePicture = titlePicture;
    }


    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
        DatabaseController.executeUpdate("UPDATE profiles SET handle=" + handle + " WHERE id=" + this.id);
    }

    public ArrayList<Profile> getFollower() {
        try {
            ResultSet followQuery = DatabaseController.executeQuery("SELECT * FROM followings WHERE user_id1=" + this.id + ";");
            while (followQuery != null && followQuery.next()) {
                String userId = followQuery.getString("user_id2");
                Profile user = new Profile();
                user.setId(userId);
                int contains = 0;
                for (Profile f : follower) {
                    if (f.id.equals(userId)) {
                        contains++;
                    }
                }
                if (contains == 0) {
                    this.follower.add(user);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.follower;
    }

    public void setFollower(Profile followId) {
        this.follower.add(followId);
    }

    public ArrayList<Profile> getSubscriptions() {
        try {
            ResultSet followQuery = DatabaseController.executeQuery("SELECT * FROM followings WHERE user_id2=" + this.id + ";");
            while (followQuery != null && followQuery.next()) {
                String userId = followQuery.getString("user_id1");
                Profile user = new Profile();
                user.setId(userId);
                int contains = 0;
                for (Profile s : subscriptions) {
                    if (s.id.equals(userId)) {
                        contains++;
                    }
                }
                if (contains == 0) {
                    this.subscriptions.add(user);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.subscriptions;
    }

    public boolean isFollowing(String id) {
        following = false;
        if (!this.id.equals(id)) {
            ResultSet res = DatabaseController.executeQuery("SELECT * FROM followings WHERE user_id1='" + this.id + "' AND user_id2='" + id + "';");
            try {
                if (res != null && res.next()) {
                    following = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return following;
    }

    public ArrayList<Post> getPosts() {
        ResultSet rs = DatabaseController.executeQuery("SELECT * from posts where user_id=" + this.id + " ORDER BY created_at DESC " + (limit != 0 ? "LIMIT " + limit + " OFFSET " + offset : "") + ";");
        try {
            while (rs != null && rs.next()) {
                Post post = new Post();
                post.setId(rs.getString("id"));
                if (rs.getString("media_id") != null) {
                    ResultSet mediaQuery = DatabaseController.executeQuery("SELECT * from media WHERE id=" + rs.getString("media_id") + ";");
                    if (mediaQuery != null && mediaQuery.next()) {
                        Media m = new Media();
                        m.setMedia_id(mediaQuery.getInt("id"));
                        m.setMedia(mediaQuery.getString("media"));
                        m.setMedia_type(mediaQuery.getString("media_type"));
                        m.setUser(this);
                        post.setMedia(m);
                    }
                }

                post.setText(rs.getString("text"));
                post.setUser(this);
                post.setCreated_at((rs.getString("created_at")));
                int contains = 0;
                for (Post p : posts) {
                    if (p.getId() == post.getId()) {
                        contains++;
                    }
                }
                if (contains == 0) {
                    this.posts.add(post);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public void setChatPartner(int chatPartner) {
        this.chatPartner = chatPartner;
    }

    public int getUnreadMessages() {
        ResultSet rs = DatabaseController.executeQuery("SELECT * FROM messages WHERE user_id_to=" + chatPartner + " AND user_id_from=" + id);
        int count = 0;
        try {
            while (rs != null && rs.next()) {
                if (rs.getInt("is_read") == 0) {
                    count++;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public ArrayList<Profile> getAvailableChatPartners() {
        ArrayList<Profile> partners = new ArrayList<>(getSubscriptions());
        ResultSet rs = DatabaseController.executeQuery("SELECT * FROM messages where user_id_to=" + id);
        try {
            if (rs != null && rs.next()) {
                Profile p = new Profile();
                p.setId(rs.getString("user_id_from"));
                var found = false;
                for (Profile p2 : partners) {
                    if (p2.id.equals(p.id)) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    partners.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return partners;
    }

    public String getTheme() {
        return theme;
    }
}
