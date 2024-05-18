<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.*,java.sql.*"%>
<head>
    <meta charset="UTF-8">
    <style>
        /* Resetting default margin and padding */
        body, h1, h2, h3, h4, h5, h6, p, blockquote, pre, dl, dd, ol, ul, figure, hr, fieldset, legend, textarea, th, td {
            margin: 0;
            padding: 0;
        }

        /* Setting font family */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #ff9d5c;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Fancy text for IDs */
        .fancy-id {
            font-weight: bold;
            color: #007bff;
        }

        /* Currency styling for prices */
        .price {
            font-weight: bold;
            color: #28a745;
        }

        /* Highlight customer names */
        .customer {
            font-weight: bold;
            color: #dc3545;
        }
    </style>
</head>
<body>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ecomm";
            Connection conn = DriverManager.getConnection(url, "root", "password123");
            String qry = "SELECT * FROM orders";
            Statement st = conn.createStatement();
            ResultSet rs =st.executeQuery(qry);
            %>
            <table>
               <tr>
                   <th>ID</th>
                   <th>Product</th>
                   <th>Customer</th>
                   <th>Price</th>
               </tr>
               <% while(rs.next()){ %>
                   <tr>
                       <td class="fancy-id"><%= rs.getString("id") %></td>
                       <td><%= rs.getString("prod_name") %></td>
                       <td class="customer"><%= rs.getString("customer_name") %></td>
                       <td class="price">$<%= rs.getString("price") %></td>
                   </tr>
               <% } %>
           </table>
           <% conn.close();
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
