<%@ page import="lk.ijse.ecommerce.dto.ProductsDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerce.controller.LoginServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bootstrap E-Commerce UI</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      background-color: #EEEEEE;
    }
    .navbar {
      background-color: #e6a80f;
    }
    .navbar a , .name-div{
      color: white !important;
    }
    .product-card {
      border: 2px solid #e6a80f;
      border-radius: 10px;
      padding: 15px;
    }
    .product-card img {
      width: 100%;
      border-radius: 10px;
    }
    .price {
      font-weight: bold;
      font-size: 1.2rem;
    }
    .star-rating {
      color: #05ffc5;
    }
    .cart-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #e6a80f;
      border: none;
      border-radius: 50%;
      padding: 15px;
      color: white;
    }
    .menu{
      position: fixed;
      width: 20%;
      top: 10%;
      right: 10px;
      background-color: white;
      border: none;
      padding: 15px;
      color: white;
    }
    .menu > a , .menu > a > button {
      width: 100%;
    }
    .dropdown-menu {
      min-width: 200px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .dropdown-item {
      padding: 10px 15px;
      font-size: 1rem;
      transition: background-color 0.3s;
    }

    .dropdown-item:hover {
      background-color: #e6a80f;
      color: white;
    }

    .dropdown-toggle {
      background-color: #e6a80f !important;
      color: white !important;
      border: none;
      padding: 10px 15px;
      border-radius: 5px;
      font-size: 1rem;
      font-weight: bold;
    }

    .dropdown-toggle:hover {
      background-color: #e6a80f !important;
    }

    @media (max-width: 576px) {
      .container.mb-4.d-flex {
        flex-direction: column;
        align-items: stretch;
      }

      .dropdown {
        margin-bottom: 15px;
      }
    }
    @media (max-width: 652px) {
     .menu {
        width: 30%;
      }
    }
    @media (max-width: 652px) {
      .menu {
        width: 40%;
      }
    }
    @media (max-width: 392px) {
      .menu {
        top: 12%;
        width: 45%;
      }
    }
  </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-Shop</a>
    <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search" id="search-input">
      <button class="btn btn-light" type="button" id="search-button">Search</button>
    </form>
    <div id="name-div" class="name-div fw-bold">
      Name
    </div>
    <div id="login-div">
      <a href="pages/login.jsp">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="pages/signUp.jsp">Sign Up</a>
    </div>
  </div>
</nav>

<div id="menu" class="menu">
  <a href="/E_Commerce_war_exploded/myOrders"><button type="button" class="btn btn-outline-primary">My Orders</button></a>
  <a href="/E_Commerce_war_exploded/myProfile"><button type="button" class="btn btn-outline-primary">Manage Account</button></a>
  <a href="/E_Commerce_war_exploded/logOut"><button type="button" class="btn btn-outline-primary">Log Out</button></a>
</div>
<br><br>
<!-- Category and Sort Filters -->
<div class="container mb-4 d-flex justify-content-start align-items-center">
  <!-- Category Filter -->
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="categoryFilterButton" data-bs-toggle="dropdown" aria-expanded="false">
      Filter by Category
    </button>
    <ul class="dropdown-menu" aria-labelledby="categoryFilterButton">
      <!-- Items will be dynamically added here -->
    </ul>
  </div>
  &nbsp;&nbsp;&nbsp;
  <!-- Sort by Price -->
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="sortByPriceButton" data-bs-toggle="dropdown" aria-expanded="false">
      Sort by Price
    </button>
    <ul class="dropdown-menu" aria-labelledby="sortByPriceButton">
      <li><a class="dropdown-item sort-option" data-value="asc">Low to High</a></li>
      <li><a class="dropdown-item sort-option" data-value="desc">High to Low</a></li>
    </ul>
  </div>
</div>



<!-- Product Grid -->
<div class="container mt-5">
  <%
    List<ProductsDTO> allProducts = (List<ProductsDTO>) request.getAttribute("products");
    if (allProducts != null && !allProducts.isEmpty()) {
  %>
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <% for (ProductsDTO productsDTO : allProducts) {%>
    <div class="col">
      <a href="/E_Commerce_war_exploded/pages/itemClick.jsp?product=<%=productsDTO.getProductId()%>" class="text-decoration-none">
        <div class="product-card" data-name="<%=productsDTO.getProductName()%>" data-category="<%=productsDTO.getCategories().getCategoryName()%>" data-price="<%=productsDTO.getPrice()%>">
          <img src="<%=productsDTO.getImage()%>" alt="Product Image">
          <p><%=productsDTO.getProductName()%></p>
          <p class="price">Rs. <%=productsDTO.getPrice()%></p>
          <p class="star-rating">★★★★★</p>
        </div>
      </a>
    </div>
    <%}%>
  </div>
  <%
    }
  %>
</div>

<!-- Floating Cart Button -->
<a href="/E_Commerce_war_exploded/cart">
  <button class="cart-btn">🛒</button>
</a>

<%
  String message = request.getParameter("message");

  if (!message.equals("null")) {
%>
<script>
  alert("message : <%=message%>");
</script>
<% }
  String checked = request.getParameter("checked");
  String username = request.getParameter("username");
  if (LoginServlet.username != null) {
%>
<script>
  document.getElementById('name-div').innerText = "<%=LoginServlet.username%>";
  document.getElementById("login-div").style.display = "none";
</script>
<%}%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
  $('#name-div').hide();
  <%
   if (LoginServlet.username != null) {
  %>
  document.getElementById("name-div").style.display = "block";
  <%}%>

  $('#menu').hide();
  $('#name-div').on('click', function() {
    if ($('#menu').is(':visible')) {
      $('#menu').hide();  // If visible, hide it
    } else {
      $('#menu').show();  // If hidden, show it
    }
  });

  $('#search-button').on('click', function () {
    const searchValue = $('#search-input').val().toLowerCase(); // Get the search value in lowercase
    $('.product-card').each(function () {
      const productName = $(this).data('name').toLowerCase(); // Get the product name in lowercase
      if (productName.includes(searchValue)) {
        $(this).closest('.col').show(); // Show the card if it matches
      } else {
        $(this).closest('.col').hide(); // Hide the card if it doesn't match
      }
    });
  });

  let loadDropDown = function () {
    $.ajax({
      url: 'http://localhost:8080/E_Commerce_war_exploded/getCategoryNames',
      type: 'GET',
      success: function (response) {
        console.log(response); // Check the response format

        // Target the dropdown menu for the category filter
        const dropdownMenu = $('#categoryFilterButton').next('.dropdown-menu');

        // Clear existing items in the dropdown menu
        dropdownMenu.empty();

        // Add the "All Categories" option
        $('<li>')
                .append($('<a>')
                        .addClass('dropdown-item category-option')
                        .data('value', '')
                        .text('All Categories'))
                .appendTo(dropdownMenu);

        // Add each category from the response
        $.each(response, function (index, value) {
          $('<li>')
                  .append($('<a>')
                          .addClass('dropdown-item category-option')
                          .data('value', value)
                          .text(value))
                  .appendTo(dropdownMenu);
        });
      },
      error: function (error) {
        console.error('Error fetching categories:', error);
      }
    });
  };

  loadDropDown();

  $(document).on('click', '.category-option', function () {
    $(this).closest('.col').show();
    const selectedCategory = $(this).data('value');

    // Filter the product cards (adjust logic based on your use case)
    $('.product-card').each(function () {
      const cardCategory = $(this).data('category').toLowerCase();

      if (selectedCategory === '' || cardCategory === selectedCategory.toLowerCase()) {
        $(this).closest('.col').show();
      } else {
        $(this).closest('.col').hide();
      }
    });
  });


  $('.sort-option').on('click', function () {
    const sortOrder = $(this).data('value');
    const productCards = $('.product-card').parent();

    const sortedCards = productCards.sort(function (a, b) {
      const priceA = parseFloat($(a).find('.product-card').data('price'));
      const priceB = parseFloat($(b).find('.product-card').data('price'));

      return sortOrder === 'asc' ? priceA - priceB : priceB - priceA;
    });

    $('.row').append(sortedCards);
  });

</script>
</body>
</html>