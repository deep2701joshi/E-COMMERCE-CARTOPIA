<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.*,java.sql.*"%>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <section class="featured section" id="featured">
        <h2 class="section-title">EXPLORE PRODUCTS</h2>
        <a href="#" class="section-all">View All</a>

        <div class="featured__container bd-grid">
            <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/ecomm";
                Connection conn = DriverManager.getConnection(url, "root", "password123");
                Statement st = conn.createStatement();
                String p_name = request.getParameter("p_name");
                System.out.println("DELET PROD"+p_name);
                String qry = "DELETE FROM products WHERE p_name='" + p_name + "'";
                int rowsAffected = st.executeUpdate(qry);
                out.println("Rows affected: " + rowsAffected);
      
                conn.close();
            } catch (ClassNotFoundException e) {
                // Handle the exception if the driver class is not found
                e.printStackTrace();
            } catch (SQLException ex) {
                // Handle SQL exceptions
                ex.printStackTrace();
            }
            response.sendRedirect("product.jsp");
            %>
        </div>
    </section>
</body>
</html>
