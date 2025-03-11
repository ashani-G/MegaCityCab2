<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Drivers</title>
    <link rel="stylesheet" href="../css/ManageDrivers.css"> <!-- Link to updated CSS -->
</head>
<body>

    <div class="container">
        <header>
            <h2>Manage Drivers</h2>
            <p>Add new drivers and manage existing ones.</p>
        </header>

        <!-- Add Driver Section -->
        <section class="add-driver-form">
            <h3>Add New Driver</h3>
            <form action="/MegaCityCab/AddDriverServlet" method="POST">
                <div class="form-group">
                    <label for="driver_name">Driver Name:</label>
                    <input type="text" name="driver_name" required>
                </div>
                
                <div class="form-group">
                    <label for="license_number">License Number:</label>
                    <input type="text" name="license_number" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" name="phone" required>
                </div>
                
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select name="status">
                        <option value="Available">Available</option>
                        <option value="Assigned">Assigned</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="submit-button">Add Driver</button>
                </div>
            </form>
        </section>

        <!-- Display Existing Drivers -->
        <section class="existing-drivers">
            <h3>Existing Drivers</h3>
            <table>
                <thead>
                    <tr>
                        <th>Driver Name</th>
                        <th>License Number</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Fetch drivers' data from the database
                        String query = "SELECT * FROM drivers";
                        Connection connection = DBConnection.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(query);

                        if (resultSet != null) {
                            while (resultSet.next()) {
                    %>
                        <tr>
                            <td><%= resultSet.getString("driver_name") %></td>
                            <td><%= resultSet.getString("license_number") %></td>
                            <td><%= resultSet.getString("phone") %></td>
                            <td><%= resultSet.getString("status") %></td>
                            <td>
                                <a href="updateDriver.jsp?id=<%= resultSet.getInt("driver_id") %>" class="action-button update-button">Update</a> |
                                <a href="deleteDriver.jsp?id=<%= resultSet.getInt("driver_id") %>" class="action-button delete-button">Delete</a>
                            </td>
                        </tr>
                    <% 
                            }
                        } else {
                            out.println("<tr><td colspan='5'>No drivers found.</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </section>
    </div>

</body>
</html>
