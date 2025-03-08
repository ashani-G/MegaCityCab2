<%@ page import="java.util.List, model.Driver, dao.DriverDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Driver Management</title>
    <link rel="stylesheet" href="../css/view_drivers.css">
</head>
<body>

    <div class="driver-management-container">
        <!-- Back Button Positioned at the Top Left -->
        <div class="back-button-container">
            <button class="back-button" type="button" onclick="window.location.href='managerdashboard.jsp'">Back</button>
        </div>

        <h2>Driver List</h2>

        <% if(request.getParameter("message") != null) { %>
            <p class="success-msg"><%= request.getParameter("message") %></p>
        <% } %>

        <div class="table-container">
            <table>
                <tr>
                    <th>Driver Name</th>
                    <th>License Number</th>
                    <th>Phone Number</th>
                    <th>Status</th>
                </tr>
                <%
                    DriverDAO driverDAO = new DriverDAO();
                    List<Driver> drivers = driverDAO.getAllDrivers();
                    for (Driver driver : drivers) {
                %>
                <tr>
                    <td><%= driver.getDriverName() %></td>
                    <td><%= driver.getLicenseNumber() %></td>
                    <td><%= driver.getPhone() %></td>
                    <td><%= driver.getStatus() %></td>
                </tr>
                <% } %>
            </table>
        </div>
    </div>

</body>
</html>
