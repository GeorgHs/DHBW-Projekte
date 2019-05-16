package models;

public class Profile {

    private int user_id;
    private String username;
    private String email;

    public int getUser_id() {
        return 1;
        //return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {

        return "Elon Musk";
        //return username;
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
