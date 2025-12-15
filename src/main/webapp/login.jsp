<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Vendor Laptop Portal</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Axios (ONLY ADDITION) -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <!-- 🔒 YOUR STYLE BLOCK (UNCHANGED) -->
    <style>
        /* Background with smooth gradient */
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #8ED0F9, #A4F3E0);
            font-family: "Segoe UI", sans-serif;
            color: #000;
        }
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
        .main-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 120px;
        }
        .glass-card {
            width: 420px;
            padding: 40px 35px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(14px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .login-btn {
            width: 100%;
            padding: 12px;
            background: rgba(255, 255, 255, 0.40);
            border-radius: 14px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar glass-nav">
    <span class="navbar-brand">Vendor Laptop Portal</span>
    <a href="index" class="glass-btn">Home</a>
</nav>

<div id="errorBox" class="alert alert-danger py-2 d-none"></div>


<!-- LOGIN CARD -->
<div class="main-wrapper">
    <div class="glass-card">

        <h3 class="text-center mb-4">Login</h3>

        <!-- EXISTING ERROR SUPPORT -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger py-2">${error}</div>
        </c:if>

        <!-- 🔽 ONLY CHANGE: id added -->
        <form id="loginForm">

            <label class="form-label">Email / Phone</label>
            <input type="text" id="emailOrPhone" name="emailOrPhone"
                   class="form-control mb-3"
                   placeholder="Enter your email or phone" required>

            <label class="form-label">Password</label>
            <input type="password" id="password" name="password"
                   class="form-control mb-4"
                   placeholder="Enter password" required>

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

<!-- 🔽 AXIOS SCRIPT (NO STYLE IMPACT) -->
<script>
    document.getElementById("loginForm").addEventListener("submit", function (e) {
        e.preventDefault();

        const params = new URLSearchParams();
        params.append("emailOrPhone", document.getElementById("emailOrPhone").value);
        params.append("password", document.getElementById("password").value);

        axios.post("login", params)
            .then(response => {
                if (response.data === "ADMIN") {
                    window.location.href = "adminPage";
                } else if (response.data === "USER") {
                    window.location.href = "userPage";
                }
            })
            .catch(error => {
                alert(error.response?.data || "Invalid credentials");
            });
    });
</script>



</body>
</html>
