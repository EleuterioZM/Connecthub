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
        // Este método é chamado quando um cliente se conecta ao servidor WebSocket.
        System.out.println("Nova conexão: " + conn.getRemoteSocketAddress());
        
        // Você pode realizar ações específicas quando um cliente se conecta, se necessário.
    }

    @Override
    public void onClose(WebSocket conn, int code, String reason, boolean remote) {
        // Este método é chamado quando um cliente fecha a conexão.
        System.out.println("Conexão fechada: " + conn.getRemoteSocketAddress());
        
        // Você pode realizar ações específicas quando um cliente fecha a conexão, se necessário.
    }

    @Override
    public void onMessage(WebSocket conn, String message) {
        // Este método é chamado quando o servidor recebe uma mensagem de um cliente.
        System.out.println("Mensagem recebida: " + message);
        
        // Aqui você pode processar a mensagem e decidir como responder.
        
        // Exemplo: enviar a mensagem de volta para todos os clientes conectados.
        broadcast(message);
    }

    @Override
    public void onError(WebSocket conn, Exception ex) {
        // Este método é chamado em caso de erro.
        System.err.println("Erro: " + ex.getMessage());
        
        // Você pode tratar erros de maneira apropriada.
    }

    public static void main(String[] args) {
        int port = 8887; // Porta do servidor WebSocket
        WebSocketChatServer server = new WebSocketChatServer(port);
        server.start();
        System.out.println("Servidor WebSocket iniciado na porta " + port);
    }

	@Override
	public void onStart() {
		// TODO Auto-generated method stub
		
	}
}
