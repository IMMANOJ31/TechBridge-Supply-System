<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sales Order</title>
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
    <h1>Sales Order Entry</h1>
    <div></div> <!-- Placeholder for alignment -->
</header>

<div class="container">
    <h2>Create Sales Order</h2>

    <form action="placeOrder" method="post">

        <label>Voucher Type</label>
        <select name="voucherType" required>
            <option value="">--Select--</option>
            <option value="Sales">Sales</option>
            <option value="Quotation">Quotation</option>
            <option value="Estimate">Estimate</option>
        </select>

        <label>Customer Name</label>
        <input type="text" name="customerName" required />

        <label>Product Group</label>
        <input type="text" name="productGroup" required />

        <label>Make (Company Name)</label>
        <input type="text" name="make" required />

        <label>Model</label>
        <input type="text" name="model" required />

        <label>Product Code</label>
        <input type="text" name="productCode" required />

        <label>Item Name</label>
        <input type="text" name="itemName" required />

        <label>Opening Value (Initial Price)</label>
        <input type="number" step="0.01" name="openingValue" required />

        <label>Opening Balance (Stock in Hand)</label>
        <input type="number" name="openingBalance" required />

        <label>Purchase Price</label>
        <input type="number" step="0.01" name="purchasePrice" required />

        <label>Order Due Date</label>
        <input type="date" name="dueDate" required />

        <button type="submit" class="btn" onclick="notifyAdmin()">Place Order</button>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    function notifyAdmin() {
        alert("Order placed successfully! Admin will be notified for approval.");
    }
</script>

</body>
</html>
