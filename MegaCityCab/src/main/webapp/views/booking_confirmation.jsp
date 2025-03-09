<%@ page import="model.Bill" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking Confirmation</title>
    <link rel="stylesheet" href="../css/BookingConfirmation.css">
    <style>
    @charset "UTF-8";

/* General Page Styling */
body {
    font-family: 'Arial', sans-serif;
    background: url('../images/confirmation-bg.jpg') no-repeat center center/cover;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

/* Booking Confirmation Container */
.confirmation-container {
    width: 500px;
    background: rgba(255, 255, 255, 0.95);
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    text-align: center;
}

/* Heading Styles */
h2 {
    font-size: 28px;
    font-weight: bold;
    color: #1a1a2e;
    margin-bottom: 15px;
}

h3 {
    font-size: 22px;
    font-weight: bold;
    color: #1a1a2e;
    margin-bottom: 15px;
}

/* Paragraph Styling */
p {
    font-size: 16px;
    color: #555;
    margin-bottom: 10px;
}

/* Error Message Styling */
.error-msg {
    color: #e74c3c;
    font-size: 14px;
    text-align: center;
    background: rgba(231, 76, 60, 0.1);
    padding: 8px;
    border-radius: 6px;
}

/* Download Button */
.download-btn {
    background: #1a1a2e;
    color: #fff;
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 30px;
    cursor: pointer;
    transition: background 0.3s;
    margin-top: 20px;
}

.download-btn:hover {
    background: #16213e;
}

/* Home Button */
.home-btn {
    background: #27ae60;
    color: #fff;
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 30px;
    cursor: pointer;
    transition: background 0.3s;
    margin-top: 20px;
}

.home-btn:hover {
    background: #219150;
}
    
    
    </style>
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

            <!-- Button to go back to home.jsp -->
            <a href="/MegaCityCab/views/homedashboard.jsp">
                <button class="home-btn">Go to Home</button>
            </a>
        </div>
    </div>

</body>
</html>
