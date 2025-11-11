<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase Orders</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f7f5; margin: 0; }
        header { background-color: #007f5f; color: white; padding: 16px 40px; display: flex; justify-content: space-between; }
        table { width: 90%; margin: 30px auto; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #007f5f; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .back { text-decoration: none; background-color: #007f5f; color: white; padding: 8px 16px; border-radius: 8px; margin-left: 40px; }
    </style>
</head>
<body>
<header>
    <h2>All Purchase Orders</h2>
    <a href="${pageContext.request.contextPath}/purchase" class="back">Back to Dashboard</a>
</header>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Customer</th>
            <th>Item</th>
            <th>Quantity</th>
            <th>Total Cost</th>
            <th>Due Date</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="order" items="${purchaseOrders}">
            <tr>
                <td>${order.id}</td>
                <td>${order.customerName}</td>
                <td>${order.itemName}</td>
                <td>${order.quantity}</td>
                <td>${order.totalCost}</td>
                <td>${order.dueDate}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
