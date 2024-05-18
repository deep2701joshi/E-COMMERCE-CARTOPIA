<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Sign Up</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <div class="signup-form">
            <h2 class="section-title">Sign Up</h2>
            <form action="add1.jsp">
                <div class="form-group">
                    <label for="signup-name">Name</label>
                    <input type="text" id="signup-name" name="signup-name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="signup-number">Contect Number</label>
                    <input type="text" id="signup-number" name="signup-number" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="signup-email">Email</label>
                    <input type="email" id="signup-email" name="signup-email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="signup-password">Password</label>
                    <input type="password" id="signup-password" name="signup-password" class="form-control" required>
                </div>
                <button type="submit" class="button">Sign Up</button>
            </form>
        </div>
    </div>
</body>
</html>
 