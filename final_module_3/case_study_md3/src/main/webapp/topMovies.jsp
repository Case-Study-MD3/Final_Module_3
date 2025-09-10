<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Top 5 Phim Được Đặt Nhiều Nhất</title>
    <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
    <h1 class="text-center mb-5">Top 5 Phim Được Đặt Nhiều Nhất</h1>
    <div class="row g-4 justify-content-center">
        <c:forEach var="movie" items="${topMovies}">
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                <div class="card shadow-sm h-100">
                    <img src="${movie.image}" class="card-img-top" alt="${movie.movieName}">
                    <div class="card-body text-center">
                        <h5 class="card-title">${movie.movieName}</h5>
                        <p class="card-text">${movie.movieGenre}</p>
                        <p class="card-text">Số vé đã bán: ${movie.totalTickets}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
