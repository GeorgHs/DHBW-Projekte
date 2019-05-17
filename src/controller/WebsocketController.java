package controller;

import com.auth0.jwt.interfaces.DecodedJWT;

import javax.websocket.*;
import javax.websocket.server.*;
import java.io.IOException;

@ServerEndpoint("/push")
public class WebsocketController {

    @OnOpen
    public void onOpen(Session session) throws IOException {
        // Get session and WebSocket connection
        String token = session.getRequestParameterMap().get("token").get(0);
        DecodedJWT jwt = SessionController.decodeJWT(token);
        if (jwt != null) {
            SessionController.saveWebsocketSession(jwt.getSubject(), session);
        }
    }

    @OnMessage
    public void onMessage(String message, final Session session) {
        System.out.println("Message from " + session.getId() + ": " + message);
    }

    @OnClose
    public void onClose(Session session) throws IOException {
        // WebSocket connection closes
        String token = session.getRequestParameterMap().get("token").get(0);
        DecodedJWT jwt = SessionController.decodeJWT(token);
        if (jwt != null) {
            SessionController.deleteWebsocketSession(jwt.getSubject());
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Do error handling here
    }
}