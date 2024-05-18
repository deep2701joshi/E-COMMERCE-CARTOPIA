<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.*,java.sql.*"%>
<head>
    <meta charset="UTF-8">
     <style>
        table {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }
        th {
            background-color: #ff9d5c;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }
        td {
            background-color: #f9f9f9;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        /* Fancy Text and Decoration */
        .fancy-text {
            font-size: 18px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            color: #333;
        }
        /* Animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        tr {
            animation: fadeIn 0.5s ease-in-out;
        }
    </style>
</head>
<body>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ecomm";
            Connection conn = DriverManager.getConnection(url, "root", "password123");
            String qry = "SELECT * FROM register";
            Statement st = conn.createStatement();
            ResultSet rs =st.executeQuery(qry);
            %>
            <table>
               <tr>
                   <th>Name</th>
                   <th>Phone Number</th>
                   <th>Email-id</th>
               </tr>
               <% while(rs.next()){ %>
                   <tr>
                       <td class="fancy-text"><%= rs.getString("name") %></td>
                       <td class="fancy-text"><%= rs.getString("number") %></td>
                       <td class="fancy-text"><%= rs.getString("email") %></td>
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
