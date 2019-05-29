package controller;

import com.auth0.jwt.*;
import com.auth0.jwt.algorithms.*;
import com.auth0.jwt.exceptions.*;
import com.auth0.jwt.interfaces.DecodedJWT;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class SessionController {
    private static Map<String, Session> socket_sessions = new HashMap<>();

    public static void saveWebsocketSession(String user_identifier, Session session) {
        socket_sessions.put(user_identifier, session);
    }

    public static void deleteWebsocketSession(String user_identifier) {
        socket_sessions.remove(user_identifier);
    }

    public static Session getWebsocketSessionById(String user_identifier) {
        return socket_sessions.get(user_identifier);
    }

    public static Map<String, Session> getWebsocketSessions() {
        return socket_sessions;
    }

    public static String getIdByWebsocketSession(Session session) {
        for (Map.Entry<String, Session> entry : socket_sessions.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            if (value == session) {
                return key;
            }
        }
        return null;
    }

    /**
     * Check if user is logged in and redirect to login pge if not
     *
     * @param request  http request
     * @param response http response
     */
    public static void checkLogin(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        String jwt = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                jwt = cookie.getValue();
            }
        }

        // check if not logged in
        if (SessionController.decodeJWT(jwt) == null) {
            try {
                response.sendRedirect("/login");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }



    /**
     * Create a JWT Token
     *
     * @param subject user id
     * @return jwt
     */
    public static String createJWT(String subject) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(Env.jwtsecret);
            return JWT.create()
                    .withIssuer("auth0")
                    .withSubject(subject)
                    .sign(algorithm);
        } catch (JWTCreationException exception) {
            //Invalid Signing configuration / Couldn't convert Claims.
        }
        return null;
    }

    /**
     * Decode a JWT Token
     *
     * @param token encoded jwt
     * @return decoded jwt
     */
    public static DecodedJWT decodeJWT(String token) {
        if (token == null || token.length() == 0) {
            return null;
        }
        try {
            Algorithm algorithm = Algorithm.HMAC256(Env.jwtsecret);
            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer("auth0")
                    .build(); //Reusable verifier instance
            return verifier.verify(token);
        } catch (JWTVerificationException exception) {
            //Invalid signature/claims
        }
        return null;
    }

    public static int getCurrentUserId(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String jwt = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                jwt = cookie.getValue();
            }
        }

        if (jwt == null) {
            return -1;
        }

        String id = JWT.decode(jwt).getSubject();
        return Integer.parseInt(id);
    }
}
