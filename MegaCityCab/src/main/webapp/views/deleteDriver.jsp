<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Driver</title>
    <link rel="stylesheet" href="../css/DeleteDriver.css"> <!-- Link to updated CSS -->
</head>
<body>

    <div class="container">
        <header>
            <h2>Delete Driver</h2>
        </header>

        <section class="delete-driver-form">
            <%
                // Retrieve driver_id from the query parameter
                int driverId = Integer.parseInt(request.getParameter("id"));

                // Query to fetch the driver details by driver_id
                String query = "SELECT * FROM drivers WHERE driver_id = ?";
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setInt(1, driverId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    String driverName = resultSet.getString("driver_name");
            %>

            <p>Are you sure you want to delete the driver <strong><%= driverName %></strong>?</p>

            <form action="/MegaCityCab/DeleteDriverServlet" method="POST">
                <input type="hidden" name="driver_id" value="<%= driverId %>">
                
                <div class="form-actions">
                    <button type="submit" class="submit-button">Yes, Delete</button>
                    <a href="/MegaCityCab/views/manageDrivers.jsp" class="cancel-button">Cancel</a>
                </div>
            </form>

            <% 
                } else {
                    out.println("<p class='error-msg'>Error: Driver not found.</p>");
                }
            %>
        </section>
    </div>

</body>
</html>
