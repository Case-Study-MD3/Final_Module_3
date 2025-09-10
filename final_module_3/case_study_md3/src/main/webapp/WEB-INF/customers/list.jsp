<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Danh sách khách hàng</title>
  <link href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #e0f7fa, #fce4ec);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    h2 {
      color: #0d6efd;
      font-weight: bold;
      text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .card {
      border-radius: 15px;
      box-shadow: 0 6px 16px rgba(0,0,0,0.15);
      animation: fadeIn 0.6s ease-in-out;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px);}
      to { opacity: 1; transform: translateY(0);}
    }
    table {
      border-radius: 12px;
      overflow: hidden;
    }
    thead {
      background: linear-gradient(90deg, #0d6efd, #6610f2);
      color: white;
    }
    tbody tr {
      transition: all 0.3s ease;
    }
    tbody tr:hover {
      background-color: #f1f5ff;
      transform: scale(1.01);
      box-shadow: 0 4px 10px rgba(0,0,0,0.05);
    }
    .btn {
      border-radius: 8px;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }
    .btn-primary {
      background: linear-gradient(90deg, #0d6efd, #0dcaf0);
      border: none;
    }
    .btn-outline-success {
      border: 2px solid #198754;
      font-weight: 500;
    }
    .alert {
      animation: fadeIn 0.5s ease-in-out;
    }
  </style>
</head>
<body class="container py-5">

<div class="card p-4 w-100">
  <h2 class="mb-4 text-center">📋 Danh sách khách hàng</h2>

  <c:if test="${not empty message}">
    <div class="alert alert-success text-center">${message}</div>
  </c:if>

  <div class="d-flex justify-content-between align-items-center mb-3">
    <a href="/customers?action=create" class="btn btn-primary">
      <i class="bi bi-person-plus"></i> + Thêm khách hàng
    </a>

    <form class="d-flex" action="/customers" method="get">
      <input type="hidden" name="action" value="search"/>
      <input type="text" name="keyword" class="form-control me-2" placeholder="🔍 Nhập từ khóa...">
      <select name="type" class="form-select me-2">
        <option value="name">Theo tên</option>
        <option value="id">Theo ID</option>
      </select>
      <button type="submit" class="btn btn-outline-success">Tìm kiếm</button>
    </form>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle text-center">
      <thead>
      <tr>
        <th style="width: 60px;">ID</th>
        <th>Tên</th>
        <th>Email</th>
        <th>SĐT</th>
        <th style="width: 150px;">Hành động</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="c" items="${customers}">
        <tr>
          <td>${c.customerId}</td>
          <td class="text-start">${c.customerName}</td>
          <td>${c.customerEmail}</td>
          <td>${c.customerPhone}</td>
          <td>
            <a href="/customers?action=edit&id=${c.customerId}" class="btn btn-sm btn-warning">✏️ Sửa</a>
            <a href="/customers?action=delete&id=${c.customerId}" class="btn btn-sm btn-danger"
               onclick="return confirm('Bạn có chắc muốn xóa khách hàng này?')">🗑️ Xóa</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
