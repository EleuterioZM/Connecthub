<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Web - Cliente</title>
    <link href="../style.css" rel="stylesheet">
    <style>
        .chat-input {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .mensagem {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        #enviar {
            margin-left: 10px;
            background-color: #0074d9;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        #limpar {
            margin-left: 10px;
            background-color: red;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        

        #chat-messages {
            margin-top: 20px;
        }

        .message {
            background-color: #f4f4f4;
            padding: 10px;
            border-radius: 5px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
   <header>
        <div class="menu_cadastro">
            <div class="leftmenu">
                <h4> C O N N E C T _ H U B </h4>
            </div>

            <div class="rightmenu">
                <ul>
                    <li>Home</li>
                    <li>Services</li>
                    <li>Work</li>
                </ul>
            </div>
        </div>
   </header>
   <div id="chat-messages">
        <!-- As mensagens do chat serão exibidas aqui -->
        <%
            List<String> chatMessages = new ArrayList<String>();

            if (request.getMethod().equalsIgnoreCase("POST")) {
                // Se o método da solicitação for POST, significa que uma mensagem foi enviada
                String mensagemRecebida = request.getParameter("mensagem");
                chatMessages.add("Servidor: " + mensagemRecebida);
            }

            for (String message : chatMessages) {
                out.println("<div class='message'>" + message + "</div>");
            }
        %>
    </div>
    <div class="chat-input">
        <form action="Server.jsp" method="post"> <!-- Envie o formulário de volta para chat.jsp -->
            <input style="height: 100px" name="mensagem" class="mensagem" id="mensagem" placeholder="Digite sua mensagem..." />
            <button type="submit" id="enviar" style="width: 100px; margin-top: 150px;">Enviar</button>
            <button type="submit" id="limpar" style="width: 100px; margin-top: 150px; margin-left: 20px">Limpar</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
