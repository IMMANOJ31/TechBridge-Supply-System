<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sales Orders</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>

        /* ===== Matching Dashboard Theme ===== */
        :root {
            --primary: #005F73;
            --secondary: #0A9396;
            --background1: #A8EDEA;
            --background2: #7CB8E8;
            --glass: rgba(255,255,255,0.25);
            --white-card: rgba(255, 255, 255, 0.88);
            --text-dark: #1A1A1A;
        }

        body {
            background: linear-gradient(135deg, var(--background1), var(--background2));
            font-family: "Segoe UI", sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Header Bar */
        header {
            background: var(--glass);
            backdrop-filter: blur(12px);
            position: fixed;
            top: 0;
            width: 100%;
            height: 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.25);
            color: white;
            font-size: 1.9em;
            font-weight: 700;
            z-index: 1000;
        }

        .back-btn {
            background: rgba(255, 255, 255, 0.45);
            padding: 10px 20px;
            border-radius: 12px;
            font-size: 15px;
            border: 1px solid rgba(255,255,255,0.7);
            font-weight: 600;
            color: #003344;
            text-decoration: none;
        }

        .back-btn:hover {
            background: white;
            color: #005F73;
        }

        /* Main Content Box */
        .content-box {
            margin: 130px auto 0;
            width: 90%;
            background: var(--white-card);
            padding: 40px;
            border-radius: 22px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.20);
        }

        .content-box h2 {
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            background: white !important;
            border-radius: 10px;
            overflow: hidden;
        }

        thead {
            background-color: var(--primary);
            color: white;
        }

        th, td {
            padding: 12px;
            font-size: 15px;
        }

        tbody tr:hover {
            background: #e6f7f9;
        }

        footer {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(10px);
            padding: 18px;
            text-align: center;
            font-size: 0.95em;
            border-top: 1px solid rgba(255, 255, 255, 0.35);
            position: fixed;
            bottom: 0;
            width: 100%;
            color: var(--primary);
            font-weight: 600;
        }

    </style>

</head>

<body>

<!-- Header -->
<header>
    Sales Orders
    <a href="salesDashboard" class="back-btn">Back</a>
</header>

<!-- Main Content -->
<div class="content-box">

    <h2>View Sales Orders</h2>

    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Sl no</th>
                <th>Customer</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Sales Date</th>
                <th>Selling Price</th>
                <th>Total Amount</th>
            </tr>
        </thead>

        <tbody>
        <c:forEach items="${salesList}" var="s" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${s.customerName}</td>
                <td>${s.productName}</td>
                <td>${s.quantity}</td>
                <td>${s.brand}</td>
                <td>${s.model}</td>
                <td>${s.salesDate}</td>
                <td>${s.sellingPrice}</td>
                <td>${s.totalAmount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<!-- Footer -->
<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
