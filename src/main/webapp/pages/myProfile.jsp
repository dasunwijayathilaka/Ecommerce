<%@ page import="lk.ijse.ecommerce.dto.UsersDTO" %><%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/16/2025
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* General Body Styling */
        body {
            background: linear-gradient(135deg, #f8f9fa, #e6e6e6);
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Profile Container */
        .profile-container {
            max-width: 800px;
            width: 100%;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.8s ease;
        }

        /* Profile Title */
        .profile-title {
            color: #e6a80f;
            font-weight: bold;
            font-size: 1.8rem;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Form Controls */
        .form-control {
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            font-size: 1rem;
            margin-bottom: 15px;
            transition: box-shadow 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(230, 168, 15, 0.7);
        }

        /* Buttons */
        .btn-primary {
            background-color: #e6a80f;
            border: none;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #d8950e;
            transform: scale(1.05);
        }

        /* Back Button */
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
            transform: scale(1.1);
        }

        /* Responsive Design */
        @media (max-width: 767px) {
            .profile-container {
                padding: 20px;
            }

            .profile-title {
                font-size: 1.5rem;
            }

            .btn-primary {
                font-size: 0.9rem;
                padding: 8px 15px;
            }
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
    </style>

</head>
<body>
<div class="profile-container">
    <div class="back d-flex justify-content-start mb-3 position-absolute">
        <a href="/E_Commerce_war_exploded/index" class="back-btn">&larr;</a>
    </div>
    <h1 class="profile-title">My Profile</h1>

    <%
        UsersDTO usersDTO = (UsersDTO) request.getAttribute("user");
        if (usersDTO != null) {
    %>

    <form action="/E_Commerce_war_exploded/myProfile" method="post">
        <div class="row g-3 mt-3">
            <div class="col-md-6">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" value="<%=usersDTO.getName()%>" disabled>
            </div>
            <div class="col-md-6">
                <label for="emailAddress" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="emailAddress" name="email" value="<%=usersDTO.getEmail()%>" disabled>
            </div>
            <div class="col-md-6">
                <label for="mobileNumber" class="form-label">Mobile Number</label>
                <input type="number" class="form-control" id="mobileNumber" name="tel" value="<%=usersDTO.getTel()%>" disabled>
            </div>
            <div class="col-md-6">
                <label for="userName" class="form-label">User Name</label>
                <input type="text" class="form-control" id="userName" name="userName" value="<%=usersDTO.getUserName()%>" disabled>
            </div>
            <div class="col-md-6">
                <label for="newPassword" class="form-label">New Password</label>
                <input type="password" class="form-control" id="newPassword" name="password" value="<%=usersDTO.getPassword()%>" disabled>
            </div>
            <div class="col-md-6">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" value="<%=usersDTO.getPassword()%>" disabled>
            </div>
        </div>
        <div class="mt-4">
            <button type="button" class="btn btn-primary" id="edit">Edit Profile</button>
            <button type="submit" class="btn btn-primary" id="save">Save</button>
        </div>
    </form>
    <%}%>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $('#save').hide();

    $('#edit').click(function () {
        $('#fullName').prop('disabled', false);
        $('#emailAddress').prop('disabled', false);
        $('#mobileNumber').prop('disabled', false);
        $('#userName').prop('disabled', false);
        $('#newPassword').prop('disabled', false);
        $('#confirmPassword').prop('disabled', false);
        $('#edit').hide();
        $('#save').show();
    });

    $('#save').click(function (e) {
        const newPassword = $('#newPassword').val().trim();
        const confirmPassword = $('#confirmPassword').val().trim();

        if (newPassword !== confirmPassword) {
            e.preventDefault(); // Prevent the form from being submitted
            alert('Passwords do not match. Please make sure both fields are the same.');
            return;
        }

        if (newPassword === '') {
            e.preventDefault();
            alert('Password fields cannot be empty.');
            return;
        }
    });

</script>
</body>
</html>
