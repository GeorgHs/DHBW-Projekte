package models;


import controller.DatabaseController;

import java.sql.ResultSet;

public class Profile {

    private int user_id;
    private String username;
    private String email;
    private DatabaseController db = new DatabaseController();

    public Object getUser_id() {

        try {
        ResultSet resultSet = db.executeSQL("Select user_id from profiles where user_id=1;");

            if(resultSet.next()) {

                return resultSet.getInt("user_id");
            }
        }catch (Exception e){

        }
    return 0;
             //return user_id;

    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {

        try {
            ResultSet resultSet = db.executeSQL("Select username from profiles where user_id=1;");

            if(resultSet.next()) {
                System.out.println();
                return resultSet.getString("username");
            }
        }catch (Exception e){

        }
        return "";
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return "elon@tesla.com";
        //return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
