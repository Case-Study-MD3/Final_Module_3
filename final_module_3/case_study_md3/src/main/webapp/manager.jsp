<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Movie Manager</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .movie-img {
            width: 250px;
            height: 120px;
            object-fit: cover;
            border-radius: 5px;
        }
        .btn-add {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .alert {
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center" style="font-family: 'Roboto', sans-serif; font-weight: 700; text-transform: uppercase;">
        Quản lý phim
    </h2>


    <!-- Message -->
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Button thêm phim mới -->
    <div class="mb-3 text-end">
        <a href="/api/movie?action=movie" class="btn btn-success">
            <span class="bi bi-plus-lg"></span> Thêm phim mới
        </a>
    </div>

    <!-- Table danh sách phim -->
    <div class="table-container">
        <table class="table table-striped table-hover shadow-sm bg-white rounded">
            <thead class="table-dark">
            <tr>
                <th>Tên phim</th>
                <th>Thể loại</th>
                <th>Thời lượng (phút)</th>
                <th>Ngày chiếu</th>
                <th>Hình ảnh</th>
                <th>Hành động</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="movie" items="${movies}">
                <tr>
                    <td>${movie.movie_name}</td>
                    <td>${movie.movie_genre}</td>
                    <td>${movie.movie_duration}</td>
                    <td>${movie.movie_date}</td>
                    <td>
                        <c:if test="${not empty movie.image}">
                            <img src="${pageContext.request.contextPath}/${movie.image}" alt="poster" class="movie-img">
                        </c:if>
                    </td>
                    <td>
                        <a href="/api/movie?action=delete&movie_id=${movie.movie_id}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xoá phim này?');">
                            Xoá
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</body>
</html>
