package models;

import controller.DatabaseController;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Search {
    private String query;
    private ArrayList<Profile> results = new ArrayList<>();
    private boolean no_results = false;

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
        this.no_results = false;
        String sql = "SELECT * FROM profiles WHERE username LIKE '%" + query + "%' OR handle LIKE '%" + query + "%' OR email LIKE '%" + query + "%';";
        ResultSet rs = DatabaseController.executeQuery(sql);
        try {
            if (rs == null) {
                no_results = true;
                return;
            }
            while (rs.next()) {
                Profile p = new Profile();
                p.setId(rs.getString("id"));
                results.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Profile> getResults() {
        return results;
    }

    public boolean isNo_results() {
        return no_results;
    }
}
