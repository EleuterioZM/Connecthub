import org.java_websocket.WebSocket;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

import java.net.InetSocketAddress;

public class WebSocketChatServer extends WebSocketServer {

    public WebSocketChatServer(int port) {
        super(new InetSocketAddress(port));
    }

    @Override
    public void onOpen(WebSocket conn, ClientHandshake handshake) {
        System.out.println("Nova conexão: " + conn.getRemoteSocketAddress());
    }

    @Override
    public void onClose(WebSocket conn, int code, String reason, boolean remote) {
        System.out.println("Conexão fechada: " + conn.getRemoteSocketAddress());
    }

    @Override
    public void onMessage(WebSocket conn, String message) {
        System.out.println("Mensagem recebida: " + message);
        
        // Enviar a mensagem de volta para todos os clientes conectados
        broadcast(message);
    }

    @Override
    public void onError(WebSocket conn, Exception ex) {
        System.err.println("Erro: " + ex.getMessage());
    }

    public static void main(String[] args) {
        int port = 8887; // Porta do servidor WebSocket
        WebSocketChatServer server = new WebSocketChatServer(port);
        server.start();
        System.out.println("Servidor WebSocket iniciado na porta " + port);
    }
}
