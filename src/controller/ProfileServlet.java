package controller;

import com.auth0.jwt.JWT;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile/*"})
public class ProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String t = request.getRequestURI();
        if (request.getRequestURI().lastIndexOf('/') == 0) {
            request.setAttribute("id", SessionController.getCurrentUserId(request));
            request.setAttribute("edit", true);
        } else {
            request.setAttribute("id", request.getRequestURI().substring(request.getRequestURI().lastIndexOf('/') + 1));
            request.setAttribute("tokenId", SessionController.getCurrentUserId(request));
            request.setAttribute("edit", false);
        }

        getServletContext().getRequestDispatcher("/views/profile.jsp").forward(request, response);
    }
}
