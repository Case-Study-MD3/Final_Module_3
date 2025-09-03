<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>${title} - Booking</title>
  <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
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
  </style>
</head>
<body>
<div class="container py-4">

  <div class="movie-card text-center mb-4">
    <h1 class="mb-3">${title}</h1>
    <img src="${image}" class="img-fluid rounded shadow mb-3" alt="${title}">
    <ul class="list-group w-50 mx-auto">
      <li class="list-group-item"><strong>Type:</strong> ${type}</li>
      <li class="list-group-item"><strong>Duration:</strong> ${duration}</li>
      <li class="list-group-item"><strong>Release Date:</strong> ${date}</li>
    </ul>
  </div>


  <div class="ticket-section">
    <h3>Book Your Tickets</h3>
    <form action="/confirm" method="post">
      <input type="hidden" name="title" value="${title}">


      <div class="mb-3">
        <label for="ticketsSelect" class="form-label">Quantity Tickets</label>
        <select class="form-select" id="ticketsSelect" name="tickets" onchange="showCustomInput(this)">
          <option value="1">1 Ticket</option>
          <option value="2">2 Tickets</option>
          <option value="3">3 Tickets</option>
          <option value="optional">Optional</option>
        </select>
      </div>


      <div class="mb-3" id="customTicketsContainer" style="display: none;">
        <label for="customTickets" class="form-label">Enter Custom Quantity</label>
        <input type="number" id="customTickets" name="customTickets" min="1" max="100" class="form-control" placeholder="Enter quantity">
      </div>


      <button type="submit" class="btn btn-primary">Confirm Booking</button>
      <a href="index.jsp" class="btn btn-secondary mt-2">Back to Home</a>
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
</script>
</body>
</html>
