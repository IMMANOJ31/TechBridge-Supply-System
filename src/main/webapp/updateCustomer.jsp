<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f9f7;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007f5f;
            color: white;
            padding: 16px 40px;
        }
        h2 {
            text-align: center;
            color: #007f5f;
        }
        form {
            background-color: white;
            width: 70%;
            margin: 30px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        label {
            font-weight: 500;
            display: block;
            margin-bottom: 6px;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 16px;
            outline: none;
            transition: border 0.3s;
        }
        input:focus, select:focus, textarea:focus {
            border-color: #007f5f;
        }
        textarea {
            resize: none;
            height: 70px;
        }
        .radio-group {
            margin-bottom: 16px;
        }
        .radio-group label {
            display: inline-block;
            margin-right: 20px;
        }
        .btn {
            background-color: #007f5f;
            color: white;
            border: none;
            padding: 12px 18px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #005f46;
        }
        footer {
            text-align: center;
            padding: 16px;
            background-color: #007f5f;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<header>
    <h1>Vendor Laptop Portal</h1>
</header>

<h2>Edit Customer</h2>

<form action="editCustomer" method="post">
    <!-- Hidden ID -->
    <input type="hidden" name="id" value="${dto.id}" />

    <label>Customer Name</label>
    <input type="text" name="customerName" value="${dto.customerName}" required />

    <label>Customer Type</label>
    <select name="customerType" required>
        <option value="">--Select--</option>
        <option value="Creditors" ${dto.customerType == 'Creditors' ? 'selected' : ''}>Creditor</option>
        <option value="Debitors" ${dto.customerType == 'Debitors' ? 'selected' : ''}>Debitor</option>
    </select>

    <label>Email</label>
    <input type="email" name="email" value="${dto.email}" required />

    <label>Contact Number</label>
    <input type="text" name="phoneNumber" value="${dto.phoneNumber}" required />

    <label>GST Number</label>
    <input type="text" name="gstNumber" value="${dto.gstNumber}" />

    <label>Country</label>
    <input type="text" name="country" value="${dto.country}" readonly />

    <label>Pin Code</label>
    <input type="text" id="pincode" name="pincode" maxlength="6" value="${dto.pincode}" required oninput="autoFillStateCity()" />

    <label>State</label>
    <select id="state" name="state" required>
        <option value="">--Select State--</option>
    </select>

    <label>City</label>
    <select id="city" name="city" required>
        <option value="">--Select City--</option>
    </select>

    <label>Address</label>
    <textarea name="address">${dto.address}</textarea>

    <label>Billing Address</label>
    <textarea id="billingAddress" name="billingAddress">${dto.billingAddress}</textarea>

    <div class="radio-group">
        <p>Do you want shipping address same as billing address?</p>
        <label><input type="radio" name="sameAddress" value="yes" onclick="copyAddress(true)"> Yes</label>
        <label><input type="radio" name="sameAddress" value="no" onclick="copyAddress(false)"> No</label>
    </div>

    <label>Shipping Address</label>
    <textarea id="shippingAddress" name="shippingAddress">${dto.shippingAddress}</textarea>

    <label>Payment Mode</label>
    <select name="paymentMode" required>
        <option value="">--Select--</option>
        <option value="UPI" ${dto.paymentMode == 'UPI' ? 'selected' : ''}>UPI</option>
        <option value="Cash" ${dto.paymentMode == 'Cash' ? 'selected' : ''}>Cash</option>
        <option value="Cheque" ${dto.paymentMode == 'Cheque' ? 'selected' : ''}>Cheque</option>
    </select>

    <c:if test="${not empty message}">
        <script>alert('${message}');</script>
    </c:if>
    <c:if test="${not empty error}">
        <script>alert('${error}');</script>
    </c:if>


    <button type="submit" class="btn">Update Customer</button>
</form>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    // ✅ Static state-city list
    const stateCityData = {
        "Tamil Nadu": ["Chennai", "Coimbatore", "Madurai", "Salem"],
        "Karnataka": ["Bengaluru", "Mysuru", "Hubballi"],
        "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
        "Telangana": ["Hyderabad", "Warangal"],
        "Delhi": ["New Delhi"],
        "Gujarat": ["Ahmedabad", "Surat", "Vadodara"]
    };

    const pinCodeData = {
        "600001": { state: "Tamil Nadu", city: "Chennai" },
        "641001": { state: "Tamil Nadu", city: "Coimbatore" },
        "110001": { state: "Delhi", city: "New Delhi" },
        "560001": { state: "Karnataka", city: "Bengaluru" },
        "500001": { state: "Telangana", city: "Hyderabad" },
        "400001": { state: "Maharashtra", city: "Mumbai" },
        "395003": { state: "Gujarat", city: "Surat" }
    };

    const stateDropdown = document.getElementById("state");
    const cityDropdown = document.getElementById("city");

    // Load states
    function loadStates() {
        for (const state in stateCityData) {
            const option = document.createElement("option");
            option.value = state;
            option.textContent = state;
            if (state === "${dto.state}") option.selected = true;
            stateDropdown.appendChild(option);
        }

        if ("${dto.state}") {
            populateCities("${dto.state}", "${dto.city}");
        }
    }

    function populateCities(selectedState, selectedCity) {
        cityDropdown.innerHTML = '<option value="">--Select City--</option>';
        if (stateCityData[selectedState]) {
            stateCityData[selectedState].forEach(city => {
                const option = document.createElement("option");
                option.value = city;
                option.textContent = city;
                if (city === selectedCity) option.selected = true;
                cityDropdown.appendChild(option);
            });
        }
    }

    stateDropdown.addEventListener("change", function() {
        populateCities(this.value, "");
    });

    loadStates();

    function autoFillStateCity() {
        const pin = document.getElementById("pincode").value.trim();
        if (pin.length === 6 && pinCodeData[pin]) {
            const { state, city } = pinCodeData[pin];
            stateDropdown.value = state;
            populateCities(state, city);
        }
    }

    function copyAddress(isSame) {
        const billing = document.getElementById('billingAddress');
        const shipping = document.getElementById('shippingAddress');
        if (isSame) {
            shipping.value = billing.value;
            billing.addEventListener('input', () => {
                if (document.querySelector('input[name="sameAddress"][value="yes"]').checked) {
                    shipping.value = billing.value;
                }
            });
        } else {
            shipping.value = '';
        }
    }
</script>

</body>
</html>
