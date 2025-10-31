<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer Details</title>
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
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
        }

        header a {
            color: white;
            text-decoration: none;
            font-weight: 600;
        }

        header a:hover {
            text-decoration: underline;
        }

        h2 {
            text-align: center;
            color: #007f5f;
            margin-top: 20px;
        }

        .container {
            background-color: white;
            width: 70%;
            margin: 30px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 8px;
        }

        .info-row label {
            font-weight: 600;
            color: #007f5f;
            width: 30%;
        }

        .info-row span {
            width: 65%;
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
    <h1>Vendor Laptop Portal</h1>
    <a href="logout">Logout</a>
</header>

<h2>Customer Details</h2>

<div class="container">
    <div class="info-row">
        <label>First Name:</label>
        <span>${dto.firstName}</span>
    </div>

    <div class="info-row">
        <label>Last Name:</label>
        <span>${dto.lastName}</span>
    </div>

    <div class="info-row">
        <label>Email:</label>
        <span>${dto.email}</span>
    </div>

    <div class="info-row">
        <label>Phone Number:</label>
        <span>${dto.phoneNumber}</span>
    </div>

    <div class="info-row">
        <label>Gender:</label>
        <span>${dto.gender}</span>
    </div>

    <div class="info-row">
        <label>Date of Birth:</label>
        <span>${dto.dob}</span>
    </div>

    <div class="info-row">
        <label>Role:</label>
        <span>${dto.role}</span>
    </div>

    <div class="info-row">
        <label>State:</label>
        <span>${dto.state}</span>
    </div>

    <div class="info-row">
        <label>City:</label>
        <span>${dto.city}</span>
    </div>

    <div class="info-row">
        <label>Country:</label>
        <span>${dto.country}</span>
    </div>

    session.setAttribute("customerId", dto.id);

</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
