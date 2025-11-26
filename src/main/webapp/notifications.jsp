<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Purchase Approvals</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container mt-4">
    <h4 class="mb-3">Pending Purchase Requests</h4>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Product</th>
                <th>Model</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
        <c:forEach var="order" items="${pendingOrders}">
            <tr>
                <td>${order.id}</td>
                <td>${order.customer.customerName}</td>
                <td>${order.itemName}</td>
                <td>${order.model}</td>
                <td>${order.purchasePrice}</td>

                <td>
                    <!-- APPROVE -->
                    <form action="approvePurchase" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${order.id}">
                        <button class="btn btn-success btn-sm">Approve</button>
                    </form>

                    <!-- REJECT -->
                    <form action="rejectPurchase" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${order.id}">
                        <button class="btn btn-danger btn-sm">Reject</button>
                    </form>

                    <!-- HOLD -->
                    <form action="holdPurchase" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${order.id}">
                        <button class="btn btn-warning btn-sm">Hold</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
</div>

</body>
</html>
