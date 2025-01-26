<%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/16/2025
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .signup-box {
            width: 700px; /* Increased width for more space */
            border: 2px solid #11d13b;
            border-radius: 15px;
            padding: 40px; /* Adjusted padding for balance */
            background-color: white;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center; /* Center-align text and form */
            animation: slideIn 1s ease-out;
        }

        .signup-title {
            color: #000000;
            font-weight: bold;
            margin-bottom: 30px;
            font-size: 28px; /* Larger font size */
        }

        .form-control {
            width: 100%;
            padding: 15px; /* Larger padding for inputs */
            margin-bottom: 20px; /* Space between inputs */
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #eaeaea;
            font-size: 16px; /* Larger font size for inputs */
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #11d13b;
            box-shadow: 0 0 5px rgb(11, 140, 39);
        }

        .signup-btn {
            background: #05ffc5;
            color: white;
            border: none;
            width: 100%;
            padding: 15px; /* Increased button size */
            border-radius: 5px;
            font-size: 18px; /* Larger button font */
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .signup-btn:hover {
            background-color: #11d13b;
            transform: scale(1.05);
        }

        .back-btn {
            font-size: 24px;
            color: #05ffc5;
            cursor: pointer;
            position: absolute;
            top: 10px;
            left: 10px;
            transition: transform 0.3s ease;
        }

        .back-btn:hover {
            color: #0ef340;
            transform: translateX(-5px);
        }

        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

</head>
<body>

<!-- Back Button -->
<div class="container">
    <div class="d-flex justify-content-start mb-3">
        <a href="/E_Commerce_war_exploded/index" class="back-btn">×</a>
    </div>

    <!-- Sign Up Form -->
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            <div class="signup-box">
                <h2 class="signup-title">Sign Up</h2>
                <form action="/E_Commerce_war_exploded/signup" method="post" onsubmit="return validatePasswords(event)">
                    <div class="row g-3">
                        <!-- Full Name and Email -->
                        <div class="col-md-6">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullName" placeholder="Enter full name" name="fullName">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                        </div>

                        <!-- Mobile Number and Username -->
                        <div class="col-md-6">
                            <label for="mobileNumber" class="form-label">Mobile Number</label>
                            <input type="text" class="form-control" id="mobileNumber" placeholder="Enter mobile number" name="mobile">
                        </div>
                        <div class="col-md-6">
                            <label for="username" class="form-label">User Name</label>
                            <input type="text" class="form-control" id="username" placeholder="Choose a username" name="username">
                        </div>

                        <!-- Password and Confirm Password -->
                        <div class="col-md-6">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
                        </div>
                        <div class="col-md-6">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" placeholder="Re-enter password" name="confirmPassword">
                        </div>
                    </div>

                    <!-- Sign Up Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn signup-btn">Sign Up</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function validatePasswords(event) {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        if (password !== confirmPassword) {
            alert("Passwords do not match!");
            event.preventDefault();  // Prevent form submission
            return false;
        }
        return true;
    }
</script>
</body>
</html>

