import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ProfileApi extends BaseApi {

    ProfileApi() {
        super();
        this.addUrlMapping_Get("profile/username", "getUsername");
    }

    public void getUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("Elon Musk");
    }
}
