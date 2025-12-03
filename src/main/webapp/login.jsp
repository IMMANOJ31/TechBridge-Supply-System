<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Vendor Laptop Portal</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Background with smooth gradient */
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #8ED0F9, #A4F3E0);
            font-family: "Segoe UI", sans-serif;
            color: #000;  /* GLOBAL BLACK FONT */
        }

        /* Frosted Glass Navbar */
        .glass-nav {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(12px);
            padding: 15px 35px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.15);
            z-index: 1000;
        }

        .navbar-brand {
            color: #000 !important; /* BLACK */
            font-size: 22px;
            font-weight: 700;
        }

        .glass-btn {
            background: rgba(255, 255, 255, 0.35);
            border: none;
            padding: 8px 20px;
            border-radius: 12px;
            font-weight: 500;
            color: #000 !important; /* BLACK */
        }
        .glass-btn:hover {
            background: rgba(255, 255, 255, 0.55);
        }

        /* Center area wrapper */
        .main-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 120px;
        }

        /* Premium Glass Login Card */
        .glass-card {
            width: 420px;
            padding: 40px 35px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(14px);
            border: 1px solid rgba(255, 255, 255, 0.35);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            color: #000;  /* BLACK TEXT */
        }

        .glass-card h3 {
            font-weight: 700;
            font-size: 26px;
            color: #000;  /* BLACK */
        }

        .form-label {
            color: #000;  /* BLACK */
            font-weight: 500;
            font-size: 15px;
        }

        /* Inputs */
        .form-control {
            background: rgba(255, 255, 255, 0.30);
            border: 1px solid rgba(255, 255, 255, 0.45);
            color: #000;  /* BLACK INPUT TEXT */
            height: 45px;
        }
        .form-control::placeholder {
            color: #444; /* DARK GRAY PLACEHOLDER */
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.55);
            border-color: rgba(255, 255, 255, 0.75);
            color: #000;
        }

        /* Login Button */
        .login-btn {
            width: 100%;
            padding: 12px;
            background: rgba(255, 255, 255, 0.40);
            border: none;
            border-radius: 14px;
            color: #000; /* BLACK TEXT */
            font-weight: 600;
        }
        .login-btn:hover {
            background: rgba(255, 255, 255, 0.70);
            color: #000;
        }

        /* Footer */
        footer {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(12px);
            padding: 15px;
            text-align: center;
            color: #000; /* BLACK */
            font-size: 15px;
            font-weight: 500;
            margin-top: auto;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar glass-nav">
    <span class="navbar-brand">Vendor Laptop Portal</span>
    <a href="index" class="glass-btn">Home</a>
</nav>

<!-- LOGIN CARD -->
<div class="main-wrapper">
    <div class="glass-card">

        <h3 class="text-center mb-4">Login</h3>

        <c:if test="${not empty error}">
            <div class="alert alert-danger py-2">${error}</div>
        </c:if>

        <form action="login" method="post">

            <label class="form-label">Email / Phone</label>
            <input type="text" name="emailOrPhone" class="form-control mb-3"
                   placeholder="Enter your email or phone" required>

            <label class="form-label">Password</label>
            <input type="password" name="password"
                   class="form-control mb-4" placeholder="Enter password" required>

            <button type="submit" class="login-btn">Login</button>

            <p class="text-center mt-3">
                <a href="forgotPassword" style="color:black; text-decoration:underline;">
                    Forgot password?
                </a>
            </p>

        </form>

    </div>
</div>

<!-- FOOTER -->
<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
