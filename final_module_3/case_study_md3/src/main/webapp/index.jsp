<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  
  <meta charset="UTF-8">
  <title>Movie List</title>
  <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .movie-title {
      font-family: 'Creepster', cursive;
      font-size: 3rem;
      color: #ff4d4d;
      text-shadow: 2px 2px #000;
    }
    .card-img-top {
      height: 220px;
      object-fit: cover;
      border-bottom: 3px solid #dee2e6;
    }
    .card {
      transition: transform 0.3s, box-shadow 0.3s;
    }
    .card:hover {
      transform: translateY(-8px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }
    .card-title {
      font-weight: bold;
    }
    .btn-primary {
      background-color: #ff4d4d;
      border: none;
    }
    .btn-primary:hover {
      background-color: #e60000;
    }
  </style>
</head>
<body>
<div class="container py-5">
  <h1 class="text-center mb-5 movie-title">MOVIE LIST</h1>
  <div class="row g-4 justify-content-center">
    <c:forEach var="movie" items="${movies}">
      <div class="col-12 col-sm-6 col-md-4 col-lg-4 d-flex">
        <div class="card shadow-sm w-100 h-100">
          <img src="${movie.image}" class="card-img-top" alt="${movie.movie_name}">
          <div class="card-body d-flex flex-column">
            <h5 class="card-title text-center mb-2">${movie.movie_name}</h5>
            <p class="card-text text-muted small mb-3 text-center">
                ${movie.movie_genre} | ${movie.movie_duration}' | ${movie.movie_date}
            </p>
            <c:url var="bookingUrl" value="/booking">
              <c:param name="title" value="${movie.movie_name}" />
            </c:url>
            <a href="${bookingUrl}" class="btn btn-primary mt-auto">Book Now</a>

          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
<script src="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css"></script>
</body>
</html>
