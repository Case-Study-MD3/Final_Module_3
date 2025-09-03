package controller;

import entity.Movie;
import service.IMovieService;
import service.MovieServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/con firm")
public class ConfirmServlet extends HttpServlet {

    private final IMovieService movieService = new MovieServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
            req.setAttribute("movie", movie);
            req.setAttribute("quantity", quantity);

            req.getRequestDispatcher("confirm.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Movie not found!");
        }
    }

}

