<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="../css/UserDashboard.css">
</head>
<body>
    <%
        // Retrieve the user object from the existing session
        User user = (User) request.getSession(false).getAttribute("user");

        // If the user is not logged in, redirect to the login page
        if (user == null) {
            response.sendRedirect("views/login.jsp?error=Please%20login%20first");
            return;
        }
    %>

    <div class="dashboard-container">
        <div class="dashboard-box">
            <!-- Header Section -->
            <header>
                <h1>Welcome, <%= user.getUsername() %>!</h1>
                <p>Manage your rides from here</p>
            </header>

            <!-- Dashboard Content Section -->
            <section class="dashboard-content">
                <!-- Book a Ride Section -->
                <div class="dashboard-section">
                    <h3>Book a Ride</h3>
                    <p>Book your next ride in just a few clicks.</p>
                    <a href="booking.jsp" class="button">Go to Booking</a>
                </div>

                <!-- View Past Bookings Section -->
                <div class="dashboard-section">
                    <h3>Your Past Bookings</h3>
                    <p>View details of your previous rides.</p>
                    <a href="ViewMyBookings.jsp" class="button">View My Bookings</a>
                </div>

                <!-- Logout Button -->
                <div class="logout-section">
                    <a href="/MegaCityCab/LogoutServlet" class="button logout-btn">Logout</a>
                </div>
            </section>
        </div>
    </div>
</body>
</html>
