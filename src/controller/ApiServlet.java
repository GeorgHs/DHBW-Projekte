package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;

/**
 * Main API Controller
 */
@WebServlet(name = "controller.ApiServlet", urlPatterns={"/api/*"})
public class ApiServlet extends HttpServlet {
    private BaseApiController[] controllers;

    @Override
    public void init() throws ServletException {
        super.init();
        this.controllers = new BaseApiController[] {
                new ProfileApiController(),
                new LoginApiController(),
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

    /**
     * Leitet anfragen an den Controller weiter, der sich für die aufgerufene URL als zuständig deklariert hat
     * @param request
     * @param response
     */
    private void serviceApi(HttpServletRequest request, HttpServletResponse response){
        String url = request.getRequestURI().replace("/api/", "");
        for (BaseApiController controller : controllers) {
            String method_name = null;
            switch (request.getMethod()) {
                case "GET":
                    for(Map.Entry e : controller.getUrlMappings_Get().entrySet()) {
                        if (url.startsWith(e.getKey().toString())) {
                            method_name = e.getValue().toString();
                        }
                    }
                    break;
                case "POST":
                    for(Map.Entry e : controller.getUrlMappings_Post().entrySet()) {
                        if (url.startsWith(e.getKey().toString())) {
                            method_name = e.getValue().toString();
                        }
                    }
                    break;
                case "PUT":
                    for(Map.Entry e : controller.getUrlMappings_Put().entrySet()) {
                        if (url.startsWith(e.getKey().toString())) {
                            method_name = e.getValue().toString();
                        }
                    }
                    break;
                case "DELETE":
                    for(Map.Entry e : controller.getUrlMappings_Delete().entrySet()) {
                        if (url.startsWith(e.getKey().toString())) {
                            method_name = e.getValue().toString();
                        }
                    }
                    break;
            }
            if (method_name != null) {
                try {
                    Method method = controller.getClass().getDeclaredMethod(method_name, HttpServletRequest.class, HttpServletResponse.class);
                    method.invoke(controller, request, response);
                    break;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                response.setStatus(404);
            }
        }
    }
}
