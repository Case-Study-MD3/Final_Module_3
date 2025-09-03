package controller;

import entity.Movie;
import entity.Showtime;
import entity.Ticket;
import service.IMovieService;
import service.IShowtimeService;
import service.ITicketService;
import service.impl.MovieService;
import service.impl.ShowtimeService;
import service.impl.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/confirm")
public class ConfirmServlet extends HttpServlet {

    private final IMovieService movieService = new MovieService();
    private final IShowtimeService showtimeService = new ShowtimeService();
    private final ITicketService ticketService = new TicketService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String step = req.getParameter("step"); // Xác định bước
        if ("step1".equals(step)) {
            BookingTicket(req, resp);
        } else if ("step2".equals(step)) {
            Confirm(req, resp);
        }
    }

    private void BookingTicket(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String tickets = req.getParameter("tickets");
        String customTickets = req.getParameter("customTickets");

        int quantity;
        if ("optional".equals(tickets) && customTickets != null && !customTickets.isEmpty()) {
            quantity = Integer.parseInt(customTickets);
        } else {
            quantity = Integer.parseInt(tickets);
        }

        Movie movie = movieService.getMovieByTitle(title);

        if (movie != null) {
            Showtime showtime = showtimeService.getShowtimeByMovieId(movie.getMovie_id());
            if (showtime != null) {
                int availableSeats = showtime.getTotalSeats();
                if (availableSeats >= quantity) {

                    req.setAttribute("movie", movie);
                    req.setAttribute("quantity", quantity);
                    req.getRequestDispatcher("confirm.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "Booking failed! Only " + availableSeats + " seats left.");
                    req.setAttribute("remainingSeats", availableSeats);
                    req.setAttribute("title", title);
                    req.setAttribute("type", movie.getMovie_genre());
                    req.setAttribute("duration", movie.getMovie_duration());
                    req.setAttribute("date", movie.getMovie_date());
                    req.setAttribute("image", movie.getImage());
                    req.getRequestDispatcher("booking.jsp").forward(req, resp);
                }
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Showtime not found!");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Movie not found!");
        }
    }

    private void Confirm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String customerName = req.getParameter("customerName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        if (customerName == null || customerName.trim().isEmpty() ||
                email == null || !email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$") ||
                phone == null || !phone.matches("\\d{10,11}")) {

            req.setAttribute("error", "Invalid information! Please check your details.");
            req.setAttribute("movie", movieService.getMovieByTitle(title));
            req.setAttribute("quantity", quantity);
            req.getRequestDispatcher("confirm.jsp").forward(req, resp);
            return;
        }

        Movie movie = movieService.getMovieByTitle(title);
        Showtime showtime = showtimeService.getShowtimeByMovieId(movie.getMovie_id());
        int availableSeats = showtime.getTotalSeats();

        if (availableSeats >= quantity) {
            showtimeService.updateSeats(showtime.getShowtimeId(), availableSeats - quantity);

            int customerId = 1;
            List<Ticket> bookedTickets = new ArrayList<>();

            
            int nextSeat = ticketService.getNextSeatNumber(showtime.getShowtimeId());


            for (int i = 0; i < quantity; i++) {
                Ticket ticket = ticketService.createTicket(customerId, showtime.getShowtimeId(), nextSeat + i);
                bookedTickets.add(ticket);
            }

            req.setAttribute("message", "Booking successful!");
            req.setAttribute("customerName", customerName);
            req.setAttribute("movie", movie);
            req.setAttribute("showtime", showtime);
            req.setAttribute("tickets", bookedTickets);
            req.setAttribute("quantity", quantity);

            req.getRequestDispatcher("success.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Sorry! Not enough seats available.");
            req.setAttribute("movie", movie);
            req.setAttribute("quantity", quantity);
            req.getRequestDispatcher("confirm.jsp").forward(req, resp);
        }
    }
}


