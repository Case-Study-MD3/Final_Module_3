<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Movie Manager</title>
    <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4">Danh sách phim</h2>

    <!-- Hiển thị message nếu có -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <!-- Button tạo phim mới -->
    <a href="api/movie?action=movie" class="btn btn-primary mb-3">Thêm phim mới</a>

    <!-- Table danh sách phim -->
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>Tên phim</th>
            <th>Thể loại</th>
            <th>Thời lượng (phút)</th>
            <th>Ngày chiếu</th>
            <th>Hình ảnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="movie" items="${movies}" varStatus="status">
            <tr>
                <td>${movie.movie_name}</td>
                <td>${movie.movie_genre}</td>
                <td>${movie.movie_duration}</td>
                <td>${movie.movie_date}</td>
                <td>
                    <c:if test="${not empty movie.image}">
                        <img src="${movie.image}" alt="poster" width="80">
                    </c:if>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
