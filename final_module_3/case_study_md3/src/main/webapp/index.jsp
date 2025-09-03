<%@ page import="service.IMovieService,service.MovieServiceImpl,entity.Movie" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Movie List</title>
  <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .card-img-top { width:100%; height:150px; object-fit:cover; }
  </style>
</head>
<body class="bg-light">
<div class="container py-4">
  <h1 class="text-center mb-4" style="font-family: 'Creepster',cursive">MOVIE LIST</h1>
  <div class="row g-4 justify-content-center">
    <%
      IMovieService movieService = new MovieServiceImpl();
      for(Movie movie : movieService.getAllMovies().values()){
    %>
    <div class="col-md-4">
      <div class="card shadow-sm h-100">
        <img src="<%= movie.getImage() %>" class="card-img-top" alt="<%= movie.getTitle() %>">
        <div class="card-body">
          <h5 class="card-title"><%= movie.getTitle() %></h5>
          <p class="card-text">Type: <%= movie.getType() %> - Duration: <%= movie.getDuration() %>' - Release date: <%= movie.getReleaseDate() %></p>
          <a href="booking?title=<%= java.net.URLEncoder.encode(movie.getTitle(), "UTF-8") %>"
             class="btn btn-primary w-100">Booking</a>
        </div>
      </div>
    </div>
    <% } %>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
