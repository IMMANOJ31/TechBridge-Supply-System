<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

        /* Container */
        .container-box {
            background: white;
            width: 420px;
            margin: 60px auto;
            padding: 40px 35px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2, h4 {
            text-align: center;
            color: #007f5f;
            font-weight: 700;
            margin-bottom: 30px;
        }

        label {
            font-weight: 500;
            color: #333;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 6px;
            margin-bottom: 16px;
            outline: none;
            transition: border 0.3s;
        }

        input:focus {
            border-color: #007f5f;
        }

        .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-success {
            background-color: #34a853;
        }

        .btn-success:hover {
            background-color: #27883f;
        }

        footer {
            text-align: center;
            padding: 16px;
            background-color: #007f5f;
            color: white;
            margin-top: 100px;
            font-size: 0.9em;
        }

        .text-danger {
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>

<body>
<header>
    <h1>Vendor Laptop Portal</h1>
    <a href="login" class="nav-btn">Login</a>
</header>

<div class="container-box">
    <h4>Reset Your Password</h4>

    <form action="updatePass" method="post" id="resetPasswordForm">
        <!-- Hidden email passed from previous page -->
        <input type="hidden" name="email" value="${inputEmail}">

        <label for="password">New Password</label>
        <input type="password" id="password" name="password" required>

        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <c:if test="${not empty passError}">
            <span class="text-danger">${passError}</span>
        </c:if>

        <button type="submit" class="btn btn-success">Update Password</button>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    // Optional: validate password match before submitting
    const form = document.getElementById('resetPasswordForm');
    form.addEventListener('submit', function(e){
        const password = document.getElementById('password').value;
        const confirm = document.getElementById('confirmPassword').value;
        if(password !== confirm){
            e.preventDefault();
            alert("Passwords do not match!");
        }
    });
</script>

</body>
</html>
