<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Cập nhật khách hàng</title>
  <link href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #e0f7fa, #fce4ec);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .card {
      border-radius: 15px;
      box-shadow: 0 6px 16px rgba(0,0,0,0.15);
      animation: fadeIn 0.6s ease-in-out;
      width: 100%;
      max-width: 700px;
    }
    h2 {
      color: #0d6efd;
      font-weight: bold;
      text-align: center;
      margin-bottom: 20px;
      text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px);}
      to { opacity: 1; transform: translateY(0);}
    }
    .btn {
      border-radius: 8px;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }
    .btn-success {
      background: linear-gradient(90deg, #198754, #20c997);
      border: none;
    }
  </style>
</head>
<body>

<div class="card p-4">
  <h2>✏️ Cập nhật khách hàng</h2>

  <form action="/customers?action=update" method="post" class="row g-3">
    <input type="hidden" name="id" value="${customer.customerId}">

    <div class="col-md-6">
      <label class="form-label">Tên khách hàng</label>
      <input type="text" name="customerName" class="form-control"
             value="${customer.customerName}" required>
    </div>

    <div class="col-md-6">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control"
             value="${customer.customerEmail}" required>
    </div>

    <div class="col-md-6">
      <label class="form-label">Số điện thoại</label>
      <input type="text" name="phone" class="form-control"
             value="${customer.customerPhone}" required>
    </div>

    <div class="col-12 text-center mt-3">
      <button type="submit" class="btn btn-success px-4">💾 Cập nhật</button>
      <a href="/customers" class="btn btn-secondary px-4">⬅️ Quay lại</a>
    </div>
  </form>
</div>

</body>
</html>
