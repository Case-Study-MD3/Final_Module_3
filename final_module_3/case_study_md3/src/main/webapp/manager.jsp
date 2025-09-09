<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý phim</title>
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
            border: 1px solid #ddd;
        }
        .btn-add {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .alert {
            font-weight: 500;
        }
        .img-placeholder {
            width: 250px;
            height: 120px;
            background-color: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 5px;
            border: 1px solid #ddd;
            color: #6c757d;
            font-size: 14px;
        }
        .btn-action {
            display: flex;
            gap: 5px;
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
                        <c:choose>
                            <c:when test="${not empty movie.image}">
                                <c:choose>
                                    <%-- Kiểm tra nếu là URL web --%>
                                    <c:when test="${movie.image.startsWith('http://') || movie.image.startsWith('https://')}">
                                        <img src="${movie.image}"
                                             alt="poster"
                                             class="movie-img"
                                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/no-image.png'; this.className='img-placeholder';">
                                    </c:when>
                                    <%-- Nếu là đường dẫn local --%>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/${movie.image}"
                                             alt="poster"
                                             class="movie-img"
                                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/no-image.png'; this.className='img-placeholder';">
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <%-- Nếu không có ảnh --%>
                            <c:otherwise>
                                <div class="img-placeholder">
                                    Không có ảnh
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="btn-action">
                        <a href="/api/movie?action=edit&movie_id=${movie.movie_id}" class="btn btn-warning btn-sm">
                            Sửa
                        </a>
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
</html>
