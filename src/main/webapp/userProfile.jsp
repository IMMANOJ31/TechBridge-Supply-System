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
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to bottom right, #d1f3ff, #c6ffd8);
            min-height: 100vh;
        }

        /* Header */
        header {
            background: transparent;
            padding: 25px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            font-size: 2rem;
            font-weight: 700;
            color: #007f5f;
        }
        header .home-btn {
            background: white;
            padding: 10px 20px;
            border-radius: 20px;
            text-decoration: none;
            color: #007f5f;
            font-weight: 600;
            transition: 0.3s;
            border: 1px solid #cce8dd;
        }
        header .home-btn:hover {
            background-color: #e3f9ef;
        }

        /* Main Container */
        .profile-box {
            width: 550px;
            background: #ffffffcc;
            backdrop-filter: blur(10px);
            margin: 40px auto;
            padding: 40px 35px;
            border-radius: 18px;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.12);
        }

        h2 {
            text-align: center;
            color: #007f5f;
            font-size: 1.8rem;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            color: #222;
        }

        input, select {
            width: 100%;
            padding: 10px 12px;
            margin: 8px 0 18px 0;
            border-radius: 8px;
            background: #f1f9f5;
            border: 1px solid #d3e6dd;
        }
        input[readonly], select[disabled] {
            opacity: .9;
        }

        footer {
            text-align: center;
            padding: 18px;
            color: white;
            background-color: #007f5f;
            margin-top: 80px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<header>
    <h1>Vendor Laptop Portal</h1>
    <a href="listOfUsers" class="home-btn">Back</a>
</header>

<div class="profile-box">
    <h2>User Profile</h2>

    <label>First Name</label>
    <input type="text" readonly value="${dto.firstName}">

    <label>Last Name</label>
    <input type="text" readonly value="${dto.lastName}">

    <label>Email</label>
    <input type="email" readonly value="${dto.email}">

    <label>Phone Number</label>
    <input type="text" readonly value="${dto.phoneNumber}">

    <label>Gender</label>
    <select disabled>
        <option value="">--Select Gender--</option>
        <option value="Male" ${dto.gender == 'Male' ? 'selected' : ''}>Male</option>
        <option value="Female" ${dto.gender == 'Female' ? 'selected' : ''}>Female</option>
        <option value="Others" ${dto.gender == 'Others' ? 'selected' : ''}>Others</option>
    </select>

    <label>Date of Birth</label>
    <input type="text" readonly value="${dto.dob}">

    <label>State</label>
    <input type="text" readonly value="${dto.state}">

    <label>City</label>
    <input type="text" readonly value="${dto.city}">

    <label>Country</label>
    <input type="text" readonly value="${dto.country}">

    <label>Password</label>
    <input type="password" readonly value="${dto.password}">
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
