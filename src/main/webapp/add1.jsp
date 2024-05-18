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
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ecomm";
            Connection conn = DriverManager.getConnection(url, "root", "password123");
            Statement st = conn.createStatement();
            String name = request.getParameter("signup-name");
            String num = request.getParameter("signup-number");
            String pass = request.getParameter("signup-password");
            String mail = request.getParameter("signup-email");
            String qry = "INSERT INTO register VALUES('" + name + "', '" + num + "', '" + mail + "', '" + pass + "')";
            int rowsAffected = st.executeUpdate(qry);
            out.println("Rows affected: " + rowsAffected);
            //out.print("<script>window.location.href='login.jsp';</script>");
             response.sendRedirect("login.jsp");
            conn.close();
        } catch (ClassNotFoundException e) {
            // Handle the exception if the driver class is not found
            e.printStackTrace();
        } catch (SQLException ex) {
            // Handle SQL exceptions
            ex.printStackTrace();
        }
    %>
</body>
</html>
