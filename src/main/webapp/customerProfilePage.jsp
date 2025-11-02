<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f9f7;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007f5f;
            color: white;
            padding: 16px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        header h1 {
            margin: 0;
            font-size: 22px;
            flex: 1;
            text-align: center;
        }
        header a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            margin-right: auto;
        }
        h2 {
            text-align: center;
            color: #007f5f;
            margin-top: 20px;
        }
        form {
            background-color: white;
            width: 70%;
            margin: 30px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        label {
            font-weight: 500;
            display: block;
            margin-bottom: 6px;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 16px;
            background-color: #f2f2f2;
            color: #333;
        }
        textarea {
            resize: none;
            height: 70px;
        }
        input[readonly], select[disabled], textarea[readonly] {
            background-color: #f9f9f9;
            cursor: not-allowed;
        }
        footer {
            text-align: center;
            padding: 16px;
            background-color: #007f5f;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<header>
    <a href="viewCustomer">&larr; Back</a>
    <h1>Vendor Laptop Portal</h1>
</header>

<h2>Customer Profile</h2>

<form>
    <label>Customer Name</label>
    <input type="text" name="customerName" value="${dto.customerName}" readonly />

    <label>Customer Type</label>
    <select name="customerType" disabled>
        <option value="Creditors" ${dto.customerType == 'Creditors' ? 'selected' : ''}>Creditor</option>
        <option value="Debitors" ${dto.customerType == 'Debitors' ? 'selected' : ''}>Debitor</option>
    </select>

    <label>Email</label>
    <input type="email" name="email" value="${dto.email}" readonly />

    <label>Contact Number</label>
    <input type="text" name="phoneNumber" value="${dto.phoneNumber}" readonly />

    <label>GST Number</label>
    <input type="text" name="gstNumber" value="${dto.gstNumber}" readonly />

    <label>Country</label>
    <input type="text" name="country" value="${dto.country}" readonly />

    <label>Pin Code</label>
    <input type="text" name="pincode" value="${dto.pincode}" readonly />

    <label>State</label>
    <input type="text" name="state" value="${dto.state}" readonly />

    <label>City</label>
    <input type="text" name="city" value="${dto.city}" readonly />

    <label>Address</label>
    <textarea readonly>${dto.address}</textarea>

    <label>Billing Address</label>
    <textarea readonly>${dto.billingAddress}</textarea>

    <label>Shipping Address</label>
    <textarea readonly>${dto.shippingAddress}</textarea>

    <label>Payment Mode</label>
    <input type="text" name="paymentMode" value="${dto.paymentMode}" readonly />
</form>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
