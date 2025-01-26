<%--
  Created by IntelliJ IDEA.
  User: RedMark
  Date: 1/19/2025
  Time: 8:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Categories</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }

        .manage-title {
            color: #e6a80f;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-control {
            background-color: #eaeaea;
        }

        .table thead {
            background-color: #e6a80f;
            color: white;
        }

        .btn-primary {
            background-color: #e6a80f;
            border: none;
        }

        .btn-primary:hover {
            opacity: 0.9;
        }

        .back-btn {
            font-size: 24px;
            color: #e6a80f;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
        }
    </style>
</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container mt-4">

    <h2 class="manage-title text-center">Update Categories</h2>

    <!-- Form Inputs -->
    <div class="col-lg-8">
        <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" id="search-input">
            <button class="btn btn-primary" id="search-button" type="button">Search</button>
        </form>
        <form action="/E_Commerce_war_exploded/updateCategories" method="post" >
            <input class="form-control me-2" type="search" placeholder="Search" name="search" id="disable-search-input">
            <div class="mb-3">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" id="categoryName" name="categoryName" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Update Category</button>
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
