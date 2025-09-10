<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Cập nhật nhân viên</title>
  <link href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <div class="card shadow-sm p-4 bg-light rounded">
    <h2 class="mb-4">Cập nhật nhân viên</h2>

    <!-- Hiển thị thông báo lỗi nếu có -->
    <% if(request.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-danger">
      <%= request.getAttribute("errorMessage") %>
    </div>
    <% } %>

    <form method="post" action="${pageContext.request.contextPath}/api/employee">
      <input type="hidden" name="action" value="update">
      <input type="hidden" name="id"
             value="<%= request.getAttribute("employee") != null ? ((entity.Employees)request.getAttribute("employee")).getId() : "" %>">

      <div class="mb-3">
        <label class="form-label">Họ tên</label>
        <input type="text" name="name" class="form-control" required
               value="<%= request.getAttribute("employee") != null ? ((entity.Employees)request.getAttribute("employee")).getName() : "" %>">
      </div>

      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control" required
               value="<%= request.getAttribute("employee") != null ? ((entity.Employees)request.getAttribute("employee")).getEmail() : "" %>">
      </div>

      <div class="mb-3">
        <label class="form-label">Số điện thoại</label>
        <input type="text" name="phone" class="form-control" required
               pattern="\d{10}"
               title="Số điện thoại phải gồm đúng 10 chữ số, không có chữ hoặc ký tự đặc biệt"
               value="<%= request.getAttribute("employee") != null ? ((entity.Employees)request.getAttribute("employee")).getPhoneNumber() : "" %>">
      </div>

      <button type="submit" class="btn btn-success">Cập nhật</button>
      <a href="${pageContext.request.contextPath}/api/employee" class="btn btn-secondary">Quay lại</a>
    </form>
  </div>
</div>
</body>
</html>
