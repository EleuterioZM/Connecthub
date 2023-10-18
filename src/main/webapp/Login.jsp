<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
</head>
<body>
   <header>
    <div class="menu_cadastro">
        <div class="leftmenu">
            <h4> C O N N E C T _ H U B </h4>
        </div>
        <div class="rightmenu">
            <ul>
                <li >Home</li>
                <li>Services</li>
                <li>Work</li>
            </ul>
        </div>
    </div>
   </header>
    <div class="bgimage1">
    </div>
    
    
    <%@page import="java.sql.ResultSet"%>
<%@page import="Conexao.DatabaseConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
    <%
String username = request.getParameter("username");
String password = request.getParameter("password");

Connection conn = DatabaseConnection.getConnection();
boolean userAuthenticated = false;

try {
    String sql = "SELECT * FROM usuarios";
    PreparedStatement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery();

    while (rs.next()) {
        String dbUsername = rs.getString("username");
        String dbPassword = rs.getString("password");

        if (username.equals(dbUsername) && password.equals(dbPassword)) {
            userAuthenticated = true;
            session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
            break; // Saia do loop se o usuário for autenticado
        }
    }

    if (!userAuthenticated) {
        response.sendRedirect("Cadastrar.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
 
}
%>
   
    
    <form method="post" >
        <h3>L O G I N</h3>
        <label for="username">Username</label>
        <input type="text" placeholder="Username" name="username" id="username">
        <label for="password">Password</label>
        <input type="password" placeholder="Password" name="password" id="password">
        <button type="submit">Entrar</button>
      <a href="Cadastrar.jsp" class="link"> Cadastrar-se!</a>
    </form>
   

</body>
</html>
