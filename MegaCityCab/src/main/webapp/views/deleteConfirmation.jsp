<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User Confirmation</title>
    <link rel="stylesheet" href="../css/DeleteUser.css"> <!-- Link to the updated CSS -->
</head>
<body>

    <div class="container">
        <header>
            <h2>Are you sure you want to delete this user?</h2>
        </header>

        <section class="user-info">
            <%
                // Get user details based on the ID from the URL parameter
                int userId = Integer.parseInt(request.getParameter("id"));
                String query = "SELECT * FROM users WHERE user_id = ?";
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setInt(1, userId);
                ResultSet resultSet = statement.executeQuery();
                
                if (resultSet.next()) {
            %>
            
            <form action="/MegaCityCab/DeleteUserServlet" method="GET">
                <input type="hidden" name="id" value="<%= userId %>">

                <div class="user-details">
                    <p><strong>Username:</strong> <%= resultSet.getString("username") %></p>
                    <p><strong>Email:</strong> <%= resultSet.getString("email") %></p>
                    <p><strong>Phone:</strong> <%= resultSet.getString("phone") %></p>
                    <p><strong>Role:</strong> <%= resultSet.getString("role") %></p>
                </div>

                <div class="action-buttons">
                    <button type="submit" class="delete-button">Yes, Delete User</button>
                    <a href="/MegaCityCab/views/manageUsers.jsp" class="cancel-button">Cancel</a>
                </div>
            </form>

            <% } else { %>
                <p class="error-msg">User not found!</p>
            <% } %>
        </section>
    </div>

</body>
</html>
