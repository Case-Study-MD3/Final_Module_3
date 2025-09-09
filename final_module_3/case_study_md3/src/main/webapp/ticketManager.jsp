<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quản lý vé</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center mb-4">Quản lý vé & Doanh thu</h2>

  <div class="table-responsive">
    <table class="table table-striped table-hover shadow-sm">
      <thead class="table-dark">
      <tr>
        <th>Tên phim</th>
        <th>Số vé đã bán</th>
        <th>Doanh thu (VND)</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="movie" items="${movies}">
        <tr>
          <td>${movie.movie_name}</td>
          <td>${ticketCountMap[movie.movie_id]}</td>
          <td>${revenueMap[movie.movie_id]}</td>
        </tr>
      </c:forEach>

      </tbody>
    </table>
  </div>
  <a href="${pageContext.request.contextPath}/api/movie" class="btn btn-primary mt-3">Quay lại Quản lý Phim</a>
</div>
<script src="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
