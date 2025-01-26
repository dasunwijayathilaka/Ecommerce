<%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/18/2025
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center; /* Centers the form on the screen */
            position: relative;
            font-family: 'Arial', sans-serif;
            transition: background-color 0.3s ease;
        }

        .login-box {
            width: 600px; /* Width of the form */
            height: 600px; /* Height of the form */
            border: 2px solid #f6b40f;
            border-radius: 15px;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Shadow for emphasis */
            justify-content: center;
            align-items: center;
            position: relative;
            display: flex;
            flex-direction: column;
            animation: fadeIn 1s ease-in-out;
        }

        .login-title {
            color: #000000;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
        }

        .form-control {
            background-color: #eaeaea;
            padding: 15px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .form-control:focus {
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            outline: none;
        }

        .login-btn {
            background-color: #05ffc5;
            color: white;
            border: none;
            width: 100%;
            padding: 15px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .login-btn:hover {
            background-color: #11d13b;
            transform: scale(1.05);
        }

        .back-btn {
            font-size: 24px;
            color: #05ffc5;
            cursor: pointer;
            position: absolute;
            top: 2%;  /* Adjust the distance from the top */
            left: 2%;  /* Adjust the distance from the left */
            z-index: 10;  /* Ensure it stays on top of other elements */
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .back-btn:hover {
            color: #11d13b;
            transform: translateX(-5px);
        }

        /* Animation for the login box */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive design for mobile */
        @media (max-width: 768px) {
            .login-box {
                width: 90%;
                height: auto;
            }

            .login-title {
                font-size: 24px;
            }

            .form-control {
                font-size: 14px;
            }

            .login-btn {
                font-size: 16px;
                padding: 12px;
            }
        }
    </style>

</head>
<body>
<!-- Main Container -->
<div class="container">
    <div class="back d-flex justify-content-start mb-3 position-absolute">
        <a href="index.jsp" class="back-btn">×</a>
    </div>

    <!-- Centered Login Box -->
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="login-box">
                <h2 class="login-title">Login</h2>
                <form action="/E_Commerce_war_exploded/admin" method="get">
                    <!-- Username Field -->
                    <div class="mb-3">
                        <label for="username" class="form-label">User Name</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter your username" name="username">
                    </div>

                    <!-- Password Field -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password">
                    </div>

                    <!-- Login Button -->
                    <button type="submit" class="btn login-btn">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
