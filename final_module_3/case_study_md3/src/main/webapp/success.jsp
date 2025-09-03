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
        <h2>Booking Successful!</h2>
    </div>

    <div class="movie-info">
        <h4>Movie: ${movie.movie_name}</h4>
        <p><strong>Showtime ID:</strong> ${showtime.showtimeId}</p>
        <p><strong>Number of Tickets:</strong> ${tickets.size()}</p>
    </div>

    <h5>Tickets:</h5>
    <ul class="list-group ticket-list">
        <c:forEach var="ticket" items="${tickets}">
            <li class="list-group-item">
                <span>Ticket ID: ${ticket.ticket_id}</span>
                <span>Seat: ${ticket.ticket_seat}</span>
            </li>
        </c:forEach>
    </ul>

    <div class="btn-back">
        <a href="/movies" class="btn btn-primary btn-lg mt-3">Back to Movies</a>
    </div>
</div>
</body>
</html>


