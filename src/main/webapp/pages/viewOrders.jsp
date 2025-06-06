<%@ page import="lk.ijse.ecommerce.dto.OrdersDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/19/2025
  Time: 8:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Order</title>
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
            text-align: center;
        }

        .table th {
            background-color: #16aa36;
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
            color: #0cea3b;
            transform: translateX(-5px);
        }

        .manage-btn {
            background-color: #05ffc5;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .manage-btn:hover {
            background-color: #12e841;
            transform: scale(1.05);
        }

        /* Transparent Box Style */
        .details-box {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .details-box:hover {
            transform: scale(1.02);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .image-container img {
            max-width: 100%;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .image-container img:hover {
            transform: scale(1.05);
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

        /* Centered Box */
        .centered-box {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        /* Responsive Design */
        @media (max-width: 767px) {
            .product-card {
                margin-bottom: 15px;
            }

            .manage-title {
                font-size: 1.5rem;
            }

            .price {
                font-size: 1rem;
            }
        }

    </style>

</head>


<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">×</a>
<div class="container mt-5">
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h1 class="manage-title">View Orders</h1>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-12 text-end">
            <div class="input-group">
                <input type="number" class="form-control" placeholder="Order ID" aria-label="Order ID" id="search-input">
                <button class="btn btn-outline-primary" type="button" id="search-button">
                    search
                </button>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Table Section -->
        <div class="col-lg-8">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                </thead>
                <%
                    List<OrdersDTO> allOrders = (List<OrdersDTO>) request.getAttribute("orders");
                    if (allOrders != null && !allOrders.isEmpty()) {
                %>
                <tbody id="tblBody">
                <% for (int i = 0; i < allOrders.size(); i++) {
                    for (int j = 0; j < allOrders.get(i).getOrderDetails().size(); j++) {
                %>
                <tr>
                    <td><%=allOrders.get(i).getOrderId()%></td>
                    <td><%=allOrders.get(i).getDate()%></td>
                    <td><%=allOrders.get(i).getOrderDetails().get(j).getProduct().getProductId()%></td>
                    <td><%=allOrders.get(i).getOrderDetails().get(j).getQuantity()%></td>
                    <td><%=allOrders.get(i).getOrderDetails().get(j).getProduct().getPrice() * allOrders.get(i).getOrderDetails().get(j).getQuantity()%></td>
                    <td><button class="btn btn-sm manage-btn" onclick="tblButtonClick(<%=i%>,<%=j%>)">Manage Button</button></td>
                </tr>
                <% }
                } %>
                </tbody>
                <%
                    }
                %>
            </table>
        </div>

        <!-- Details Section -->
        <div class="col-lg-4 centered-box" id="visible-div">
            <div class="details-box mb-3">
                <p id="order-id"><strong>Order ID:</strong> 001</p>
                <p id="customer-id"><strong>Customer ID:</strong> C123</p>
                <p id="date"><strong>Date:</strong> 2025-01-18</p>
                <p id="product-id"><strong>Product ID:</strong> P456</p>
                <p id="description"><strong>Description:</strong> High-quality smartphone</p>
                <p id="category"><strong>Category:</strong> Electronics</p>
                <p id="qty"><strong>Order Quantity:</strong> 1</p>
                <p id="total"><strong>Total Price:</strong> $200</p>
            </div>
            <div class="image-container text-center">
                <img alt="Product Image" id="img">
            </div>
        </div>
    </div>
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
            const orderId = row.find('td:first').text();

            if (orderId === search) {
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

    $("#visible-div").hide();

    function tblButtonClick(orderDetailsIndex , productDetailsIndex) {
        console.log("Okay")

        $.ajax({
            url : "http://localhost:8080/E_Commerce_war_exploded/loadOrders",
            method : "GET",
            data : {
                orderDetailsIndex : orderDetailsIndex,
                productDetailsIndex : productDetailsIndex
            },
            success : function(response) {
              console.log(response);
                $("#order-id").text('Order ID : ' + response.orderId);
                $("#customer-id").text('Customer ID : ' + response.customerId);
                $("#date").text('Date : ' + response.orderDate);
                $("#product-id").text('Product Name : ' + response.productName);
                $("#description").text('Description : ' + response.description);
                $("#category").text('Category : ' + response.category);
                $("#qty").text('Quantity : ' + response.quantity);
                $("#total").text('Order Total : ' + response.total);
                $('#img').attr('src', response.image);

                $("#visible-div").show();
            },
            error : function(xhr, status, error) {
                console.log("Error: " + error);
            }
        })
    }
</script>
</body>
</html>
