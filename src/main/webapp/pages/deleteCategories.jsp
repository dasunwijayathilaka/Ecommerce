<%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/19/2025
  Time: 8:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Categories</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            position: relative;
            height: 100vh; /* Full viewport height */
        }

        .manage-title {
            color: #020100;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 1.8rem;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
            animation: fadeIn 1s ease;
        }

        .form-control, .form-select {
            background-color: #eaeaea;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            background-color: #ffffff;
            box-shadow: 0 0 5px rgb(9, 154, 41);
            outline: none;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table thead {
            background-color: #04a327;
            color: white;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 1px;
        }

        .table tbody tr:hover {
            background-color: rgba(230, 168, 15, 0.1); /* Subtle row hover effect */
        }

        .btn-primary {
            background-color: #05ffc5;
            border: none;
            color: white;
            font-weight: bold;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #079826;
            transform: scale(1.05); /* Slight scale animation */
        }

        .btn-danger {
            background-color: #e60000;
            border: none;
            color: white;
            font-weight: bold;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #c70000;
        }

        .back-btn {
            font-size: 24px;
            color: #e6a80f;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .back-btn:hover {
            color: #d8950e;
            transform: scale(1.1); /* Hover effect for back button */
        }

        .card {
            background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent background */
            border: none;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 767px) {
            .manage-title {
                font-size: 1.5rem;
            }

            .form-control, .form-select {
                padding: 8px;
            }

            .btn-primary {
                padding: 8px 12px;
                font-size: 0.9rem;
            }

            .back-btn {
                font-size: 20px;
            }
        }
    </style>

</head>


<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="card col-lg-8">
        <h2 class="manage-title text-center">Delete Categories</h2>

        <!-- Form Inputs -->
        <form class="d-flex mb-3">
            <input class="form-control me-2" type="search" placeholder="Search" id="search-input">
            <button class="btn btn-primary" id="search-button" type="button">Search</button>
        </form>
        <form action="/E_Commerce_war_exploded/deleteCategories" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" name="search" id="disable-search-input">
            <div class="mb-3">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" id="categoryName" name="categoryName" class="form-control" readonly>
            </div>
            <button type="submit" class="btn btn-danger">Delete Category</button>
        </form>
    </div>
</div>






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
<script>
    $('#disable-search-input').hide();
    $('#search-button').click(function() {
        const categoryId = $('#search-input').val();
        $.ajax({
            url: 'http://localhost:8080/E_Commerce_war_exploded/searchCategories?action=id&categoryId=' + categoryId,
            type: 'GET',
            success: function(response) {
                $('#disable-search-input').val(response.categoryId);
                $('#categoryName').val(response.categoryName);
            }
        })
    })
</script>
</body>
</html>
