<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Manage Users</title>
    <link rel="stylesheet" href="../css/ManageUsers.css"> <!-- Link to updated CSS -->
</head>
<body>

    <div class="container">
        <header>
            <h2>Manage Users</h2>
            <p>Here you can add new users or manage existing ones.</p>
        </header>

        <!-- Add User Section -->
        <section class="add-user-form">
            <h3>Add New User</h3>
            <form action="/MegaCityCab/AddUserServlet" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" name="phone" required>
                </div>
                
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select name="role">
                        <option value="user">User</option>
                        <option value="admin">Admin</option>
                        <option value="manager">Manager</option>
                    </select>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="submit-button">Add User</button>
                </div>
            </form>
        </section>

        <!-- Existing Users Table Section -->
        <section class="existing-users">
            <h3>Existing Users</h3>
            <table>
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Fetch users from the database
                        String query = "SELECT * FROM users";
                        try (Connection connection = DBConnection.getConnection();
                             Statement statement = connection.createStatement();
                             ResultSet resultSet = statement.executeQuery(query)) {

                            while (resultSet.next()) {
                    %>
                        <tr>
                            <td><%= resultSet.getString("username") %></td>
                            <td><%= resultSet.getString("email") %></td>
                            <td><%= resultSet.getString("phone") %></td>
                            <td><%= resultSet.getString("role") %></td>
                            <td>
                                <a href="updateUser.jsp?id=<%= resultSet.getInt("user_id") %>" class="action-button update-button">Update</a> | 
                                <a href="deleteConfirmation.jsp?id=<%= resultSet.getInt("user_id") %>" class="action-button delete-button">Delete</a>
                            </td>
                        </tr>
                    <% 
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </section>
    </div>

</body>
</html>
