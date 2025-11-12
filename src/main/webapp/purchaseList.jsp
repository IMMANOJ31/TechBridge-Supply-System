<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f5;
            margin: 0;
        }

        header {
            background-color: #007f5f;
            color: white;
            padding: 16px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            font-size: 1.5rem;
            font-weight: 600;
        }

        .back-btn {
            background-color: white;
            color: #007f5f;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }

        .back-btn:hover {
            background-color: #e6f7ef;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #007f5f;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 14px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007f5f;
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1f9f4;
        }

        .no-data {
            text-align: center;
            color: #666;
            font-style: italic;
            padding: 20px;
        }

        .search-box {
            margin-bottom: 20px;
            text-align: right;
        }

        input[type="text"] {
            padding: 8px 10px;
            width: 250px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        footer {
            text-align: center;
            padding: 16px;
            background-color: #007f5f;
            color: white;
            margin-top: 80px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<header>
    <a href="userPage" class="back-btn">Back</a>
    <h1>Purchase List</h1>
    <a href="${pageContext.request.contextPath}/purchaseOrder?voucherType=Purchase" class="back-btn">+ New Order</a>
</header>

<div class="container">
    <h2>List of Purchase Orders</h2>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search by Customer or Product...">
    </div>

    <table id="purchaseTable">
        <thead>
        <tr>
            <th>Sl. No</th>
            <th>Voucher Type</th>
            <th>Customer</th>
            <th>Product Group</th>
            <th>Make</th>
            <th>Model</th>
            <th>Item Name</th>
            <th>Purchase Price</th>
            <th>Quantity</th>
            <th>Total Cost</th>
            <th>Due Date</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty purchaseEntity}">
                <!-- Added varStatus="loop" to generate serial number -->
                <c:forEach var="p" items="${purchaseEntity}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${p.voucherType}</td>
                        <td>${p.customerName}</td>
                        <td>${p.productGroup}</td>
                        <td>${p.make}</td>
                        <td>${p.model}</td>
                        <td>${p.itemName}</td>
                        <td>${p.purchasePrice}</td>
                        <td>${p.quantity}</td>
                        <td>${p.totalCost}</td>
                        <td>${p.dueDate}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr><td colspan="11" class="no-data">No purchase orders found.</td></tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    // 🔍 Simple client-side search filter
    document.getElementById("searchInput").addEventListener("keyup", function () {
        const filter = this.value.toLowerCase();
        const rows = document.querySelectorAll("#purchaseTable tbody tr");

        rows.forEach(row => {
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    });
</script>

</body>
</html>
