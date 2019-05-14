public class ProfileApi extends BaseApi{

    ProfileApi() {
        super();
        this.addUrlMapping_Get("profile/username", "getUsername");
    }

    public String getUsername() {
        return "Mark Zuckerberg";
    }
}
