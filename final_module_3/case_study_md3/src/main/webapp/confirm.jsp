<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Confirm Booking</title>
  <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
  <h2 class="mb-3">Booking Information</h2>

  <div class="card mb-4">
    <div class="card-body">
      <h4>${movie.title}</h4>
      <p><strong>Type:</strong> ${movie.type}</p>
      <p><strong>Duration:</strong> ${movie.duration}</p>
      <p><strong>Release Date:</strong> ${movie.releaseDate}</p>
      <p><strong>Tickets:</strong> ${quantity}</p>
    </div>
  </div>

  <form action="/confirm" method="post">
    <input type="hidden" name="title" value="${movie.title}">
    <input type="hidden" name="quantity" value="${quantity}">

    <div class="mb-3">
      <label class="form-label">Your Name</label>
      <input type="text" name="customerName" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Phone Number</label>
      <input type="text" name="phone" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-success">Finish Booking</button>
  </form>
</div>
</body>
</html>
  