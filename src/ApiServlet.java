import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "ApiServlet", urlPatterns={"/api/*"})
public class ApiServlet extends HttpServlet {
    private BaseApi[] controllers;

    @Override
    public void init() throws ServletException {
        super.init();
        this.controllers = new BaseApi[] {
                new ProfileApi(),
        };
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        serviceApi(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        serviceApi(request, response);
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        serviceApi(request, response);
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        serviceApi(request, response);
    }

    private void serviceApi(HttpServletRequest request, HttpServletResponse response){
        String url = request.getRequestURI().replace("/api/", "");
        for (BaseApi controller : controllers) {
            String method_name = null;
            switch (request.getMethod()) {
                case "GET":
                    method_name = controller.getUrlMappings_Get().get(url);
                    break;
                case "POST":
                    method_name = controller.getUrlMappings_Post().get(url);
                    break;
                case "PUT":
                    method_name = controller.getUrlMappings_Put().get(url);
                    break;
                case "DELETE":
                    method_name = controller.getUrlMappings_Delete().get(url);
                    break;
            }
            if (method_name != null) {
                try {
                    Method method = controller.getClass().getDeclaredMethod(method_name, HttpServletRequest.class, HttpServletResponse.class);
                    method.invoke(controller, request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
