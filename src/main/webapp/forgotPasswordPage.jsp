<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forget Password</title>
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

        h2 {
            text-align: center;
            color: #007f5f;
            font-weight: 700;
            margin-bottom: 30px;
        }

        label {
            font-weight: 500;
            color: #333;
        }

        input[type="email"],
        input[type="text"] {
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

        .btn-primary {
            background-color: #007f5f;
        }

        .btn-primary:hover {
            background-color: #005f46;
        }

        .btn-success {
            background-color: #34a853;
        }

        .btn-success:hover {
            background-color: #27883f;
        }

        hr {
            border: 0;
            height: 1px;
            background: #ddd;
            margin: 25px 0;
        }

        .text-danger {
            color: red;
            font-size: 0.9em;
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
    <a href="login" class="nav-btn">Login</a>
</header>

<div class="container-box">
    <h2>Forgot Password</h2>

    <!-- Send OTP Form -->
    <form action="sendOtp" method="post" id="sendOtpForm">
        <label for="inputEmail">Enter Email</label>
        <input type="email" id="inputEmail" name="email" value="${inputEmail}" placeholder="Enter your registered email" required>
        <button type="submit" class="btn btn-primary">Send OTP</button>
    </form>

    <hr>

    <!-- Verify OTP Form -->
    <form action="verifyOtp" method="post" id="verifyOtpForm">
        <input type="hidden" name="email" value="${inputEmail}">
        <label for="invalidOtp">Enter OTP</label>
        <input type="text" id="invalidOtp" name="otp" placeholder="Enter the OTP received" required>
        <c:if test="${not empty otpError}">
            <span class="text-danger">${otpError}</span>
        </c:if>
        <button type="submit" class="btn btn-success">Submit</button>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
