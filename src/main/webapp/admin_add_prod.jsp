<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <form class="login-form" action="add_pro.jsp">
            <div class="form-group">
                <label for="img" class="form-label">Img:</label>
                <input type="file" id="img" name="img" class="form-control">
            </div>
            <div class="form-group">
                <label for="p_name" class="form-label">Name:</label>
                <input type="text" id="p_name" name="p_name" class="form-control">
            </div>
            <div class="form-group">
                <label for="price" class="form-label">Price:</label>
                <input type="text" id="price" name="price" class="form-control">
            </div>
            <div class="form-group">
                <input type="submit" name="submit" value="Submit" class="button">
            </div>
        </form>
    </div>
</body>
</html>
