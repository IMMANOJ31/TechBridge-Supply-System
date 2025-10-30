<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f3f9f4;
        }

        /* Header */
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

        /* Form Container */
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
            outline: none;
            transition: border 0.3s;
        }

        input:focus, select:focus {
            border-color: #007f5f;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007f5f;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #005f46;
        }

        #message {
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
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
    <a href="index" class="nav-btn">Home</a>
</header>

<div class="container">
    <h2>User Registration</h2>

    <div id="message"></div>

    <form id="userForm" method="post" action="addUser">

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
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Others">Others</option>
        </select>

        <label>Date of Birth</label>
        <input type="date" name="dob" required />

        <label>Role</label>
        <input type="text" name="role" value="USER" readonly/>

        <label>State</label>
        <input type="text" name="state" required />

        <label>City</label>
        <input type="text" name="city" required />

        <label>Country</label>
        <input type="text" name="country" required />

        <label>Password</label>
        <input type="password" name="password" required />

        <button type="submit" class="btn">Register</button>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
document.getElementById("userForm").addEventListener("submit", async function(event) {
    event.preventDefault();

    const formData = new FormData(this);
    const response = await fetch("register", {
        method: "POST",
        body: formData
    });

    const message = await response.text();
    const messageDiv = document.getElementById("message");
    messageDiv.innerHTML = message;

    messageDiv.style.color = response.status === 200 ? "green" : "red";
});
</script>

</body>
</html>
