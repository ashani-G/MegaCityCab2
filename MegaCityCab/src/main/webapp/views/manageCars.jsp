<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars</title>
    <link rel="stylesheet" href="../css/ManageCars.css"> <!-- Link to updated CSS -->
</head>
<body>
    <div class="container">
        <header>
            <h2>Manage Cars</h2>
            <p>Add new cars and manage existing ones.</p>
        </header>

        <section class="add-car-form">
            <h3>Add a New Car</h3>
            <form action="/MegaCityCab/AddCarServlet" method="post">
                <div class="form-group">
                    <label for="carModel">Car Model:</label>
                    <input type="text" id="carModel" name="carModel" required />
                </div>

                <div class="form-group">
                    <label for="carNumber">Car Number:</label>
                    <input type="text" id="carNumber" name="carNumber" required />
                </div>

                <div class="form-group">
                    <label for="carType">Car Type:</label>
                    <select id="carType" name="carType">
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                        <option value="Mini">Mini</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="capacity">Capacity:</label>
                    <input type="number" id="capacity" name="capacity" required />
                </div>

                <div class="form-group">
                    <button type="submit" class="submit-btn">Add Car</button>
                </div>
            </form>
        </section>

        <section class="existing-cars">
            <h3>Existing Cars</h3>
            <table>
                <thead>
                    <tr>
                        <th>Car Model</th>
                        <th>Car Number</th>
                        <th>Car Type</th>
                        <th>Capacity</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Fetch cars from the database
                        String query = "SELECT * FROM cars";
                        Connection connection = DBConnection.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(query);

                        while (resultSet.next()) {
                    %>
                    <tr>
                        <td><%= resultSet.getString("car_model") %></td>
                        <td><%= resultSet.getString("car_number") %></td>
                        <td><%= resultSet.getString("car_type") %></td>
                        <td><%= resultSet.getInt("capacity") %></td>
                        <td><%= resultSet.getString("status") %></td>
                        <td>
                            <a href="/MegaCityCab/UpdateCarServlet?car_id=<%= resultSet.getInt("car_id") %>" class="btn btn-update">Update</a> |
                            <a href="/MegaCityCab/DeleteCarServlet?car_id=<%= resultSet.getInt("car_id") %>" class="btn btn-delete">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </section>
    </div>
</body>
</html>
