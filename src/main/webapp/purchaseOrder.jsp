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

        /* HEADER */
        .main-header {
            background: rgba(255,255,255,0.4);
            backdrop-filter: blur(10px);
            height: 70px;
            padding: 0 35px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 999;
            box-shadow: 0 3px 12px rgba(0,0,0,0.15);
        }

        /* FORM WRAPPER */
        .form-wrapper {
            max-width: 1100px;
            margin: 120px auto;
            padding: 40px;
            background: rgba(255,255,255,0.85);
            border-radius: 20px;
            backdrop-filter: blur(12px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
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
            background: white;
            border-color: var(--primary);
            box-shadow: 0 0 6px rgba(0,123,255,0.35);
        }

        .btn-submit {
            width: 100%;
            padding: 14px;
            font-size: 18px;
            font-weight: 700;
            background: var(--primary);
            color: white;
            border-radius: 12px;
        }

        .btn-submit:hover {
            background: var(--secondary);
        }

        footer {
            background: rgba(255,255,255,0.4);
            backdrop-filter: blur(10px);
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            color: #003F7F;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<header class="main-header">
    <h2>Purchase Order</h2>

    <div class="top-menu d-flex align-items-center gap-3">

        <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">Order</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/purchase">Create Purchase</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/sales">Create Sales</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/orders">View Orders</a></li>
            </ul>
        </div>

        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-primary rounded-pill">
            Logout
        </a>
    </div>
</header>

<!-- FORM -->
<div class="form-wrapper">
    <h2 class="text-center fw-bold mb-4" style="color:#0056B3;">New Purchase Order</h2>

    <form action="${pageContext.request.contextPath}/purchaseOrder" method="post">

        <input type="hidden" name="status" value="PENDING">

        <div class="row gy-3">

            <!-- ================= LEFT COLUMN ================= -->
            <div class="col-md-6">

                <label>Customer Name</label>
                <select name="customerName" required class="form-select">
                    <option value="">-- Select Customer --</option>
                    <c:forEach var="cust" items="${customers}">
                        <option>${cust.customerName}</option>
                    </c:forEach>
                </select>

                <label class="mt-3">Product Group</label>
                <select name="productGroup" class="form-select" required>
                    <option value="">-- Select Product Group --</option>
                    <c:forEach var="group" items="${productGroups}">
                        <option>${group}</option>
                    </c:forEach>
                </select>

                <label class="mt-3">Make</label>
                <input type="text" id="make" name="make" required class="form-control">

                <label class="mt-3">Model</label>
                <input type="text" id="model" name="model" required class="form-control">

                <label class="mt-3">Product Code</label>
                <input type="text" id="productCode" name="productCode" required class="form-control">

                <label class="mt-3">Item Name</label>
                <input type="text" id="itemName" name="itemName" readonly class="form-control">
            </div>

            <!-- ================= RIGHT COLUMN ================= -->
            <div class="col-md-6">

                <label>Voucher Type</label>
                <input type="text" name="voucherType" value="${voucherType}" readonly class="form-control">

                <label class="mt-3">Purchase Price</label>
                <input type="number" id="purchasePrice" step="0.01" name="purchasePrice" required class="form-control">

                <label class="mt-3">Quantity</label>
                <input type="number" id="quantity" name="quantity" min="1" value="1" required class="form-control">

                <label class="mt-3">Total Cost</label>
                <input type="number" id="totalCost" name="totalCost" step="0.01" readonly class="form-control">

                <label class="mt-3">Due Date</label>
                <input type="date" name="dueDate" required class="form-control">
            </div>
        </div>

        <button class="btn-submit mt-4">Place Order</button>

    </form>
</div>

<!-- FOOTER -->
<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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

<script>
    const priceInput = document.getElementById("purchasePrice");
        const qtyInput = document.getElementById("quantity");
        const totalInput = document.getElementById("totalCost");

        function calculateTotal() {
            const price = parseFloat(priceInput.value) || 0;
            const qty = parseInt(qtyInput.value) || 0;
            totalInput.value = (price * qty).toFixed(2);
        }

        priceInput.addEventListener("input", calculateTotal);
        qtyInput.addEventListener("input", calculateTotal);
</script>

</body>
</html>
