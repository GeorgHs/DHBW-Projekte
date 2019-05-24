package models;

import controller.DatabaseController;

import java.sql.ResultSet;

public class Profile {

    private String id;
    private String username;
    private String email;

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
        try {
            ResultSet resultSet = DatabaseController.executeSQL("Select * from profiles where user_id=" + this.id + ";");
            if (resultSet.next()) {
                 this.username = resultSet.getString("username");
                 this.email = resultSet.getString("email");
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
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
