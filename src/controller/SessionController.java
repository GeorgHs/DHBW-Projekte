package controller;

import com.auth0.jwt.*;
import com.auth0.jwt.algorithms.*;
import com.auth0.jwt.exceptions.*;
import com.auth0.jwt.interfaces.DecodedJWT;

import javax.websocket.Session;
import java.util.HashMap;
import java.util.Map;

public class SessionController {
    private static String secret = "secret";
    private static Map<String, Session> socket_sessions = new HashMap<>();

    public static void saveWebsocketSession(String user_identifier, Session session) {
        socket_sessions.put(user_identifier, session);
    }

    public static Session getWebsocketSession(String user_identifier) {
        return socket_sessions.get(user_identifier);
    }

    public static String createJWT(String subject) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(secret);
            return JWT.create()
                    .withIssuer("auth0")
                    .withSubject(subject)
                    .sign(algorithm);
        } catch (JWTCreationException exception){
            //Invalid Signing configuration / Couldn't convert Claims.
        }
        return null;
    }

    public static DecodedJWT decodeJWT(String token) {
        if (token == null || token.length() == 0) {
            return null;
        }
        try {
            Algorithm algorithm = Algorithm.HMAC256(secret);
            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer("auth0")
                    .build(); //Reusable verifier instance
            return verifier.verify(token);
        } catch (JWTVerificationException exception){
            //Invalid signature/claims
        }
        return null;
    }
}
