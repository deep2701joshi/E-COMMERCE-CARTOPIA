<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.*,java.sql.*"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="cart">
    <%try{
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ecomm";
            conn = DriverManager.getConnection(url, "root", "password123");
            st = conn.createStatement();
            ArrayList<Integer> cart_li = (ArrayList<Integer>) session.getAttribute("cart_li");
            int id_m=Integer.parseInt(request.getParameter("id"));
            cart_li.add(id_m);
            session.setAttribute("cart_li",cart_li);
            response.sendRedirect("cart.jsp");
    }catch(Exception e){
    	e.printStackTrace();
    }
 %>
                
        <div class="total">
            <!-- Display total price here if needed -->
            <button id="buy-now-btn">Buy Now</button>
        </div>
    </div>
</body>
</html>
