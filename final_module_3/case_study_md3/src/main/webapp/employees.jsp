<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý nhân viên</title>
    <link href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #eef1f5;
        }
        .employee-card {
            transition: all 0.3s ease;
        }
        .employee-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }
        .search-box {
            max-width: 400px;
            margin-left: auto;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">Danh sách nhân viên</h2>
        <div class="search-box">
            <form method="get" action="${pageContext.request.contextPath}/api/employee" class="input-group">
                <input type="text" name="keyword" class="form-control" placeholder="Tìm theo tên hoặc email">
                <button class="btn btn-outline-secondary" type="submit">Tìm</button>
            </form>

        </div>
    </div>

    <!-- Nút thêm nhân viên -->
    <div class="mb-4">
        <a href="${pageContext.request.contextPath}/api/employee?action=create" class="btn btn-primary">
            + Thêm nhân viên mới
        </a>

    </div>

    <!-- Thông báo -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <!-- Danh sách nhân viên -->
    <div class="row g-4">
        <c:forEach var="emp" items="${employees}">
            <div class="col-md-4">
                <div class="card employee-card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">${emp.name}</h5>
                        <p class="card-text mb-1"><strong>Email:</strong> ${emp.email}</p>
                        <p class="card-text"><strong>SĐT:</strong> ${emp.phoneNumber}</p>
                        <div class="d-flex gap-2 mt-3">
                            <a href="${pageContext.request.contextPath}/api/employee?action=edit&employee_id=${emp.id}"
                               class="btn btn-sm btn-warning">Sửa</a>
                            <a href="${pageContext.request.contextPath}/api/employee?action=delete&id=${emp.id}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Bạn chắc chắn muốn xóa nhân viên này?');">Xóa</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Nếu không có nhân viên -->
    <c:if test="${empty employees}">
        <div class="alert alert-info mt-4">Không tìm thấy nhân viên nào.</div>
    </c:if>
</div>

<script src="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
