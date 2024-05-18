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
                /*String p_name = request.getParameter("p_name");
                String img = request.getParameter("img");
                String price = request.getParameter("age");
                String qry = "INSERT INTO products (p_name, img, price) VALUES ('" + p_name + "', '" + img + "', '" + price + "')";
                int rowsAffected = st.executeUpdate(qry);*/
                //out.println("Rows affected: " + rowsAffected);

                ResultSet rs = st.executeQuery("SELECT * FROM products");
                while (rs.next()) {
                    String imgName = rs.getString("img");
                    String imgSrc = "img/" + imgName; // Path to the image directory
                    System.out.println(imgSrc); // Check the printed path in the server logs

                    %>
                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="<%= imgSrc %>" class="featured__img" alt="Smartwatch F9 Negro">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name"><%= rs.getString("p_name") %></h3>
                            <span class="featured__price">$<%= rs.getString("price") %></span>
                          <button class="button" type="button"> <a href="add_cart.jsp?id=<%= rs.getString("id") %>">Add to Cart</a></button>
                       
                        </div>
                    </div>
                    <%
                }
                conn.close();
            } catch (ClassNotFoundException e) {
                // Handle the exception if the driver class is not found
                e.printStackTrace();
            } catch (SQLException ex) {
                // Handle SQL exceptions
                ex.printStackTrace();
            }
            %>
        </div>
    </section>
</body>
</html>
