<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
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

    <form method="post" >
        <h3>C A D A S T R O</h3>

        <label for="username">Username</label>
        <input type="text" placeholder="Username" name="username" id="username" required >

        <label for="password">Password</label>
        <input type="password" placeholder="Password" name="password" id="password"required  >

        <label for="phone">phone</label>
        <input type="number" placeholder="Phone" name="phone" id="phone"required  >

        <button type="submit">CADASTRAR</button>
       <a href="Login.jsp" class="link"> Ja tem uma conta, fazer login!</a>
      
    </form>


<%@ page import="Conexao.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
if (request.getMethod().equalsIgnoreCase("post")) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");

    Connection conn = DatabaseConnection.getConnection();

    try {
        String sql = "INSERT INTO usuarios (username, password, phone) VALUES (?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setString(3, phone);
        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
    	response.sendRedirect("Sucess.jsp");

    }

    // Redirecione o usuário para a página de exibição
  
}
%>

</body>
</html>
    
