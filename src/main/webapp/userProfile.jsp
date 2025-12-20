<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        background: linear-gradient(to bottom right, #dff6ff, #ccf5ff);
        min-height: 100vh;
    }

    /* ===== HEADER (EXACT SAME) ===== */
    header {
        padding: 25px 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    header h1 {
        color: #0a7c7c;
        font-size: 32px;
        font-weight: 700;
        margin: 0;
    }

    .home-btn {
        background: #e8fbff;
        padding: 10px 22px;
        border-radius: 12px;
        text-decoration: none;
        color: #0a7c7c;
        font-weight: 600;
        border: none;
    }

    /* ===== CARD ===== */
    .profile-container {
        max-width: 650px;
        margin: 40px auto;
        background: #ffffff;
        border-radius: 20px;
        padding: 35px 45px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    }

    .profile-container h2 {
        text-align: center;
        color: #0a7c7c;
        margin-bottom: 30px;
        font-size: 28px;
    }

    label {
        font-weight: 600;
        margin-bottom: 6px;
        display: block;
    }

    input, select {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 18px;
        border-radius: 8px;
        border: 1px solid #d6e9f0;
        background: #f6fdff;
    }

    input[readonly], select[disabled] {
        cursor: not-allowed;
    }

    /* ===== FOOTER (EXACT SAME) ===== */
    footer {
        margin-top: 60px;
        padding: 18px;
        background: #e6f9ff;
        color: #0a7c7c;
        text-align: center;
        font-weight: 600;
    }
</style>
</head>

<body>

<header>
    <h1>Vendor Laptop Portal</h1>
    <a href="listOfUsers" class="home-btn">Home</a>
</header>

<div class="profile-container">
    <h2>User Profile</h2>

    <label>First Name</label>
    <input type="text" readonly value="${dto.firstName}">

    <label>Last Name</label>
    <input type="text" readonly value="${dto.lastName}">

    <label>Email</label>
    <input type="email" readonly value="${dto.email}">

    <label>Phone</label>
    <input type="text" readonly value="${dto.phoneNumber}">

    <label>Gender</label>
    <select disabled>
        <option ${dto.gender=='Male'?'selected':''}>Male</option>
        <option ${dto.gender=='Female'?'selected':''}>Female</option>
        <option ${dto.gender=='Others'?'selected':''}>Others</option>
    </select>

    <label>DOB</label>
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
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
