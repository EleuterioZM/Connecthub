<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexao.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Conexao.DatabaseConnection" %>
<%
Connection conn = DatabaseConnection.getConnection();
String username = request.getParameter("username");
String password = request.getParameter("password");
String phone = request.getParameter("phone");

try {
    String sql = "INSERT INTO usuarios (username, password, phone) VALUES (?, ?, ?)";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, username);
    statement.setString(2, password);
    statement.setString(3, phone);
    statement.executeUpdate();
} catch (SQLException e) {
    e.printStackTrace();
}

DatabaseConnection.closeConnection();
%>
