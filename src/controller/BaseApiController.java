package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.json.*;

abstract class BaseApiController {
    private Map<String, String> url_mappings_get;
    private Map<String, String> url_mappings_post;
    private Map<String, String> url_mappings_put;
    private Map<String, String> url_mappings_delete;

    Map<String, String> getUrlMappings_Get() {
        return this.url_mappings_get;
    }

    Map<String, String> getUrlMappings_Post() {
        return this.url_mappings_post;
    }

    Map<String, String> getUrlMappings_Put() {
        return this.url_mappings_put;
    }

    Map<String, String> getUrlMappings_Delete() {
        return this.url_mappings_delete;
    }

    /**
     * @param url    Url nach "/controller/"
     * @param method Name der Methode, die aufgerufen wird
     */
    void addUrlMapping_Get(String url, String method) {
        this.url_mappings_get.put(url, method);
    }

    void addUrlMapping_Post(String url, String method) {
        this.url_mappings_post.put(url, method);
    }

    void addUrlMapping_Put(String url, String method) {
        this.url_mappings_put.put(url, method);
    }

    void addUrlMapping_Delete(String url, String method) {
        this.url_mappings_delete.put(url, method);
    }

    BaseApiController() {
        url_mappings_get = new HashMap<>();
        url_mappings_post = new HashMap<>();
        url_mappings_put = new HashMap<>();
        url_mappings_delete = new HashMap<>();
    }

    /**
     * Parse JSON-Data from request and return it
     *
     * @param request
     * @return
     */
    JSONObject getJSON(HttpServletRequest request) {
        StringBuffer jb = new StringBuffer();
        String line;
        try {
            BufferedReader reader = request.getReader();
            while ((line = reader.readLine()) != null)
                jb.append(line);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            return new JSONObject(jb.toString());
        } catch (JSONException e) {
            // crash and burn
            System.err.println("Error parsing JSON request string");
        }
        return null;
    }

    /**
     * Send a String as HTTP Response
     *
     * @param response
     * @param content
     */
    void sendResponse(HttpServletResponse response, String content) {
        try {
            PrintWriter out;
            out = response.getWriter();
            out.print(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
