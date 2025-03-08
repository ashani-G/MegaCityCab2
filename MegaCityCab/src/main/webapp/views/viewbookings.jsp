<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="dao.BookingDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Bookings</title>
    <link rel="stylesheet" href="../css/ViewBookings.css">
</head>
<body>

    <div class="bookings-container">
        <!-- Back Button Positioned at the Top Left -->
        <div class="back-button-container">
            <button class="back-button" type="button" onclick="window.location.href='managerdashboard.jsp'">Back</button>
        </div>

        <h2>Customer Bookings</h2>

        <%
            // Retrieve all bookings
            BookingDAO bookingDAO = new BookingDAO();
            List<Booking> bookings = bookingDAO.getAllBookings();

            // Check if there are no bookings
            if (bookings.isEmpty()) {
        %>
            <p class="no-bookings-msg">No bookings found.</p>
        <%
            } else {
        %>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Pickup Location</th>
                        <th>Destination</th>
                        <th>Fare (Rs)</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Booking b : bookings) { %>
                    <tr>
                        <td><%= b.getBookingId() %></td>
                        <td><%= b.getCustomerName() %></td>
                        <td><%= b.getPickupLocation() %></td>
                        <td><%= b.getDestination() %></td>
                        <td>Rs <%= b.getFare() %></td>
                        <td><%= b.getStatus() %></td>
                        <td>
                            <% if ("Pending".equals(b.getStatus())) { %>
                                <a href="UpdateBookingServlet?bookingId=<%= b.getBookingId() %>&status=Completed" class="action-btn complete">Complete</a>
                                <a href="CancelBookingServlet?bookingId=<%= b.getBookingId() %>" class="action-btn cancel">Cancel</a>
                            <% } else { %>
                                <span class="no-actions">No Actions</span>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } %>

    </div>

</body>
</html>
