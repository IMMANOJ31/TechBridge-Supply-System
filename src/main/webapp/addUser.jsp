<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create User</title>

    <style>
        body {
            margin: 0;
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

        .nav-btn {
            background: white;
            padding: 10px 20px;
            border-radius: 20px;
            text-decoration: none;
            color: #007f5f;
            border: 1px solid #cce8dd;
            font-weight: 600;
            transition: 0.3s;
        }

        .nav-btn:hover {
            background: #e3f9ef;
        }

        /* Main Card */
        .container {
            width: 550px;
            background: #ffffffcc;
            backdrop-filter: blur(10px);
            margin: 30px auto 40px auto;
            padding: 40px 35px;
            border-radius: 18px;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.12);
        }

        h2 {
            text-align: center;
            color: #007f5f;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            color: #333;
            margin-bottom: 6px;
        }

        input, select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 18px;
            border-radius: 8px;
            border: 1px solid #d3e6dd;
            background: #f1f9f5;
            outline: none;
            transition: border 0.3s;
        }

        input:focus, select:focus {
            border-color: #007f5f;
        }

        #message {
            text-align: center;
            font-weight: 700;
            margin-bottom: 15px;
            font-size: 1rem;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #007f5f;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #005f46;
        }

        footer {
            text-align: center;
            padding: 18px;
            color: white;
            background-color: #007f5f;
            margin-top: 80px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<header>
    <h1>Vendor Laptop Portal</h1>
    <a href="index" class="nav-btn">Home</a>
</header>

<div class="container">
    <h2>Create User</h2>

    <div id="message"></div>

    <form id="createForm" method="post" action="saveUser">

        <label>First Name</label>
        <input type="text" name="firstName" required />

        <label>Last Name</label>
        <input type="text" name="lastName" required />

        <label>Email</label>
        <input type="email" name="email" required />

        <label>Phone Number</label>
        <input type="text" name="phoneNumber" required />

        <label>Gender</label>
        <select name="gender" required>
            <option value="">--Select Gender--</option>
            <option>Male</option>
            <option>Female</option>
            <option>Others</option>
        </select>

        <label>Date of Birth</label>
        <input type="date" name="dob" required />

        <label>State</label>
        <input type="text" name="state" required />

        <label>City</label>
        <input type="text" name="city" required />

        <label>Country</label>
        <input type="text" name="country" required />

        <label>Password</label>
        <input type="password" name="password" required />

        <label>Confirm Password</label>
        <input type="password" name="confirmPassword" required />

        <button type="submit" class="btn">Create User</button>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
document.getElementById("createForm").addEventListener("submit", async function(event) {
    event.preventDefault();

    const password = document.querySelector('[name="password"]').value;
    const confirmPassword = document.querySelector('[name="confirmPassword"]').value;
    const messageDiv = document.getElementById("message");

    if (password !== confirmPassword) {
        messageDiv.innerHTML = "Password and Confirm Password do not match!";
        messageDiv.style.color = "red";
        return;
    }

    const formData = new FormData(this);
    const response = await fetch("saveUser", {
        method: "POST",
        body: formData
    });

    const msg = await response.text();
    messageDiv.innerHTML = msg;
    messageDiv.style.color = response.status === 200 ? "green" : "red";
});
</script>

</body>
</html>
