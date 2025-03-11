<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Driver</title>
    <link rel="stylesheet" href="../css/add_driver.css">
</head>
<body>

    <div class="add-driver-container">
        <div class="add-driver-box">
            <h2>Add New Driver</h2>

            <form action="/MegaCityCab/AddDriverServlet" method="post">
                <div class="input-group">
                    <label for="driverName">Driver Name</label>
                    <input type="text" id="driverName" name="driverName" required />
                </div>

                <div class="input-group">
                    <label for="licenseNumber">License Number</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" required />
                </div>

                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" required />
                </div>

                <button type="submit" class="add-btn">Add Driver</button>
                <button type="button" class="back-btn" onclick="window.location.href='managerdashboard.jsp'">Back</button>
            </form>

            <% if(request.getParameter("error") != null) { %>
                <p class="error-msg"><%= request.getParameter("error") %></p>
            <% } %>
        </div>
    </div>

</body>
</html>
