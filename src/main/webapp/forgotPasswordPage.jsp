<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #d9f3ff, #b7e8ff, #b8f3e6);
            font-family: 'Segoe UI', sans-serif;
        }

        /* PREVENT SCROLLING */
        html, body {
            height: 100%;
            overflow: hidden;
        }

        .page-wrapper {
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .content-area {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* HEADER */
        .header-bar {
            background: linear-gradient(90deg, #c8f2ff, #d8f9ff, #c8f2ff);
            padding: 18px 35px;
            font-weight: 800;
            font-size: 26px;
            color: #007f7f;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .home-link {
            color: white;
            font-size: 18px;
            text-decoration: underline;
            padding: 8px 22px;
            background: rgba(255, 255, 255, 0.25);
            border-radius: 12px;
        }

        /* CARD */
        .fp-card {
            width: 420px;
            border-radius: 22px;
            padding: 35px 40px;
            background: rgba(255, 255, 255, 0.55);
            backdrop-filter: blur(18px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.20);
        }

        .form-control {
            background: rgba(255,255,255,0.60);
            border-radius: 10px;
            height: 48px;
            border: none;
            padding-left: 14px;
        }

        .form-section {
            margin-bottom: 25px;
        }

        .btn-custom {
            width: 100%;
            border-radius: 12px;
            padding: 12px;
            font-size: 17px;
            background: rgba(255, 255, 255, 0.35);
            color: #007f7f;
            font-weight: 600;
            border: none;
            transition: 0.25s ease-in-out;
        }

        .btn-custom:hover {
            background: rgba(255, 255, 255, 0.60);
        }

        .divider {
            height: 1px;
            background: rgba(0, 0, 0, 0.20);
            margin: 18px 0 25px 0;
        }

        /* FOOTER */
        footer {
            background: #c3f2ff;
            padding: 12px;
            text-align: center;
            color: #006666;
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="page-wrapper">

    <!-- HEADER -->
    <div class="header-bar">
        Vendor Laptop Portal
        <a href="login" class="home-link">Home</a>
    </div>

    <!-- CENTERED CONTENT -->
    <div class="content-area">
        <div class="fp-card">

            <h3 class="text-center fw-bold mb-4" style="color:#007f7f;">Forgot Password</h3>

            <!-- SEND OTP -->
            <form action="sendOtp" method="post" class="form-section">
                <div class="mb-3">
                    <label class="fw-semibold mb-2">Email</label>
                    <input type="email" name="email" value="${inputEmail}"
                           class="form-control" placeholder="Enter your email" required>
                </div>

                <button class="btn-custom">Send OTP</button>
            </form>

            <div class="divider"></div>

            <!-- VERIFY OTP -->
            <form action="verifyOtp" method="post" class="form-section">
                <input type="hidden" name="email" value="${inputEmail}">

                <label class="fw-semibold mb-2">Enter OTP</label>
                <input type="text" name="otp" class="form-control" placeholder="Enter OTP" required>

                <c:if test="${not empty otpError}">
                    <small class="text-danger d-block mt-2">${otpError}</small>
                </c:if>

                <button class="btn-custom mt-3">Submit</button>
            </form>

        </div>
    </div>

    <!-- FOOTER -->
    <footer>
        © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
    </footer>

</div>

</body>
</html>
