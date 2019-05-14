import java.util.HashMap;
import java.util.Map;

abstract class BaseApi {
    private Map<String, String> url_mappings_get;
    private Map<String, String> url_mappings_post;
    private Map<String, String> url_mappings_put;
    private Map<String, String> url_mappings_delete;

    public Map<String, String> getUrlMappings_Get() {
        return this.url_mappings_get;
    }

    public Map<String, String> getUrlMappings_Post() {
        return this.url_mappings_post;
    }

    public Map<String, String> getUrlMappings_Put() {
        return this.url_mappings_put;
    }

    public Map<String, String> getUrlMappings_Delete() {
        return this.url_mappings_delete;
    }

    /**
     *
     * @param url Url nach "/api/"
     * @param method Name der Methode in dieser Klasse, die aufgerufen wird
     */
    protected void addUrlMapping_Get(String url, String method) {
        this.url_mappings_get.put(url, method);
    }

    protected void addUrlMapping_Post(String url, String method) {
        this.url_mappings_post.put(url, method);
    }

    protected void addUrlMapping_Put(String url, String method) {
        this.url_mappings_put.put(url, method);
    }

    protected void addUrlMapping_Delete(String url, String method) {
        this.url_mappings_delete.put(url, method);
    }

    BaseApi() {
        url_mappings_get = new HashMap<String, String>();
        url_mappings_post = new HashMap<String, String>();
        url_mappings_put = new HashMap<String, String>();
        url_mappings_delete = new HashMap<String, String>();
    }
}
