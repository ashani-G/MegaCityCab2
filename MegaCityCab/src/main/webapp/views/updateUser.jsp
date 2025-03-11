<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link rel="stylesheet" href="../css/UpdateUser.css"> <!-- Link to the updated CSS -->
</head>
<body>

    <div class="container">
        <header>
            <h2>Update User</h2>
        </header>

        <% 
            int userId = Integer.parseInt(request.getParameter("id"));
            String query = "SELECT * FROM users WHERE user_id = ?";
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
        %>

        <section class="update-user-form">
            <form action="/MegaCityCab/UpdateUserServlet" method="POST">
                <input type="hidden" name="userId" value="<%= userId %>">
                
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" value="<%= resultSet.getString("username") %>" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" value="<%= resultSet.getString("email") %>" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" name="phone" value="<%= resultSet.getString("phone") %>" required>
                </div>
                
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select name="role">
                        <option value="user" <% if (resultSet.getString("role").equals("user")) { %>selected<% } %>>User</option>
                        <option value="admin" <% if (resultSet.getString("role").equals("admin")) { %>selected<% } %>>Admin</option>
                    </select>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="submit-button">Update User</button>
                </div>
            </form>
        </section>

        <% } else { %>
            <p class="error-msg">User not found.</p>
        <% } %>
    </div>

</body>
</html>
