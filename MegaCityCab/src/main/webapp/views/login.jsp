<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <div class="container">
        <div class="login-box">
            <h2>Login</h2>

            <form action="/MegaCityCab/Loginservlet" method="post">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" required>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" required>
                </div>

                <% if (request.getParameter("error") != null) { %>
                    <p class="error-msg">${param.error}</p>
                <% } %>

                <button type="submit" class="login-btn">Login</button>
            </form>

            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>
