<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>${title} - Booking</title>
  <link href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .movie-card img {
      max-height: 350px;
      object-fit: cover;
    }
    .ticket-section {
      margin-top: 20px;
      padding: 20px;
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .ticket-section h3 {
      margin-bottom: 15px;
    }
    .btn-primary {
      width: 100%;
    }
    .img-fixed {
      width: 50%;
      height: 500px;
      object-fit: cover;
      border-radius: 8px;
    }

  </style>
</head>
<body>
<div class="container py-4">


  <div class="movie-card text-center mb-4">
    <h1 class="mb-3">${title}</h1>
    <img src="${images}" class="img-fluid rounded shadow mb-3 img-fixed" alt="${title}">
    <ul class="list-group w-50 mx-auto">
      <li class="list-group-item"><strong>Thể loại:</strong> ${type}</li>
      <li class="list-group-item"><strong>Thời lượng:</strong> ${duration} phút</li>
      <li class="list-group-item"><strong>Ngày khởi chiếu:</strong> ${date}</li>
    </ul>
  </div>

  <div class="ticket-section">
    <h3>Đặt vé của bạn</h3>
    <div class="alert alert-info mb-3">
      <strong>Số ghế còn lại:</strong> ${remainingSeats}<br><br>
      <strong>Giá vé:</strong> <span id="totalPrice" data-price="${Price}">${Price}</span> VND
    </div>

    <c:if test="${not empty error}">
      <div class="alert alert-danger">
          ${error}
      </div>
    </c:if>

    <form action="confirm" method="post">
      <input type="hidden" name="step" value="step1">
      <input type="hidden" name="title" value="${title}">

      <div class="mb-3">
        <label for="ticketsSelect" class="form-label">Số lượng vé</label>
        <select class="form-select" id="ticketsSelect" name="tickets" onchange="showCustomInput(this)">
          <option value="1" <c:if test="${tickets == '1'}">selected</c:if>>1 vé</option>
          <option value="2" <c:if test="${tickets == '2'}">selected</c:if>>2 vé</option>
          <option value="3" <c:if test="${tickets == '3'}">selected</c:if>>3 vé</option>
          <option value="optional" <c:if test="${tickets == 'optional'}">selected</c:if>>Tùy chọn</option>
        </select>
      </div>

      <div class="mb-3" id="customTicketsContainer" style="display: none;">
        <label for="customTickets" class="form-label">Nhập số lượng vé</label>
        <input type="number" id="customTickets" name="customTickets" min="1" max="100"
               class="form-control" placeholder="Nhập số lượng"
               value="${customTickets}">
      </div>

      <button type="submit" class="btn btn-primary">Xác nhận đặt vé</button>
      <a href="movies" class="btn btn-secondary mt-2">Quay lại danh sách phim</a>
    </form>
  </div>

</div>

<script>
  function showCustomInput(selectElement) {
    const container = document.getElementById('customTicketsContainer');
    if (selectElement.value === 'optional') {
      container.style.display = 'block';
    } else {
      container.style.display = 'none';
    }
  }

  window.onload = function () {
    const selectedValue = document.getElementById('ticketsSelect').value;
    if (selectedValue === 'optional') {
      document.getElementById('customTicketsContainer').style.display = 'block';
    }
  }

    function updateTotalPrice() {
    const basePrice = parseInt(document.getElementById('totalPrice').getAttribute('data-price'));
    const select = document.getElementById('ticketsSelect');
    const customInput = document.getElementById('customTickets');
    let quantity = 1;

    if (select.value === 'optional') {
    quantity = customInput.value ? parseInt(customInput.value) : 1;
  } else {
    quantity = parseInt(select.value);
  }

    if (isNaN(quantity) || quantity <= 0) quantity = 1;

    const total = basePrice * quantity;
    document.getElementById('totalPrice').textContent = total.toLocaleString();
  }

    document.getElementById('ticketsSelect').addEventListener('change', function() {
    updateTotalPrice();
    showCustomInput(this);
  });

    document.getElementById('customTickets').addEventListener('input', updateTotalPrice);

    window.onload = function () {
    if (document.getElementById('ticketsSelect').value === 'optional') {
    document.getElementById('customTicketsContainer').style.display = 'block';
  }
    updateTotalPrice();
  }


</script>
</body>
</html>
