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
    <%	
    	if(session.getAttribute("name")==null){
    		response.sendRedirect("login.jsp");
    	}
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        int sum=0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ecomm";
            conn = DriverManager.getConnection(url, "root", "password123");
            st = conn.createStatement();
            
            ArrayList<Integer> cart_li = (ArrayList<Integer>) session.getAttribute("cart_li");
            for (int id : cart_li) {
                String qry = "SELECT * FROM products WHERE id=" + id;
                rs = st.executeQuery(qry);

                if (rs.next()) {
                    String p_name = rs.getString("p_name");
                    String imgName = rs.getString("img");
                    String imgSrc = "img/" + imgName;
                    int price = Integer.parseInt(rs.getString("price"));
                    sum+=price;
                    %>
                    <div class="product">
                        <img src="<%= imgSrc %>" alt="Product Image">
                        <div class="details">
                            <p class="name"><%= p_name %></p>
                            <p class="price">$<%= price %></p>
                             
                            <form action="remove_from_cart.jsp" method="post">
                                <input type="hidden" name="productId" value="<%= id %>">
                                <button id="buy-now-btn" type="submit">Remove</button>
                            </form>
                        </div>
                    </div>
                    <%
                }
            }
    } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
                
        <div class="total">
            <!-- Display total price here if needed -->
            <p>Total:<%= sum %></p>
            <button id="buy-now-btn"><a href="product.jsp"<%=sum%>>Buy More</a></button>
            <button id="buy-now-btn"><a href="buy.jsp"<%=sum%>>Buy Now</a></button>
        </div>
    </div>
</body>
</html>
