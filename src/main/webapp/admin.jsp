<!-- admin_dashboard.jsp -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    <!-- Link your admin.css file -->
    <link rel="stylesheet"  href="css/admin.css">
</head>
<body>
    <!-- Your navigation bar -->
    <div class="nav__container">
        <div class="nav__item-wrapper">
            <a href="admin_add_prod.jsp" class="nav__link">Add Products</a>
        </div>
        <div class="nav__item-wrapper">
            <a href="admin_remove_prod.jsp" class="nav__link">Remove Products</a>
        </div>
        <div class="nav__item-wrapper">
            <a href="admin_see_products.jsp" class="nav__link active">View Products</a>
        </div>
        <div class="nav__item-wrapper">
            <a href="admin_see_orders.jsp" class="nav__link">View Orders</a>
        </div>
        <div class="nav__item-wrapper">
            <a href="admin_see_users.jsp" class="nav__link">View Users</a>
        </div>
        <div class="nav__item-wrapper">
            <a href="index.jsp" class="nav__link">Home page</a>
        </div>
    </div>
</body>
</html>
