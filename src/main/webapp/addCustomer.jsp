<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Customer</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #d9f3ff, #b7e8ff, #b8f3e6);
        }

        /* HEADER */
        header {
            background: linear-gradient(90deg, #c8f2ff, #d8f9ff, #c8f2ff);
            color: #007f7f;
            padding: 18px 40px;
            font-size: 26px;
            font-weight: 800;
            letter-spacing: 1px;
        }

        h2 {
            text-align: center;
            color: #007f7f;
            margin-top: 25px;
            font-weight: 700;
        }

        /* MAIN CARD */
        .container {
            width: 85%;
            background: rgba(255, 255, 255, 0.55);
            backdrop-filter: blur(12px);
            margin: 30px auto;
            padding: 35px 45px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        /* GRID FORM */
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px 40px;
        }

        .full-width {
            grid-column: 1 / 3;
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
            color: #004f4f;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            background: rgba(255,255,255,0.65);
            font-size: 15px;
            outline: none;
            transition: 0.25s ease;
        }

        input:focus, select:focus, textarea:focus {
            background: rgba(255,255,255,0.95);
            box-shadow: 0 0 5px rgba(0, 127, 127, 0.35);
        }

        textarea {
            resize: none;
            height: 90px;
        }

        /* RADIO GROUP */
        .radio-group {
            margin-top: 10px;
        }

        .radio-group label {
            margin-right: 20px;
            font-weight: 500;
        }

        /* BUTTON */
        .btn-submit {
            background: rgba(255,255,255,0.4);
            color: #007f7f;
            padding: 14px 20px;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            width: 220px;
            margin-top: 25px;
            transition: 0.3s ease;
        }

        .btn-submit:hover {
            background: rgba(255,255,255,0.85);
        }

        /* FOOTER */
        footer {
            background: #c3f2ff;
            color: #006666;
            padding: 16px;
            text-align: center;
            margin-top: 40px;
            font-size: 15px;
            font-weight: 600;
        }

        @media(max-width: 900px) {
            .grid { grid-template-columns: 1fr; }
            .full-width { grid-column: 1; }
        }
    </style>
</head>

<body>

<header>Vendor Laptop Portal</header>

<h2>Add Customer</h2>

<div class="container">
    <form action="saveCustomer" method="post">

        <div class="grid">

            <div>
                <label>Customer Name</label>
                <input type="text" name="customerName" required>
            </div>

            <div>
                <label>Customer Type</label>
                <select name="customerType" required>
                    <option value="">--Select--</option>
                    <option value="Creditors">Creditor</option>
                    <option value="Debitors">Debitor</option>
                </select>
            </div>

            <div>
                <label>Email</label>
                <input type="email" name="email" required>
            </div>

            <div>
                <label>Contact Number</label>
                <input type="text" name="phoneNumber" required>
            </div>

            <div>
                <label>GST Number</label>
                <input type="text" name="gstNumber">
            </div>

            <div>
                <label>Country</label>
                <input type="text" name="country" value="India" readonly>
            </div>

            <div>
                <label>Pin Code</label>
                <input type="text" id="pincode" name="pincode" maxlength="6" required oninput="autoFillStateCity()">
            </div>

            <div>
                <label>State</label>
                <select id="state" name="state" required>
                    <option value="">--Select State--</option>
                </select>
            </div>

            <div>
                <label>City</label>
                <select id="city" name="city" required>
                    <option value="">--Select City--</option>
                </select>
            </div>

            <div class="full-width">
                <label>Address</label>
                <textarea name="address"></textarea>
            </div>

            <div class="full-width">
                <label>Billing Address</label>
                <textarea id="billingAddress" name="billingAddress"></textarea>

                <div class="radio-group">
                    <p>Shipping address same as billing?</p>
                    <label><input type="radio" name="sameAddress" value="yes" onclick="copyAddress(true)"> Yes</label>
                    <label><input type="radio" name="sameAddress" value="no" onclick="copyAddress(false)"> No</label>
                </div>
            </div>

            <div class="full-width">
                <label>Shipping Address</label>
                <textarea id="shippingAddress" name="shippingAddress"></textarea>
            </div>

            <div class="full-width">
                <label>Payment Mode</label>
                <select name="paymentMode" required>
                    <option value="">--Select--</option>
                    <option value="UPI">UPI</option>
                    <option value="Cash">Cash</option>
                    <option value="Cheque">Cheque</option>
                </select>
            </div>

        </div>

        <button type="submit" class="btn-submit">Submit</button>
    </form>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<!-- Existing JavaScript (unchanged) -->
<script>
    /* JS SAME – NOT MODIFIED */
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

    function loadStates() {
        for (const state in stateCityData) {
            const option = document.createElement("option");
            option.value = state;
            option.textContent = state;
            stateDropdown.appendChild(option);
        }
    }

    stateDropdown.addEventListener("change", function() {
        const selected = this.value;
        cityDropdown.innerHTML = '<option value="">--Select City--</option>';
        if (selected && stateCityData[selected]) {
            stateCityData[selected].forEach(city => {
                const option = document.createElement("option");
                option.value = city;
                option.textContent = city;
                cityDropdown.appendChild(option);
            });
        }
    });

    loadStates();

    function autoFillStateCity() {
        const pin = document.getElementById("pincode").value.trim();
        if (pin.length === 6 && pinCodeData[pin]) {
            const { state, city } = pinCodeData[pin];
            stateDropdown.value = state;
            cityDropdown.innerHTML = '<option value="">--Select City--</option>';
            stateCityData[state].forEach(c => {
                const op = document.createElement("option");
                op.value = c;
                op.textContent = c;
                cityDropdown.appendChild(op);
            });
            cityDropdown.value = city;
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
