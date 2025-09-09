<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Cập nhật phim</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .form-container {
      max-width: 600px;
      margin: 50px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    .form-container h2 {
      text-align: center;
      margin-bottom: 30px;
      font-weight: 700;
      text-transform: uppercase;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      font-weight: 500;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="form-container">
    <h2>Cập nhật phim</h2>
    <form action="${pageContext.request.contextPath}/api/movie" method="post">
      <input type="hidden" name="action" value="update"/>
      <input type="hidden" name="id" value="${movie.movie_id}"/>

      <div class="form-group">
        <label for="name">Tên phim</label>
        <input type="text" class="form-control" id="name" name="name" value="${movie.movie_name}" required/>
      </div>

      <div class="form-group">
        <label for="genre">Thể loại</label>
        <input type="text" class="form-control" id="genre" name="genre" value="${movie.movie_genre}" required/>
      </div>

      <div class="form-group">
        <label for="duration">Thời lượng (phút)</label>
        <input type="number" class="form-control" id="duration" name="duration" value="${movie.movie_duration}" required/>
      </div>

      <div class="form-group">
        <label for="date">Ngày chiếu</label>
        <input type="date" class="form-control" id="date" name="date" value="${movie.movie_date}" required/>
      </div>

      <div class="form-group">
        <label for="image">URL ảnh / Đường dẫn local</label>
        <input type="text" class="form-control" id="image" name="image" value="${movie.image}"/>
      </div>

      <div class="text-center mt-4">
        <button type="submit" class="btn btn-primary btn-lg">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/api/movie" class="btn btn-secondary btn-lg ms-2">Hủy</a>
      </div>
    </form>
  </div>
</div>
<script src="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
