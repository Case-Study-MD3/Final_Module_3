<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Xác nhận đặt vé</title>
  <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .card {
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .card-body h4 {
      color: #ff4d4d;
      font-weight: bold;
    }
    .form-label {
      font-weight: 600;
    }
    .btn-success {
      width: 100%;
      font-size: 1.1rem;
      font-weight: bold;
    }
    .btn-secondary {
      width: 100%;
      margin-top: 10px;
    }
    .page-title {
      text-align: center;
      font-size: 2rem;
      font-weight: bold;
      color: #333;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
<div class="container py-5">
  <h2 class="page-title">XÁC NHẬN THÔNG TIN ĐẶT VÉ</h2>


  <div class="card mb-4">
    <div class="card-body">
      <h4>${movie.movie_name}</h4>
      <hr>
      <p><strong>🎬 Thể loại:</strong> ${movie.movie_genre}</p>
      <p><strong>⏱ Thời lượng:</strong> ${movie.movie_duration} phút</p>
      <p><strong>📅 Ngày khởi chiếu:</strong> ${movie.movie_date}</p>
      <p><strong>🎟 Số lượng vé:</strong> ${quantity}</p>
    </div>
  </div>


  <div class="card p-4">
    <form action="/payment" method="post">
      <input type="hidden" name="step" value="step2">
      <input type="hidden" name="amount" value="${quantity * Price}">
      <input type="hidden" name="title" value="${movie.movie_name}">
      <input type="hidden" name="quantity" value="${quantity}">

      <div class="mb-3">
        <label class="form-label">Họ và tên</label>
        <input type="text" name="customerName" class="form-control" placeholder="Nhập họ tên của bạn" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control" placeholder="Nhập email" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Số điện thoại</label>
        <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại" required>
      </div>

      <button type="submit" class="btn btn-success">✅ Thanh toán bằng VNPAY</button>
      <a href="movies" class="btn btn-secondary">⬅ Quay lại danh sách phim</a>
    </form>
  </div>
</div>
</body>
</html>
