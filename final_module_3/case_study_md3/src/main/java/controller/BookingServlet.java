package controller;

import entity.Movie;
import entity.Showtime;
import service.IMovieService;
import service.impl.MovieService;
import service.impl.ShowtimeService;
import service.impl.TicketService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    private final static ShowtimeService SHOWTIME_SERVICE = new ShowtimeService();
    private final IMovieService movieService = new MovieService();
    private final TicketService ticketService = new TicketService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");

        if(title != null){
            Movie movie = movieService.getMovieByTitle(title);

            if(movie != null){
                req.setAttribute("title", movie.getMovie_name());
                req.setAttribute("type", movie.getMovie_genre());
                req.setAttribute("duration", movie.getMovie_duration());
                req.setAttribute("date", movie.getMovie_date());
                req.setAttribute("images", movie.getImage());

                Showtime showtime = SHOWTIME_SERVICE.getShowtimeByMovieId(movie.getMovie_id());
                if (showtime != null) {
                    req.setAttribute("remainingSeats", showtime.getTotalSeats());
                    req.setAttribute("Price", showtime.getPrice());
                } else {
                    req.setAttribute("remainingSeats", 0);
                }

                req.getRequestDispatcher("booking.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Movie not found!");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing movie title!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Lấy showtimeId từ form (confirm.jsp phải có <input hidden name="showtimeId" value="...">)
            int showtimeId = Integer.parseInt(req.getParameter("showtimeId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            // Lấy thông tin suất chiếu từ DB
            Showtime showtime = SHOWTIME_SERVICE.getShowtimeByMovieId(showtimeId);
            double price = showtime.getPrice();

            // Set attribute để confirm.jsp sử dụng
            req.setAttribute("showtime", showtime);
            req.setAttribute("quantity", quantity);
            req.setAttribute("Price", price);

            req.getRequestDispatcher("confirm.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Có lỗi khi xác nhận vé!");
        }
    }


}
