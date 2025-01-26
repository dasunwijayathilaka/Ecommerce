<%@ page import="lk.ijse.ecommerce.dto.CategoriesDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/19/2025
  Time: 8:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Categories</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            transition: background-color 0.3s ease-in-out;
        }

        .manage-title {
            color: #000000;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 28px;
            animation: fadeIn 1s ease-in-out;
        }

        .table th {
            background-color: #12b337;
            color: #fff;
            padding: 12px;
            text-align: left;
            border-radius: 5px 5px 0 0;
            transition: background-color 0.3s ease;
        }

        .table td {
            background-color: #f8f9fa;
            padding: 12px;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: #eaeaea;
            cursor: pointer;
            transform: scale(1.02);
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .back-btn {
            font-size: 24px;
            color: #05ffc5;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .back-btn:hover {
            color: #0df140;
            transform: translateX(-5px);
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
    </style>
</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container mt-5">
    <h2 class="manage-title text-center">View Categories</h2>

    <table class="table table-bordered text-center">
        <thead>
        <tr>
            <th>Category ID</th>
            <th>Category Name</th>
        </tr>
        </thead>
        <%
            List<CategoriesDTO> allCategories = (List<CategoriesDTO>) request.getAttribute("categories");
            if (allCategories != null && !allCategories.isEmpty()) {
        %>
        <tbody>
        <% for (CategoriesDTO categoriesDTO : allCategories) { %>
        <tr>
            <td><%= categoriesDTO.getCategoryId() %></td>
            <td><%= categoriesDTO.getCategoryName() %></td>
        </tr>
        <% } %>
        </tbody>
        <% } %>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



