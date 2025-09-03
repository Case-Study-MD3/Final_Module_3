<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thêm phim mới</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4">Thêm phim mới</h2>

  <!-- Form thêm phim -->
  <form action="${pageContext.request.contextPath}/api/movie" method="post">
    <input type="hidden" name="action" value="create">

    <div class="mb-3">
      <label class="form-label">Tên phim</label>
      <input type="text" name="name" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Thể loại</label>
      <input type="text" name="genre" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Thời lượng (phút)</label>
      <input type="number" name="duration" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Ngày chiếu</label>
      <input type="date" name="date" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Hình ảnh (URL)</label>
      <input type="text" name="image" class="form-control">
    </div>

    <button type="submit" class="btn btn-primary">Lưu</button>
    <a href="${pageContext.request.contextPath}/api/movie" class="btn btn-secondary">Hủy</a>
  </form>
</div>

<script src="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
