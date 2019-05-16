package controller;

import javax.websocket.*;
import javax.websocket.server.*;
import java.io.IOException;

@ServerEndpoint("/push")
public class WebsocketController {

    @OnOpen
    public void onOpen(Session session) throws IOException {
        // Get session and WebSocket connection
        String token = session.getRequestParameterMap().get("token").get(0);
    }

    @OnMessage
    public void onMessage(String message, final Session session) {
        System.out.println("Message from " + session.getId() + ": " + message);
    }

    @OnClose
    public void onClose(Session session) throws IOException {
        // WebSocket connection closes
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Do error handling here
    }
}