<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase Order</title>

    <style>
        /* ===== Color Palette ===== */
        :root {
            --primary: #005F73;       /* Deep Teal */
            --secondary: #0A9396;     /* Teal Accent */
            --light: #E9F5F2;         /* Soft Aqua */
            --accent: #94D2BD;        /* Mint */
            --text: #1B1B1B;          /* Dark Gray */
        }

        /* ===== Base ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Tahoma, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #E9F5F2, #D8F3DC);
            color: var(--text);
        }

        /* ===== Header ===== */
        header {
            background-color: var(--primary);
            color: white;
            position: fixed;
            top: 0;
            width: 100%;
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.25);
            z-index: 1000;
        }

        header h1 {
            font-size: 1.7em;
            font-weight: 600;
        }

        /* Back Button */
        .back-btn {
            text-decoration: none;
            background: var(--secondary);
            color: white;
            padding: 10px 18px;
            border-radius: 25px;
            border: 1px solid white;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .back-btn:hover {
            background: var(--accent);
            color: var(--text);
        }

        /* ===== Container ===== */
        .container {
            background: white;
            width: 70%;
            margin: 120px auto 50px;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            animation: fadeIn 0.6s ease;
        }

        h2 {
            text-align: center;
            color: var(--secondary);
            margin-bottom: 25px;
            font-size: 1.8em;
        }

        /* ===== Form Inputs ===== */
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #222;
        }

        input, select {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 18px;
            border-radius: 10px;
            border: 2px solid var(--accent);
            background-color: var(--light);
            transition: .3s ease;
        }

        input:focus, select:focus {
            border-color: var(--secondary);
            background: #ffffff;
        }

        input[readonly] {
            background: #eaeaea;
            cursor: not-allowed;
            border-color: #ccc;
        }

        /* ===== Button ===== */
        .btn {
            display: block;
            width: 100%;
            background-color: var(--primary);
            color: white;
            padding: 14px;
            border: none;
            border-radius: 12px;
            font-weight: 700;
            font-size: 1.1rem;
            cursor: pointer;
            transition: .3s ease;
        }

        .btn:hover {
            background-color: var(--secondary);
            transform: translateY(-3px);
        }

        /* ===== Footer ===== */
        footer {
            background-color: var(--primary);
            color: white;
            text-align: center;
            padding: 18px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 0.9em;
            box-shadow: 0 -3px 12px rgba(0,0,0,0.2);
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<header>
    <a href="${pageContext.request.contextPath}/userPage" class="back-btn">Back</a>
    <h1>Purchase</h1>
    <div></div>
</header>

<div class="container">
    <h2>Purchase Order</h2>

    <form action="${pageContext.request.contextPath}/purchaseOrder" method="post" onsubmit="return notifyAdmin();">
        <input type="hidden" name="status" value="PENDING" />

        <label>Voucher Type</label>
        <input type="text" name="voucherType" value="${voucherType}" readonly />

        <label>Customer Name</label>
        <select name="customerName" required>
            <option value="">--Select Customer--</option>
            <c:forEach var="cust" items="${customers}">
                <option value="${cust.customerName}">${cust.customerName}</option>
            </c:forEach>
        </select>

        <label>Product Group</label>
        <select name="productGroup" required>
            <option value="">--Select Product Group--</option>
            <c:forEach var="group" items="${productGroups}">
                <option value="${group}">${group}</option>
            </c:forEach>
        </select>

        <label>Make</label>
        <input type="text" id="make" name="make" required />

        <label>Model</label>
        <input type="text" id="model" name="model" required />

        <label>Product Code</label>
        <input type="text" id="productCode" name="productCode" required />

        <label>Item Name</label>
        <input type="text" id="itemName" name="itemName" readonly />

        <label>Purchase Price</label>
        <input type="number" step="0.01" id="purchasePrice" name="purchasePrice" required />

        <label>Quantity</label>
        <input type="number" id="quantity" name="quantity" min="1" value="1" required />

        <label>Total Cost</label>
        <input type="number" step="0.01" id="totalCost" name="totalCost" readonly />

        <label>Due Date</label>
        <input type="date" name="dueDate" required />

        <button type="submit" class="btn">Place Order</button>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
document.addEventListener("DOMContentLoaded", function () {
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

function notifyAdmin() {
    alert("Your purchase order has been submitted to Admin for approval.");
    return true;
}
</script>

</body>
</html>
