<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update User</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to bottom right, #dff6ff, #ccf5ff);
            min-height: 100vh;
        }
        .portal-title {
            color: #0a7c7c;
            font-weight: 700;
        }
        .nav-btn {
            background: #e8fbff;
            color: #0a7c7c;
            font-weight: 600;
        }
        .footer {
            background: #e6f9ff;
            color: #0a7c7c;
            font-weight: 600;
        }
        .card {
            border-radius: 20px;
        }
    </style>
</head>

<body>

<!-- ================= HEADER ================= -->
<nav class="d-flex justify-content-between align-items-center px-5 py-4">
    <h1 class="portal-title mb-0">Vendor Laptop Portal</h1>
    <a href="index" class="btn nav-btn px-4">Home</a>
</nav>

<!-- ================= DATE FORMAT FIX ================= -->
<c:if test="${not empty dto.dob}">
    <c:set var="dobFormatted"
           value="${fn:substring(dto.dob,6,10)}-${fn:substring(dto.dob,3,5)}-${fn:substring(dto.dob,0,2)}"/>
</c:if>

<!-- ================= FORM CARD ================= -->
<div class="container d-flex justify-content-center mt-4">
    <div class="card shadow-lg p-4 bg-white bg-opacity-75"
         style="width: 100%; max-width: 600px;">

        <h3 class="text-center portal-title mb-4">Update User</h3>

        <div id="message" class="text-center fw-bold mb-3"></div>

        <form id="updateForm" method="post" action="editUser">

            <!-- Hidden ID -->
            <input type="hidden" name="id" value="${dto.id}"/>

            <div class="mb-3">
                <label class="form-label fw-semibold">First Name</label>
                <input type="text" class="form-control"
                       name="firstName" value="${dto.firstName}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Last Name</label>
                <input type="text" class="form-control"
                       name="lastName" value="${dto.lastName}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Email</label>
                <input type="email" class="form-control"
                       name="email" value="${dto.email}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Phone Number</label>
                <input type="text" class="form-control"
                       name="phoneNumber" value="${dto.phoneNumber}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Gender</label>
                <select class="form-select" name="gender" required>
                    <option value="">--Select Gender--</option>
                    <option value="Male" ${dto.gender=='Male'?'selected':''}>Male</option>
                    <option value="Female" ${dto.gender=='Female'?'selected':''}>Female</option>
                    <option value="Others" ${dto.gender=='Others'?'selected':''}>Others</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Date of Birth</label>
                <input type="date" class="form-control"
                       name="dob" value="${dobFormatted}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">State</label>
                <input type="text" class="form-control"
                       name="state" value="${dto.state}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">City</label>
                <input type="text" class="form-control"
                       name="city" value="${dto.city}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Country</label>
                <input type="text" class="form-control"
                       name="country" value="${dto.country}" required>
            </div>

            <!-- Passwords (DO NOT bind encrypted value) -->
            <div class="mb-3">
                <label class="form-label fw-semibold">New Password</label>
                <input type="password" class="form-control"
                       name="password" placeholder="Enter new password" required>
            </div>

            <div class="mb-4">
                <label class="form-label fw-semibold">Confirm Password</label>
                <input type="password" class="form-control"
                       name="confirmPassword" placeholder="Confirm password" required>
            </div>

            <button type="submit"
                    class="btn w-100 text-white fw-semibold"
                    style="background:#0a7c7c;">
                Update
            </button>

        </form>
    </div>
</div>

<!-- ================= FOOTER ================= -->
<footer class="footer text-center py-3 mt-5">
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<!-- ================= SCRIPT ================= -->
<script>
document.getElementById("updateForm").addEventListener("submit", async function (event) {
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
    const response = await fetch("editUser", {
        method: "POST",
        body: formData
    });

    const message = await response.text();
    messageDiv.innerHTML = message;
    messageDiv.style.color = response.status === 200 ? "green" : "red";
});
</script>

</body>
</html>
