<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f3f9f4;
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
        header .nav-btn {
            background-color: white;
            color: #007f5f;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }
        header .nav-btn:hover {
            background-color: #e6f7ef;
        }
        .container {
            background: white;
            width: 500px;
            margin: 60px auto;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px 35px;
        }
        h2 {
            text-align: center;
            color: #007f5f;
            margin-bottom: 25px;
        }
        label {
            display: block;
            font-weight: 500;
            margin-bottom: 6px;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            color: #333;
        }
        input[readonly], select[disabled] {
            background-color: #f0f0f0;
            color: #555;
            cursor: not-allowed;
        }
        footer {
            text-align: center;
            padding: 16px;
            background-color: #007f5f;
            color: white;
            margin-top: 100px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<header>
    <h1>Vendor Laptop Portal</h1>
    <a href="listOfUsers" class="nav-btn">Back</a>
</header>

<div class="container">
    <h2>User Profile</h2>

    <label>First Name</label>
    <input type="text" value="${dto.firstName}" readonly />

    <label>Last Name</label>
    <input type="text" value="${dto.lastName}" readonly />

    <label>Email</label>
    <input type="email" value="${dto.email}" readonly />

    <label>Phone Number</label>
    <input type="text" value="${dto.phoneNumber}" readonly />

    <label>Gender</label>
    <select disabled>
        <option value="">--Select Gender--</option>
        <option value="Male" ${dto.gender == 'Male' ? 'selected' : ''}>Male</option>
        <option value="Female" ${dto.gender == 'Female' ? 'selected' : ''}>Female</option>
        <option value="Others" ${dto.gender == 'Others' ? 'selected' : ''}>Others</option>
    </select>

    <label>Date of Birth</label>
    <input type="text" value="${dto.dob}" readonly />

    <label>State</label>
    <input type="text" value="${dto.state}" readonly />

    <label>City</label>
    <input type="text" value="${dto.city}" readonly />

    <label>Country</label>
    <input type="text" value="${dto.country}" readonly />

    <label>Password</label>
    <input type="password" value="${dto.password}" readonly />
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
