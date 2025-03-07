<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/admin_dashboard.css">
</head>
<body>

    <div class="admin-dashboard-container">
        <div class="admin-dashboard-box">
            <!-- Header Section -->
            <header>
                <h1>Welcome Admin</h1>
                <p>Manage the system efficiently</p>
            </header>

            <!-- Dashboard Content Section -->
            <section class="dashboard-content">
                <!-- Manage Users Section -->
                <div class="dashboard-section">
                    <h3>Manage Users</h3>
                    <p>Here you can manage user accounts.</p>
                    <a href="manageUsers.jsp" class="button">Go to User Management</a>
                </div>

                <!-- System Settings Section -->
                <div class="dashboard-section">
                    <h3>System Settings</h3>
                    <p>Manage system settings and configurations.</p>
                    <a href="systemSettings.jsp" class="button">Go to System Settings</a>
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
