<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase Order</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        /* ===== COLOR PALETTE TO MATCH DASHBOARD ===== */
        :root {
            --primary: #1A73E8;
            --secondary: #3AA6F2;
            --light-bg: #E3F2FD;
            --white: #ffffff;
            --text-dark: #0A1E33;
        }

        body {
            background: linear-gradient(135deg, #B5E8FF, #D9F1FF, #C3EDFF);
            font-family: "Segoe UI", Tahoma, sans-serif;
            color: var(--text-dark);
        }

        /* ===== HEADER ===== */
        .main-header {
            background: rgba(255, 255, 255, 0.35);
            backdrop-filter: blur(12px);
            box-shadow: 0 4px 20px rgba(0,0,0,0.15);
            height: 70px;
            padding: 0 35px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 999;
        }

        .main-header h2 {
            font-size: 1.6rem;
            font-weight: 700;
            color: #004B8D;
        }

        /* Right Menu */
        .top-menu {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .dropdown-toggle {
            border-radius: 25px;
            padding: 8px 18px;
            font-weight: 600;
        }

        .logout-btn {
            border-radius: 25px;
            padding: 8px 18px;
            background: #ffffff;
            border: 2px solid var(--primary);
            color: var(--primary);
            font-weight: 600;
        }
        .logout-btn:hover {
            background: var(--primary);
            color: white;
        }

        /* ===== FORM CARD ===== */
        .form-wrapper {
            max-width: 900px;
            margin: 120px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            border: 1px solid rgba(255,255,255,0.5);
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            backdrop-filter: blur(10px);
            animation: fadeIn .6s ease;
        }

        .form-title {
            font-size: 30px;
            text-align: center;
            font-weight: 700;
            color: #0056B3;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            color: var(--primary);
        }

        input, select {
            border-radius: 12px;
            border: 2px solid var(--secondary);
            background: #F0F9FF;
            padding: 12px;
        }

        input:focus, select:focus {
            border-color: var(--primary);
            background: white;
            box-shadow: 0 0 6px rgba(0,123,255,0.35);
        }

        /* ===== BUTTON ===== */
        .btn-submit {
            width: 100%;
            padding: 14px;
            font-size: 18px;
            font-weight: 700;
            background: var(--primary);
            color: white;
            border-radius: 12px;
            border: none;
        }

        .btn-submit:hover {
            background: var(--secondary);
        }

        /* ===== FOOTER ===== */
        footer {
            background: rgba(255, 255, 255, 0.35);
            backdrop-filter: blur(12px);
            text-align: center;
            padding: 12px;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -4px 12px rgba(0,0,0,0.1);
            color: #003F7F;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<!-- HEADER -->
<header class="main-header">
    <h2>Purchase Order</h2>

    <div class="top-menu">

        <!-- ORDER DROPDOWN -->
        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">
                Order
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/purchase">Create Purchase</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/sales">Create Sales</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/orders">View Orders</a></li>
            </ul>
        </div>

        <!-- LOGOUT -->
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </div>
</header>

<!-- FORM -->
<div class="form-wrapper">
    <h2 class="form-title">Create New Purchase Order</h2>

    <form action="${pageContext.request.contextPath}/purchaseOrder" method="post">

        <input type="hidden" name="status" value="PENDING">

        <div class="row gy-3">

            <div class="col-md-6">
                <label>Voucher Type</label>
                <input type="text" name="voucherType" value="${voucherType}" readonly>
            </div>

            <div class="col-md-6">
                <label>Customer Name</label>
                <select name="customerName" required>
                    <option value="">-- Select Customer --</option>
                    <c:forEach var="cust" items="${customers}">
                        <option>${cust.customerName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-6">
                <label>Product Group</label>
                <select name="productGroup" required>
                    <option value="">-- Select Product Group --</option>
                    <c:forEach var="group" items="${productGroups}">
                        <option>${group}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-6">
                <label>Make</label>
                <input type="text" id="make" name="make" required>
            </div>

            <div class="col-md-6">
                <label>Model</label>
                <input type="text" id="model" name="model" required>
            </div>

            <div class="col-md-6">
                <label>Product Code</label>
                <input type="text" id="productCode" name="productCode" required>
            </div>

            <div class="col-md-12">
                <label>Item Name</label>
                <input type="text" id="itemName" name="itemName" readonly>
            </div>

            <div class="col-md-6">
                <label>Purchase Price</label>
                <input type="number" id="purchasePrice" step="0.01" name="purchasePrice" required>
            </div>

            <div class="col-md-6">
                <label>Quantity</label>
                <input type="number" id="quantity" name="quantity" min="1" value="1" required>
            </div>

            <div class="col-md-12">
                <label>Total Cost</label>
                <input type="number" id="totalCost" step="0.01" readonly>
            </div>

            <div class="col-md-12">
                <label>Due Date</label>
                <input type="date" name="dueDate" required>
            </div>
        </div>

        <button class="btn-submit mt-3">Place Order</button>
    </form>
</div>

<!-- FOOTER -->
<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Your Script Added Below -->
<script>
document.addEventListener("DOMContentLoaded", () => {
    const make = document.getElementById("make");
    const model = document.getElementById("model");
    const code = document.getElementById("productCode");
    const qty = document.getElementById("quantity");
    const price = document.getElementById("purchasePrice");
    const item = document.getElementById("itemName");
    const total = document.getElementById("totalCost");

    function updateItem() {
        item.value = [make.value, model.value, code.value].filter(Boolean).join(" ");
    }
    function updateTotal() {
        total.value = (qty.value * price.value || 0).toFixed(2);
    }

    make.addEventListener("input", updateItem);
    model.addEventListener("input", updateItem);
    code.addEventListener("input", updateItem);
    qty.addEventListener("input", updateTotal);
    price.addEventListener("input", updateTotal);
});
</script>

</body>
</html>
