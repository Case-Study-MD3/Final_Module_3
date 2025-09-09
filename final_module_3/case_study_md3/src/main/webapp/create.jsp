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
  <h2 class="mb-4 text-center">THÊM PHIM MỚI</h2>

  <!-- Form thêm phim -->
  <form action="${pageContext.request.contextPath}/api/movie" method="post" class="card p-4 shadow rounded">
    <input type="hidden" name="action" value="create">

    <div class="mb-3">
      <label class="form-label">Tên phim</label>
      <input type="text" name="name" class="form-control" placeholder="Nhập tên phim" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Thể loại</label>
      <input type="text" name="genre" class="form-control" placeholder="Ví dụ: Hành động, Tình cảm..." required>
    </div>

    <div class="mb-3">
      <label class="form-label">Thời lượng (phút)</label>
      <input type="number" name="duration" class="form-control" placeholder="120" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Ngày chiếu</label>
      <input type="date" name="date" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Hình ảnh (URL)</label>
      <input type="text" name="image" class="form-control" placeholder="http://...">
    </div>

    <hr class="my-4">

    <h5 class="mb-3">Thông tin suất chiếu</h5>
    <div class="row">
      <div class="col-md-6 mb-3">
        <label class="form-label">Phòng chiếu</label>
        <input type="number" name="roomId" class="form-control" required>
      </div>

      <div class="col-md-6 mb-3">
        <label class="form-label">Thời gian bắt đầu</label>
        <input type="datetime-local" name="startTime" class="form-control" required>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6 mb-3">
        <label class="form-label">Giá vé</label>
        <input type="number" step="0.01" name="price" class="form-control" placeholder="100000" required>
      </div>

      <div class="col-md-6 mb-3">
        <label class="form-label">Tổng ghế</label>
        <input type="number" name="totalSeats" class="form-control" placeholder="100" required>
      </div>
    </div>

    <div class="d-flex justify-content-between mt-4">
      <a href="${pageContext.request.contextPath}/api/movie" class="btn btn-secondary">Hủy</a>
      <button type="submit" class="btn btn-primary">Lưu</button>
    </div>
  </form>
</div>

<script src="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
