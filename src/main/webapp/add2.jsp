<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
            String mail = request.getParameter("email").trim();
            System.out.println(mail);
            String pass = request.getParameter("password");

            Connection conn = DriverManager.getConnection(url, "root", "password123");
            String qry = "SELECT * FROM REGISTER WHERE email='" + mail + "'";
            Statement st = conn.createStatement();
            ResultSet rs =st.executeQuery(qry);
            
            if (!rs.next()) {
                // Email doesn't exist in the database
                out.print("Username invalid");
            } else {
                String storedPassword = rs.getString("password");
                if (!storedPassword.equals(pass)) {
                    // Invalid password
                    out.print("Invalid password");
                    response.sendRedirect("login.jsp");
                } else {
                    // Successful login
                    ArrayList<Integer>cart_li=new ArrayList<>();
                    session.setAttribute("name",rs.getString("name"));
                    session.setAttribute("cart_li",cart_li);
                    session.setAttribute("email",mail);
                    response.sendRedirect("index.jsp");
                }
            }
            conn.close();
        } catch (ClassNotFoundException e) {
            // Handle the exception if the driver class is not found
            out.print("Error: Database driver not found");
            e.printStackTrace();
        } catch (SQLException ex) {
            // Handle SQL exceptions
            out.print("Error: SQL Exception occurred");
            ex.printStackTrace();
        }
    %>
</body>
</html>
