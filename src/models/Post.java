package models;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.Calendar;
import java.util.Date;

public class Post {

    private int id;
    private String text;
    private Profile user;
    private Media media = null;
    private String created_at;
    private String created_at_pretty;

    public int getId() {
        return id;
    }

    public void setId(String id) {
        this.id = Integer.parseInt(id);
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

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getCreated_at_pretty() {
        Calendar created = Calendar.getInstance();
        created.setTimeInMillis(Integer.parseInt(created_at));
        Calendar now = Calendar.getInstance();
        now.setTimeInMillis(System.currentTimeMillis());

        String ret = "";
        long minutes = Duration.between(created.toInstant(), now.toInstant()).toMinutes();
        long hours = Duration.between(created.toInstant(), now.toInstant()).toHours();
        long days = Duration.between(created.toInstant(), now.toInstant()).toDays();
        if (minutes < 60) {
            ret = minutes + "m ago";
        } else if (hours < 24) {
            ret = hours + "h ago";
        } else if (days < 30) {
            ret = days + "d ago";
        } else {
            SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
            ret = f.format(created.getTime());
        }
        return ret;
    }
}
