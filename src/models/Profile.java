package models;

import controller.DatabaseController;

import javax.servlet.http.Cookie;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.ResultSet;
import java.util.Map;

public class Profile {

    private String id;
    private String username;
    private String email;
    private int profilePictureId;
    private int titlePictureId;
    private String profilePicture;
    private String titlePicture;

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
        try {
            ResultSet resultSet = DatabaseController.executeQuery("SELECT * FROM profiles WHERE id=" + this.id + ";");
            if (resultSet.next()) {
                 this.username = resultSet.getString("username");
                 this.email = resultSet.getString("email");
                 this.profilePictureId = resultSet.getInt("profilepicture_id");
                 this.titlePictureId = resultSet.getInt("titlepicture_id");
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
            if(mediaQuery.next()){
                this.profilePicture = mediaQuery.getString("media");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }


        return this.profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getTitlePicture() {
        try {
            ResultSet mediaQuery = DatabaseController.executeQuery("SELECT * FROM media WHERE id=" + this.titlePictureId +";");
            if(mediaQuery.next()){
                this.titlePicture = mediaQuery.getString("media");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return this.titlePicture;
    }

    public void setTitlePicture(String titlePicture) {
        this.titlePicture = titlePicture;
    }


}
