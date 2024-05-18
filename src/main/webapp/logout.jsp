<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.*,java.sql.*"%>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <%
       session.removeAttribute("name");
    session.removeAttribute("cart_li");
    	response.sendRedirect("index.jsp");
    %>
</body>
</html>
