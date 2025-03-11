<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manager Dashboard</title>
    <link rel="stylesheet" href="../css/ManagerDashboard.css">
</head>
<body>

    <div class="manager-dashboard-container">
        <div class="manager-dashboard-box">
            <!-- Header Section -->
            <header>
                <h1>Welcome Manager</h1>
                <p>Manage bookings, cars, and drivers efficiently</p>
            </header>

            <!-- Dashboard Content Section -->
            <section class="dashboard-content">
                <!-- View Bookings Section -->
                <div class="dashboard-section">
                    <h3>View Bookings</h3>
                    <p>Here you can view and manage bookings.</p>
                    <a href="viewbookings.jsp" class="button">Go to Bookings</a>
                </div>

                <!-- Manage Cars Section -->
                <div class="dashboard-section">
                    <h3>Manage Cars</h3>
                    <p>Here you can add new cars and view existing ones.</p>
                    <a href="add_car.jsp" class="button">Add New Car</a>
                    <a href="view_cars.jsp" class="button">View Cars</a>
                </div>

                <!-- Manage Drivers Section -->
                <div class="dashboard-section">
                    <h3>Manage Drivers</h3>
                    <p>Here you can add new drivers and view existing ones.</p>
                    <a href="add_driver.jsp" class="button">Add New Driver</a>
                    <a href="view_drivers.jsp" class="button">View Drivers</a>
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
