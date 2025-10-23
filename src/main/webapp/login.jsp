<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
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

        header .login-btn {
            background-color: white;
            color: #007f5f;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }

        header .login-btn:hover {
            background-color: #e6f7ef;
        }

        /* Centered Login Box */
        .login-container {
            background: white;
            width: 380px;
            margin: 80px auto;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px 35px;
            text-align: center;
        }

        h2 {
            color: #007f5f;
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 6px;
            color: #333;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: border 0.3s;
            margin-bottom: 18px;
        }

        input:focus {
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

        .note {
            margin-top: 15px;
            font-size: 0.9em;
        }

        .note a {
            color: #007f5f;
            text-decoration: none;
            font-weight: 500;
        }

        .note a:hover {
            text-decoration: underline;
        }

        footer {
            text-align: center;
            padding: 16px;
            background-color: #007f5f;
            color: white;
            margin-top: 100px;
            font-size: 0.9em;
        }
         function goToProfile() {
                window.location.href = "profile";
                return false;
            }
    </style>
</head>
<body>

<header>
    <h1>Vendor Laptop Portal</h1>
    <a href="index" class="login-btn">Home</a>
</header>

<div class="login-container">
    <h2>Login</h2>
    <form method="post" action="login" onsubmit="return goToProfile()">
        <label for="User not found">Email or Phone</label>
        <input type="text" id="User not found" name="emailOrPhone" placeholder="Enter email or phone number" required />

        <label for="Invalid password">Password</label>
        <input type="password" id="Invalid password" name="password" placeholder="Enter your password" required />

        <button type="submit" class="btn">Login</button>

        <div class="note">
            <a href="register">Create an account</a> |
            <a href="forgotPassword">Forgot password?</a>
        </div>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
