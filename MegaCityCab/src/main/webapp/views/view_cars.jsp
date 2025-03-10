<%@ page import="java.util.List, model.Car, dao.CarDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Car Management</title>
    <link rel="stylesheet" href="../css/view_cars.css">
</head>
<body>

    <div class="car-management-container">
       
        <h2>Car List</h2>

        <div class="table-container">
            <table>
                <tr>
                    <th>Car Model</th>
                    <th>Car Number</th>
                    <th>Car Type</th>
                    <th>Capacity</th>
                    <th>Status</th>
                </tr>
                <%
                    CarDAO carDAO = new CarDAO();
                    List<Car> cars = carDAO.getAllCars();
                    for (Car car : cars) {
                %>
                <tr>
                    <td><%= car.getCarModel() %></td>
                    <td><%= car.getCarNumber() %></td>
                    <td><%= car.getCarType() %></td>
                    <td><%= car.getCapacity() %></td>
                    <td><%= car.getStatus() %></td>
                </tr>
                <% } %>
            </table>
        </div>
    </div>

</body>
</html>
