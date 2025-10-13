<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Vendor Laptop Portal</title>
    <style>
        /* Basic Reset */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #00b4db, #0083b0);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            text-align: center;
            margin-bottom: 20px;
            color: white;
        }

        nav a {
            text-decoration: none;
            padding: 6px 14px;
            background: #006b8e;
            color: white;
            border-radius: 5px;
            margin-left: 10px;
            font-weight: 500;
            transition: background 0.3s ease;
        }

        nav a:hover {
            background: #004f63;
        }

        .login-container {
            background: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
            width: 360px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            color: #333;
        }

        input, .btn {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 16px;
            border-radius: 8px;
            outline: none;
            transition: border 0.3s ease, background 0.3s ease;
        }

        input {
            border: 1px solid #ccc;
        }

        input:focus {
            border-color: #0083b0;
        }

        .error {
            color: red;
            font-size: 0.85em;
            margin-top: -12px;
            margin-bottom: 12px;
        }

        .btn {
            background: #0083b0;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1em;
            font-weight: 600;
        }

        .btn:hover {
            background: #006b8e;
        }

        .note {
            text-align: center;
            font-size: 0.9em;
            margin-top: 10px;
        }

        .note a {
            text-decoration: none;
            color: #0083b0;
            font-weight: 500;
        }

        .note a:hover {
            text-decoration: underline;
        }

        footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.85em;
            color: white;
        }

    </style>
</head>
<body>
<div class="wrapper">

    <div class="login-container">
        <h2>User Login</h2>

        <!-- Spring Form -->
        <form:form method="post" action="login" modelAttribute="loginDto">
            <!-- Email or Phone -->
            <form:label path="emailOrPhone">Email or Phone</form:label>
            <form:input path="emailOrPhone" placeholder="Enter email or phone number"/>
            <form:errors path="emailOrPhone" cssClass="error"/>


            <form:label path="password">Password</form:label>
            <form:password path="password" placeholder="Enter your password"/>
            <form:errors path="password" cssClass="error"/>

            <button type="submit" class="btn">Login</button>

            <div class="note">
                <a href="registerPage">Create an account</a> |
                <a href="forgotPasswordPage">Forgot password?</a>
            </div>
        </form:form>

    </div>

    <footer>
        &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
    </footer>
</div>
</body>
</html>
