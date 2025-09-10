<%--
  Created by IntelliJ IDEA.
  User: vvt13
  Date: 9/3/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <title>Booking Success</title>
    <link href="bootstrap-5.3.7-dist/bootstrap-5.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .success-card {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            background: #ffffff;
        }

        .success-header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 25px;
        }

        .success-header h2 {
            margin-left: 10px;
            color: #28a745;
            font-weight: 700;
        }

        .ticket-list li {
            display: flex;
            justify-content: space-between;
            font-weight: 500;
        }

        .ticket-list li:nth-child(odd) {
            background-color: #f1f3f5;
        }

        .movie-info {
            margin-bottom: 20px;
        }

        .movie-info h4 {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .movie-info p {
            margin: 0;
            color: #495057;
        }

        .btn-back {
            margin-top: 20px;
            text-align: center;
        }

        .btn-back a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="success-card">
    <div class="success-header">
        <h2>Đặt Vé Thành Công!</h2>
    </div>

    <div class="movie-info">
        <h4>Phim: ${movie.movie_name}</h4>
        <p><strong>Phòng chiếu: </strong>:</strong> ${showtime.showtimeId}</p>
        <p><strong>Số lượng vé: </strong>:</strong> ${tickets.size()}</p>
    </div>

    <h5>Vé</h5>
    <ul class="list-group ticket-list">
        <c:forEach var="ticket" items="${tickets}">
            <li class="list-group-item">
                <span>Mã Vé: ${ticket.ticket_id}</span>
                <span>Số ghế: ${ticket.ticket_seat}</span>
            </li>
            <p>Mã giao dịch: ${param.vnp_TxnRef}</p>
            <p>Số tiền: ${param.vnp_Amount} VND</p>
            <p>Ngân hàng: ${param.vnp_BankCode}</p>
        </c:forEach>
    </ul>

    <div class="btn-back">
        <a href="movies" class="btn btn-primary btn-lg mt-3">Quay lại danh sách phim</a>
    </div>
</div>
</body>
</html>


