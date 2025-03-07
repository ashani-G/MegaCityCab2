<%@ page import="model.Bill" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking Confirmation</title>
    <link rel="stylesheet" href="../css/booking_confirmation.css">
</head>
<body>

    <div class="confirmation-container">
        <div class="confirmation-box">
            <h2>Booking Confirmed!</h2>
            <p>Thank you for booking with MegaCity Cab.</p>

            <h3>Booking Details</h3>
            <% 
                Bill bill = (Bill) request.getAttribute("bill");
                if (bill != null) {
            %>
                <p><strong>Booking ID:</strong> <%= bill.getBookingId() %></p>
                <p><strong>Total Amount:</strong> Rs <%= bill.getTotalAmount() %></p>
                <p><strong>Bill Time:</strong> <%= bill.getBillTime() %></p>

                <!-- Button to download the bill as PDF -->
                <a href="generated_pdfs/bill_<%= bill.getBillId() %>.pdf" download>
                    <button class="download-btn">Download Bill as PDF</button>
                </a>
            <% 
                } else {
            %>
                <p class="error-msg">Bill not found. Please try again later.</p>
            <% 
                }
            %>
        </div>
    </div>

</body>
</html>
