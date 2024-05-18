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
            Connection conn = DriverManager.getConnection(url, "root", "password123");
            Statement st = conn.createStatement();
            
            ArrayList<Integer> cart_li = (ArrayList<Integer>) session.getAttribute("cart_li");
            String name = session.getAttribute("name") + "";
            
            for (int id : cart_li) {
                String qry = "SELECT * FROM products WHERE id=" + id;
                ResultSet rs = st.executeQuery(qry);
                if (rs.next()) {
                    String p_name = rs.getString("p_name");
                    String price = rs.getString("price");
                    String qry2 = "INSERT INTO orders (prod_name, price, customer_name) VALUES ('" + p_name + "', '" + price + "', '" + name + "')";
                    st.executeUpdate(qry2);
                }
            }
            
            out.print("<script>alert('Order successful'); window.location.href='index.jsp';</script>");
            
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
