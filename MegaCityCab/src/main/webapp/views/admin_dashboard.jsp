<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/admin_dashboard.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome Admin</h1>
            <p>Manage your platform effectively with ease</p>
        </header>

        <section class="dashboard-content">
            <!-- Admin-specific content -->

            <!-- Manage Users Section -->
            <div class="section manage-users">
                <h3>Manage Users</h3>
                <p>Manage user accounts and their details.</p>
                <a href="manageUsers.jsp" class="button">Go to User Management</a>
            </div>

            <!-- View Bookings Section -->
            <div class="section view-bookings">
                <h3>View Bookings</h3>
                <p>View and manage all user bookings.</p>
                <a href="viewbookings.jsp" class="button">Go to Bookings</a>
            </div>

            <!-- Manage Cars Section -->
            <div class="section manage-cars">
                <h3>Manage Cars</h3>
                <p>Add new cars and view all available cars in the system.</p>
                <a href="manageCars.jsp" class="button">Manage Cars</a>
              <a href="view_cars.jsp" class="button" style="
    margin-top: 2px;
">View Cars</a>
            </div>

            <!-- Manage Drivers Section -->
            <div class="section manage-drivers">
                <h3>Manage Drivers</h3>
                <p>Manage drivers by adding new ones and viewing the current list.</p>
                <a href="manageDrivers.jsp" class="button">Manage Drivers</a>
                <a href="view_cars.jsp" class="button" style="
    margin-top: 2px;
">View Cars</a>
            </div>

        </section>

        <!-- Logout Section -->
        <div class="logout">
            <a href="/MegaCityCab/LogoutServlet" class="button logout-btn">Logout</a>
        </div>
    </div>
</body>
</html>
