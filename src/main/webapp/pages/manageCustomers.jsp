<%@ page import="lk.ijse.ecommerce.dto.UsersDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/16/2025
  Time: 7:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* General Body Styling */
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Navbar Styling */
        .navbar {
            border-bottom: 2px solid #11d13b;
            padding: 10px 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: slideDown 1s ease;
        }

        .navbar .dropdown-menu {
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease;
        }

        .navbar .dropdown-menu a {
            color: #05ffc5;
            font-weight: 500;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .navbar .dropdown-menu a:hover {
            background-color: #f8f9fa;
            color: #29b347;
        }

        /* Header Styling */
        .header {
            font-size: 2.5rem;
            font-weight: bold;
            color: #05ffc5;
            text-align: center;
            margin: 30px 0;
            animation: fadeIn 1s ease;
        }

        /* Form and Input Styling */
        .form-control, .search-container input {
            background-color: #f0f0f0;
            border: 2px solid #ddd;
            border-radius: 25px;
            padding: 10px 15px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus, .search-container input:focus {
            border-color: #11d13b;
            box-shadow: 0 0 8px rgb(20, 138, 46);
            outline: none;
        }

        .search-container button {
            border: none;
            background-color: #ed5605;
            color: white;
            border-radius: 50%;
            padding: 10px 15px;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .search-container button:hover {
            transform: scale(1.1); /* Slight zoom */
            background-color: #f36071;
        }

        /* Table Styling */
        .table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease;
        }

        .table th {
            background-color: #11d13b;
            color: white;
            font-size: 1rem;
            text-align: left;
            padding: 10px;
        }

        .table td {
            background-color: #f8f9fa;
            padding: 10px;
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover td {
            background-color: #f0f0f0;
        }

        /* Image Styling */
        .image-container img {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .image-container img:hover {
            transform: scale(1.05); /* Slight zoom on hover */
        }

        /* Buttons */
        .btn-primary {
            background-color: #05ffc5;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #11d13b;
            transform: scale(1.05);
        }

        /* Animations */
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

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 767px) {
            .header {
                font-size: 2rem;
            }

            .table {
                font-size: 0.9rem;
            }

            .btn-primary {
                padding: 8px 15px;
                font-size: 0.9rem;
            }

            .navbar .dropdown-menu {
                animation: none; /* Remove animation for small devices */
            }
        }
    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light px-4">
    <a class="navbar-brand" href="#">
        <img src="images/ecomlogo.jpg" alt="Logo" style="width: 40px; height: 40px; margin-right: 10px;">
        I-Dealz
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="manageCustomers?message=">Customers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/E_Commerce_war_exploded/viewOrders">Orders</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="manageProductsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Products
                </a>
                <ul class="dropdown-menu" aria-labelledby="manageProductsDropdown">
                    <li><a class="dropdown-item" href="pages/saveProducts.jsp">Add Products</a></li>
                    <li><a class="dropdown-item" href="pages/deleteProducts.jsp">Delete Products</a></li>
                    <li><a class="dropdown-item" href="pages/updateProducts.jsp">Update Products</a></li>
                    <li><a class="dropdown-item" href="/E_Commerce_war_exploded/viewProducts">View Products</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="manageCategoriesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Categories
                </a>
                <ul class="dropdown-menu" aria-labelledby="manageCategoriesDropdown">
                    <li><a class="dropdown-item" href="pages/saveCategories.jsp">Add Categories</a></li>
                    <li><a class="dropdown-item" href="pages/deleteCategories.jsp">Delete Categories</a></li>
                    <li><a class="dropdown-item" href="pages/updateCategories.jsp">Update Categories</a></li>
                    <li><a class="dropdown-item" href="/E_Commerce_war_exploded/viewCategories">View Categories</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <!-- Header -->
    <h1 class="text-purple text-center">View Customers</h1>
    <!-- Search Bar -->
    <div class="row mb-3">
        <div class="col-12 text-end">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Customer ID" aria-label="Customer ID" id="search-input">
                <button class="btn btn-outline-primary" type="button" id="search-button">
                    search
                </button>
            </div>
        </div>
    </div>

    <!-- Table -->
    <div class="table-responsive">
        <table class="table text-center">
            <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>User Name</th>
                <th>Password</th>
            </tr>
            </thead>
            <%
                List<UsersDTO> allCustomers = (List<UsersDTO>) request.getAttribute("customers");
                if (allCustomers != null && !allCustomers.isEmpty()) {
            %>
            <tbody id="tblBody">
            <% for (UsersDTO usersDTO : allCustomers) {%>
            <tr>
                <td><%=usersDTO.getUserId()%></td>
                <td><%=usersDTO.getName()%></td>
                <td><%=usersDTO.getEmail()%></td>
                <td><%=usersDTO.getTel()%></td>
                <td><%=usersDTO.getUserName()%></td>
                <td><%=usersDTO.getPassword()%></td>
            </tr>
            <%}%>
            </tbody>
            <%
                }
            %>
        </table>
    </div>

        <%
          String message = request.getParameter("message");

          if (!message.equals("") && !message.isEmpty() && message != null) {
        %>
            <script>
                alert("message : <%=message%>");
            </script>
        <% } %>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $('#search-button').on('click', function() {
        const search = $('#search-input').val();
        const rows = $('#tblBody tr');

        let found = false;

        rows.each(function () {
            const row = $(this);
            const userId = row.find('td:first').text();

            if (userId === search) {
                row.show();
                found = true;
            } else {
                row.hide();
            }
        });

        if (!found) {
            alert('No matching record found!');
        }

    });
</script>
</body>
</html>

