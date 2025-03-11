<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.BookingDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Bookings</title>
    <link rel="stylesheet" href="../css/ViewMybookings.css">
</head>
<body>

    <div class="my-bookings-container">
        <!-- Back Button Positioned at the Top Left -->
        <div class="back-button-container">
            <button class="back-button" type="button" onclick="window.location.href='/MegaCityCab/views/homedashboard.jsp'">Back</button>
        </div>

        <h2>My Bookings</h2>

        <%
            // Get the logged-in user from the session
            User loggedInUser = (User) session.getAttribute("user");

            // Debugging: Print the session info
            if (loggedInUser != null) {
                System.out.println("User " + loggedInUser.getUsername());
            } else {
                System.out.println("No logged-in user found in session.");
            }

            // Check if the user is logged in
            if (loggedInUser == null) {
        %>
            <p class="error-msg">You must log in to view your bookings.</p>
        <%
            } else {
                // Retrieve all bookings for the logged-in user
                BookingDAO bookingDAO = new BookingDAO();
                List<Booking> bookings = bookingDAO.getBookingsByUserId(loggedInUser.getUserId());

                // Check if bookings list is empty
                if (bookings == null || bookings.isEmpty()) {
        %>
                    <p class="no-bookings-msg">No bookings found.</p>
                <%
                } else {
                %>
                    <div class="table-container">
                        <table class="bookings-table">
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Pickup Location</th>
                                    <th>Destination</th>
                                    <th>Fare (Rs)</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    // Loop through the bookings and display each one
                                    for (Booking b : bookings) { 
                                %>
                                <tr>
                                    <td><%= b.getBookingId() %></td>
                                    <td><%= b.getPickupLocation() %></td>
                                    <td><%= b.getDestination() %></td>
                                    <td>Rs <%= b.getFare() %></td>
                                    <td><%= b.getStatus() %></td>
                                </tr>
                                <% 
                                    } 
                                %>
                            </tbody>
                        </table>
                    </div>
                <% 
                }
            }
        %>

    </div>

</body>
</html>
