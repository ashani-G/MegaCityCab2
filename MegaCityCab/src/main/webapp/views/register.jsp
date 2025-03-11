<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="../css/register.css">
</head>
<body>
    <div class="container">
        <div class="register-box">
          
            <h2>User Registration</h2>

            <form action="/MegaCityCab/RegisterServlet" method="post">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" required>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" required>
                </div>

                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" required>
                </div>

                <div class="input-group">
                    <label for="phone">Phone</label>
                    <input type="text" name="phone" required>
                </div>

                <div class="input-group">
                    <label for="name">Full Name</label>
                    <input type="text" name="name" required>
                </div>

                <div class="input-group">
                    <label for="address">Address</label>
                    <textarea name="address" required></textarea>
                </div>

                <div class="input-group">
                    <label for="nic">NIC Number</label>
                    <input type="text" name="nic" required>
                </div>

                <button type="submit" class="register-btn">Register</button>
            </form>

            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>
