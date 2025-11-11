<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase Order</title>
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
            background: white;
            width: 70%;
            margin: 40px auto;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #007f5f;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            border-color: #007f5f;
        }

        .btn {
            display: block;
            width: 100%;
            background-color: #007f5f;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #005f46;
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
    <h1>Purchase</h1>
    <div></div>
</header>

<div class="container">
    <h2>Purchase Order</h2>

    <form action="placeOrder" method="post" onsubmit="return notifyAdmin();">

        <label>Voucher Type</label>
        <input type="text" name="voucherType" value="${param.voucherType}" readonly
               style="background-color:#f1f1f1; cursor:not-allowed;" />

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


        <label>Make (Company Name)</label>
        <input type="text" id="make" name="make" required />

        <label>Model</label>
        <input type="text" id="model" name="model" required />

        <label>Product Code</label>
        <input type="text" id="productCode" name="productCode" required />

        <!-- AUTO ITEM NAME -->
        <label>Item Name</label>
        <input type="text" id="itemName" name="itemName" readonly
               style="background-color:#f1f1f1; cursor:not-allowed;" />

        <label>Opening Value (Initial Price)</label>
        <input type="text" id="openingValue" name="openingValue" readonly
               value="1000" style="background-color:#f1f1f1; cursor:not-allowed;" />

        <label>Purchase Price</label>
        <input type="number" step="0.01" id="purchasePrice" name="purchasePrice" required />

        <label>Quantity</label>
        <input type="number" id="quantity" name="quantity" min="1" value="1" required />

        <label>Total Cost</label>
        <input type="number" step="0.01" id="totalCost" name="totalCost" readonly
               style="background-color:#f1f1f1; cursor:not-allowed;" />

        <label>Opening Balance (Stock in Hand)</label>
        <input type="number" name="openingBalance" required />

        <label>Order Due Date</label>
        <input type="date" name="dueDate" required />

        <button type="submit" class="btn">Place Order</button>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const makeField = document.getElementById("make");
    const modelField = document.getElementById("model");
    const productCodeField = document.getElementById("productCode");
    const quantityField = document.getElementById("quantity");
    const purchasePriceField = document.getElementById("purchasePrice");
    const itemNameField = document.getElementById("itemName");
    const totalCostField = document.getElementById("totalCost");

    function updateItemName() {
        const make = makeField.value.trim();
        const model = modelField.value.trim();
        const code = productCodeField.value.trim();
        itemNameField.value = [make, model, code].filter(Boolean).join(" ");
    }

    function updateTotalCost() {
        const quantity = parseFloat(quantityField.value) || 0;
        const price = parseFloat(purchasePriceField.value) || 0;
        totalCostField.value = (quantity * price).toFixed(2);
    }

    makeField.addEventListener("input", updateItemName);
    modelField.addEventListener("input", updateItemName);
    productCodeField.addEventListener("input", updateItemName);
    quantityField.addEventListener("input", updateTotalCost);
    purchasePriceField.addEventListener("input", updateTotalCost);
});

function notifyAdmin() {
    alert("Order placed successfully! Admin will be notified for approval");
    window.location.href = "purchaseDashboard";  // redirect after placing order
    return false; // prevent immediate form submission to show popup first
}
</script>

</body>
</html>
