package models;

import controller.DatabaseController;

import java.sql.ResultSet;
import java.util.Date;

public class Post {

    private String id;
    private String text;
    private Profile user;
    private Media media;
    private Date created_at;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        if (id.equals("0")) {
            ResultSet rs = DatabaseController.executeSQL("INSERT INTO posts (id) VALUES (" + id + ");");
            this.id = "";
        } else {
            this.id = id;
        }
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Profile getUser() {
        return user;
    }

    public void setUser(Profile user) {
        this.user = user;
    }

    public Media getMedia() {
        return media;
    }

    public void setMedia(Media media) {
        this.media = media;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    private Date created;

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
