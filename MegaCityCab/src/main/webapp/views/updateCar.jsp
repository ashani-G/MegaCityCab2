<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Car" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Car</title>
    <link rel="stylesheet" href="../css/UpdateCar.css">

<style>
/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
}

/* Container for main content */
.container {
    width: 70%;
    max-width: 800px;
    margin: 50px auto;
    padding: 30px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

/* Header Section */
header {
    text-align: center;
    margin-bottom: 40px;
}

header h2 {
    font-size: 32px;
    color: #2c3e50;
}

/* Form Section */
.update-car-form {
    font-size: 16px;
    color: #7f8c8d;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-size: 16px;
    color: #2c3e50;
    margin-bottom: 5px;
}

input, select {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.form-actions {
    text-align: center;
}

.submit-button {
    background-color: #3498db; /* Blue */
    color: white;
    padding: 12px 25px;
    font-size: 18px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.submit-button:hover {
    background-color: #2980b9;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        width: 90%;
    }

    header h2 {
        font-size: 28px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-size: 14px;
    }

    input, select {
        font-size: 14px;
        padding: 8px;
    }

    .submit-button {
        font-size: 16px;
        padding: 10px 20px;
    }
}

</style>

</head>
<body>

    <div class="container">
        <header>
            <h2>Update Car Details</h2>
        </header>

        <section class="update-car-form">
            <form action="/MegaCityCab/UpdateCarServlet" method="POST">
                <input type="hidden" name="car_id" value="<%= ((Car) request.getAttribute("car")).getCarId() %>">

                <div class="form-group">
                    <label for="car_model">Car Model:</label>
                    <input type="text" name="car_model" value="<%= ((Car) request.getAttribute("car")).getCarModel() %>" required>
                </div>

                <div class="form-group">
                    <label for="car_number">Car Number:</label>
                    <input type="text" name="car_number" value="<%= ((Car) request.getAttribute("car")).getCarNumber() %>" required>
                </div>

                <div class="form-group">
                    <label for="car_type">Car Type:</label>
                    <input type="text" name="car_type" value="<%= ((Car) request.getAttribute("car")).getCarType() %>" required>
                </div>

                <div class="form-group">
                    <label for="capacity">Capacity:</label>
                    <input type="number" name="capacity" value="<%= ((Car) request.getAttribute("car")).getCapacity() %>" required>
                </div>

                <div class="form-group">
                    <label for="status">Status:</label>
                    <select name="status">
                        <option value="Available" <% if ("Available".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>Available</option>
                        <option value="In Use" <% if ("In Use".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>In Use</option>
                        <option value="Under Maintenance" <% if ("Under Maintenance".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>Under Maintenance</option>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="submit-button">Update Car</button>
                </div>
            </form>
        </section>
    </div>

</body>
</html>
