<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Car</title>
    <link rel="stylesheet" href="../css/delete_car.css"> <!-- Link to the new CSS -->
</head>
<body>
    <div class="container">
        <header>
            <h1>Delete Car</h1>
        </header>

        <% 
            // Retrieve the car_id from the request URL
            String carIdParam = request.getParameter("car_id");

            if (carIdParam == null || carIdParam.isEmpty()) {
                out.println("<p class='error'>Error: Car ID is missing or invalid!</p>");
            } else {
                try {
                    // Parse the car_id parameter if it's valid
                    int carId = Integer.parseInt(carIdParam);

                    // SQL query to fetch the car details based on the car_id
                    String query = "SELECT * FROM cars WHERE car_id = ?";
                    
                    // Establish a connection to the database
                    Connection connection = DBConnection.getConnection();
                    PreparedStatement statement = connection.prepareStatement(query);
                    statement.setInt(1, carId);
                    ResultSet resultSet = statement.executeQuery();

                    if (resultSet.next()) {
        %>

        <div class="confirmation-box">
            <h2>Are you sure you want to delete the following car?</h2>
            <table>
                <tr>
                    <th>Car ID</th>
                    <td><%= resultSet.getInt("car_id") %></td>
                </tr>
                <tr>
                    <th>Car Model</th>
                    <td><%= resultSet.getString("car_model") %></td>
                </tr>
                <tr>
                    <th>Car Number</th>
                    <td><%= resultSet.getString("car_number") %></td>
                </tr>
                <tr>
                    <th>Car Type</th>
                    <td><%= resultSet.getString("car_type") %></td>
                </tr>
                <tr>
                    <th>Capacity</th>
                    <td><%= resultSet.getInt("capacity") %></td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td><%= resultSet.getString("status") %></td>
                </tr>
            </table>

            <form action="/MegaCityCab/deleteCarServlet" method="GET">
                <input type="hidden" name="car_id" value="<%= carId %>">
                <button type="submit" class="delete-button">Yes, Delete Car</button>
            </form>
            
            <br>
            <a href="view_cars.jsp" class="cancel-button">Cancel</a>
        </div>

        <% 
                    } else {
                        out.println("<p class='error'>No car found with the provided ID.</p>");
                    }

                    // Close the database resources
                    resultSet.close();
                    statement.close();
                    connection.close();

                } catch (NumberFormatException e) {
                    out.println("<p class='error'>Error: Invalid Car ID format. It should be a number.</p>");
                }
            }
        %>
    </div>
</body>
</html>
