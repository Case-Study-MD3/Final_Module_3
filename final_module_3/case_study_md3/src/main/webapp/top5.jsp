<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Top 5 Phim Bán Chạy</title>
  <link href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .movie-card {
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .movie-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 20px rgba(0,0,0,0.15);
    }
    .rank-badge {
      position: absolute;
      top: 10px;
      left: 10px;
      background: #dc3545;
      color: #fff;
      font-weight: bold;
      padding: 5px 10px;
      border-radius: 50px;
    }
    /* Khung chứa ảnh đồng đều */
    .image-wrapper {
      width: 100%;
      height: 260px;
      overflow: hidden;
      border-top-left-radius: 0.75rem;
      border-top-right-radius: 0.75rem;
      background-color: #f1f1f1;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .image-wrapper img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .img-placeholder {
      color: #6c757d;
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="container py-4">
  <h2 class="mb-4 text-center text-danger fw-bold">🎬 Top 5 Phim Bán Chạy Nhất</h2>

  <c:if test="${empty movies}">
    <div class="alert alert-info text-center">Chưa có dữ liệu phim</div>
  </c:if>

  <c:if test="${not empty movies}">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-5 g-4">
      <c:forEach var="movie" items="${movies}" varStatus="status">
        <div class="col">
          <div class="card h-100 shadow-sm movie-card position-relative">
            <span class="rank-badge">#${status.index + 1}</span>

            <!-- Khung ảnh cố định -->
            <div class="image-wrapper">
              <c:choose>
                <c:when test="${not empty movie.image}">
                  <c:choose>
                    <%-- Nếu là URL web --%>
                    <c:when test="${movie.image.startsWith('http://') || movie.image.startsWith('https://')}">
                      <img src="${movie.image}"
                           alt="${movie.movie_name}"
                           onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/no-image.png';">
                    </c:when>
                    <%-- Nếu là đường dẫn local --%>
                    <c:otherwise>
                      <img src="${pageContext.request.contextPath}/${movie.image}"
                           alt="${movie.movie_name}"
                           onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/no-image.png';">
                    </c:otherwise>
                  </c:choose>
                </c:when>
                <c:otherwise>
                  <div class="img-placeholder">Không có ảnh</div>
                </c:otherwise>
              </c:choose>
            </div>

            <div class="card-body text-center">
              <h5 class="card-title text-primary fw-bold">${movie.movie_name}</h5>
              <p class="card-text small">
                🎭 <strong>${movie.movie_genre}</strong><br>
                ⏱ ${movie.movie_duration} phút<br>
                📅 ${movie.movie_date}
              </p>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </c:if>

  <div class="mt-4 text-center">
    <a href="${pageContext.request.contextPath}/api/movie" class="btn btn-outline-primary px-4">⬅ Quay lại quản lý phim</a>
  </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
