<%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/19/2025
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Categories</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            transition: background-color 0.3s ease-in-out;
            height: 100vh; /* Full viewport height */
        }

        .manage-title {
            color: #000000;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 28px;
            animation: fadeIn 1s ease-in-out;
        }

        .form-control {
            background-color: #eaeaea;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #11d13b;
            box-shadow: 0 0 5px rgb(12, 147, 41);
            animation: pulse 0.5s ease-in-out infinite alternate;
        }

        .table thead {
            background-color: #088f25;
            color: white;
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: #f2f2f2;
            cursor: pointer;
            transform: scale(1.02);
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #05ffc5;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            opacity: 0.9;
            transform: scale(1.05);
        }

        .btn-primary:focus {
            outline: none;
            box-shadow: 0 0 10px rgb(17, 209, 59);
        }

        .back-btn {
            font-size: 24px;
            color: #05ffc5;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
            transition: transform 0.3s ease;
        }

        .back-btn:hover {
            transform: translateX(-10px);
            color: #1ee348;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent background */
            border: none;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

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

        @keyframes pulse {
            0% {
                box-shadow: 0 0 5px rgb(186, 9, 223);
            }
            100% {
                box-shadow: 0 0 15px rgb(5, 144, 237);
            }
        }
    </style>

</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="card col-lg-8">
        <h2 class="manage-title text-center">Add Categories</h2>

        <!-- Form Inputs -->
        <form action="/E_Commerce_war_exploded/saveCategories" method="post">
            <div class="mb-3">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" id="categoryName" name="categoryName" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Category</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
