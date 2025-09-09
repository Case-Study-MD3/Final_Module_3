<form method="post" action="${pageContext.request.contextPath}/api/employee">
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="id" value="${employee.id}">

  <div class="mb-3">
    <label class="form-label">Họ tên</label>
    <input type="text" name="name" class="form-control" value="${employee.name}" required>
  </div>

  <div class="mb-3">
    <label class="form-label">Email</label>
    <input type="email" name="email" class="form-control" value="${employee.email}" required>
  </div>

  <div class="mb-3">
    <label class="form-label">Số điện thoại</label>
    <input type="text" name="phone" class="form-control" value="${employee.phoneNumber}" required>
  </div>

  <button type="submit" class="btn btn-success">Cập nhật</button>
  <a href="${pageContext.request.contextPath}/api/employee" class="btn btn-secondary">Quay lại</a>
</form>
