<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý phim</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .movie-img {
            width: 250px;
            height: 120px;
            object-fit: cover;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .btn-add {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .alert {
            font-weight: 500;
        }

        .img-placeholder {
            width: 250px;
            height: 120px;
            background-color: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 5px;
            border: 1px solid #ddd;
            color: #6c757d;
            font-size: 14px;
        }

        .btn-action {
            display: flex;
            gap: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <!-- Header -->
    <div class="text-center mb-5">
        <h2 class="fw-bold text-uppercase"
            style="font-family: 'Segoe UI', sans-serif;
               font-weight: 800;
               letter-spacing: 2px;
               color: #0d6efd;">
            Quản lý phim
        </h2>
        <div class="d-flex justify-content-center mt-2">
            <div style="width: 80px; height: 4px; background: #0d6efd; border-radius: 10px;"></div>
        </div>
        <p class="text-muted mt-2" style="font-size: 15px;">
            Quản lý danh sách phim, lịch chiếu và thông tin chi tiết.
        </p>
    </div>


    <!-- Message -->
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Button thêm phim mới -->
    <div class="mb-3 text-end">
        <a href="/api/movie?action=movie" class="btn btn-success">
            <span class="bi bi-plus-lg"></span> Thêm phim mới
        </a>
    </div>

    <!-- Form tìm kiếm -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <form method="get" action="/api/movie" class="row g-3 align-items-end">
                <input type="hidden" name="action" value="list"/>

                <!-- Tên phim -->
                <div class="col-md-4">
                    <label class="form-label">Tên phim</label>
                    <input type="text" name="keyword" value="${param.keyword}"
                           class="form-control" placeholder="Nhập tên phim...">
                </div>

                <!-- Từ ngày -->
                <div class="col-md-3">
                    <label class="form-label">Từ ngày</label>
                    <input type="date" name="fromDate" value="${param.fromDate}" class="form-control">
                </div>

                <!-- Đến ngày -->
                <div class="col-md-3">
                    <label class="form-label">Đến ngày</label>
                    <input type="date" name="toDate" value="${param.toDate}" class="form-control">
                </div>

                <!-- Nút -->
                <div class="col-md-2 d-flex gap-2">
                    <button type="submit" class="btn btn-primary flex-fill">Tìm</button>
                    <a href="/api/movie" class="btn btn-secondary flex-fill">Reset</a>
                </div>
            </form>
        </div>
    </div>
    <!-- Message -->
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Error -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>


    <!-- Table danh sách phim -->
    <div class="table-container">
        <table class="table table-striped table-hover shadow-sm bg-white rounded">
            <thead class="table-dark">
            <tr>
                <th>Tên phim</th>
                <th>Thể loại</th>
                <th>Thời lượng (phút)</th>
                <th>Ngày chiếu</th>
                <th>Hình ảnh</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="movie" items="${movies}">
                <tr>
                    <td>${movie.movie_name}</td>
                    <td>${movie.movie_genre}</td>
                    <td>${movie.movie_duration}</td>
                    <td>${movie.movie_date}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty movie.image}">
                                <c:choose>
                                    <%-- Kiểm tra nếu là URL web --%>
                                    <c:when test="${movie.image.startsWith('http://') || movie.image.startsWith('https://')}">
                                        <img src="${movie.image}"
                                             alt="poster"
                                             class="movie-img"
                                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/no-image.png'; this.className='img-placeholder';">
                                    </c:when>
                                    <%-- Nếu là đường dẫn local --%>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/${movie.image}"
                                             alt="poster"
                                             class="movie-img"
                                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/no-image.png'; this.className='img-placeholder';">
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <%-- Nếu không có ảnh --%>
                            <c:otherwise>
                                <div class="img-placeholder">
                                    Không có ảnh
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="btn-action">
                        <a href="/api/movie?action=edit&movie_id=${movie.movie_id}" class="btn btn-warning btn-sm">
                            Sửa
                        </a>
                        <a href="#"
                           class="btn btn-danger btn-sm deleteBtn"
                           data-href="/api/movie?action=delete&movie_id=${movie.movie_id}">
                            Xoá
                        </a>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal Xóa phim -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc muốn xoá phim này?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <a href="#" class="btn btn-danger" id="confirmDeleteBtn">Xóa</a>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
        document.querySelectorAll('.deleteBtn').forEach(btn => {
            btn.addEventListener('click', function (e) {
                e.preventDefault(); // chặn link
                const href = this.getAttribute('data-href');
                confirmDeleteBtn.setAttribute('href', href); // gán href cho nút Xóa trong modal
                deleteModal.show(); // hiện modal
            });
        });
    });
</script>


<script src="${pageContext.request.contextPath}/bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
