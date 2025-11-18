<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <style>
        /* ===== Color Palette ===== */
        :root {
            --primary: #005F73;       /* Deep Teal */
            --secondary: #0A9396;     /* Teal Accent */
            --light: #E9F5F2;         /* Soft Aqua */
            --accent: #94D2BD;        /* Mint */
            --text: #1B1B1B;          /* Dark Gray */
        }

        /* ===== Base ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Tahoma, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #E9F5F2, #D8F3DC);
            color: var(--text);
        }

        /* ===== Header ===== */
        header {
            background-color: var(--primary);
            color: white;
            position: fixed;
            top: 0;
            width: 100%;
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.25);
            z-index: 1000;
        }

        header h1 {
            font-size: 1.7em;
            font-weight: 600;
            letter-spacing: .5px;
            cursor: pointer;
        }

        .login-btn {
            text-decoration: none;
            color: white;
            background: var(--secondary);
            padding: 10px 18px;
            border-radius: 25px;
            border: 1px solid white;
            transition: 0.3s ease;
        }

        .login-btn:hover {
            background: var(--accent);
            color: var(--text);
        }

        /* ===== Login Container ===== */
        .login-container {
            margin: 140px auto;
            max-width: 420px;
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            text-align: center;
            animation: fadeIn 0.6s ease;
        }

        /* Login Title */
        .login-container h2 {
            margin-bottom: 20px;
            color: var(--secondary);
            font-size: 1.9em;
            font-weight: 700;
        }

        /* ===== Form Styles ===== */
        .login-container form {
            margin-top: 20px;
            text-align: left;
        }

        .login-container label {
            font-size: 1em;
            font-weight: 600;
            color: var(--primary);
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0 20px 0;
            border: 2px solid var(--accent);
            border-radius: 10px;
            outline: none;
            background: #f9ffff;
            transition: 0.25s ease;
        }

        .login-container input:focus {
            border-color: var(--secondary);
            box-shadow: 0 0 8px rgba(10,147,150,0.3);
        }

        /* Login Button */
        .login-container .btn {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            background: var(--secondary);
            color: white;
            border: none;
            font-weight: 600;
            font-size: 1em;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .login-container .btn:hover {
            background: var(--primary);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        /* ===== Forgot Password Link ===== */
        .note {
            text-align: center;
            margin-top: 12px;
        }

        .note a {
            color: var(--secondary);
            font-weight: 600;
            text-decoration: none;
        }

        .note a:hover {
            text-decoration: underline;
        }

        /* ===== Error Message ===== */
        .error {
            color: #D7263D;
            background: #FFE5E8;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            margin-bottom: 15px;
            border: 1px solid #ffb5be;
        }

        /* ===== Animation ===== */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ===== Footer ===== */
        footer {
            background-color: var(--primary);
            color: white;
            text-align: center;
            padding: 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 0.9em;
            letter-spacing: 0.3px;
            box-shadow: 0 -3px 12px rgba(0,0,0,0.2);
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

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <form method="post" action="login">
        <label for="emailOrPhone">Email or Phone</label>
        <input type="text" id="emailOrPhone" name="emailOrPhone" placeholder="Enter email or phone number" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required />

        <button type="submit" class="btn">Login</button>

        <div class="note">
            <a href="forgotPassword">Forgot password?</a>
        </div>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
