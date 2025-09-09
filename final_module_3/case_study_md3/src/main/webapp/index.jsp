<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đặt Vé Phim</title>
    <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #212529;
        }

        .navbar-brand, .nav-link {
            color: #fff !important;
            font-weight: bold;
        }

        .movie-title {
            font-family: 'Creepster', cursive;
            font-size: 3rem;
            color: #ff4d4d;
            text-shadow: 2px 2px #000;
        }

        .card-img-top {
            height: 250px;
            object-fit: cover;
        }

        .card {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 15px;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .btn-primary {
            background-color: #ff4d4d;
            border: none;
        }

        .btn-primary:hover {
            background-color: #e60000;
        }

        .carousel-item img {
            height: 450px;
            object-fit: cover;
        }

        .carousel-item img {
            height: 400px;
            object-fit: cover;
        }

        @media (max-width: 768px) {
            .carousel-item img {
                height: 250px;
            }
        }

        @media (max-width: 576px) {
            .carousel-item img {
                height: 180px;
            }
        }

        .carousel-item img {
            height: 35vh; /* 35% chiều cao màn hình */
            object-fit: cover; /* giữ tỷ lệ ảnh, cắt phần thừa */
            width: 100%;
        }

    </style>
</head>
<body>


<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">MovieBooking</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon" style="color:#fff;"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">Trang Chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Phim</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
            </ul>
        </div>
    </div>
</nav>


<div id="movieCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/bannerAvenger.jpg" class="d-block w-100" alt="Banner 1">
        </div>
        <div class="carousel-item">
            <img src="images/bannerJoker.jpg" class="d-block w-100" alt="Banner 2">
        </div>
        <div class="carousel-item">
            <img src="images/bannerOppenheimer.webp" class="d-block w-100" alt="Banner 3">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#movieCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#movieCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-- Movie List -->
<div class="container py-5">
    <h1 class="text-center mb-5 movie-title">DANH SÁCH PHIM</h1>
    <div class="row g-4 justify-content-center">
        <c:forEach var="movie" items="${movies}">
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex">
                <div class="card shadow-sm w-100 h-100">
                    <img src="${movie.image}" class="card-img-top" alt="${movie.movie_name}">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title text-center mb-2">${movie.movie_name}</h5>
                        <p class="card-text text-muted small mb-3 text-center">
                                ${movie.movie_genre} | ${movie.movie_duration}' | ${movie.movie_date}
                        </p>
                        <c:url var="bookingUrl" value="/booking">
                            <c:param name="title" value="${movie.movie_name}"/>
                        </c:url>
                        <a href="${bookingUrl}" class="btn btn-primary mt-auto">Đặt Vé Ngay</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
