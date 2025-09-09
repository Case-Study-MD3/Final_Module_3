package controller;

import service.impl.TicketService;
import entity.Movie;
import service.impl.MovieManagerServiceImpl;
import service.IMovieManagerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ticketManagementController", value = "/api/tickets")
public class TicketManagementController extends HttpServlet {
    TicketService ticketService = new TicketService();
    IMovieManagerService movieService = new MovieManagerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        List<Movie> movies = movieService.getAllMovie();

        // Tạo 2 Map: movieId -> ticketsSold, movieId -> revenue
        Map<Integer, Integer> ticketCountMap = new HashMap<>();
        Map<Integer, Double> revenueMap = new HashMap<>();

        for (Movie movie : movies) {
            int ticketsSold = ticketService.getTicketCount(movie.getMovie_id());
            double revenue = ticketService.getRevenue(movie.getMovie_id());

            ticketCountMap.put(movie.getMovie_id(), ticketsSold);
            revenueMap.put(movie.getMovie_id(), revenue);
        }

        req.setAttribute("movies", movies);
        req.setAttribute("ticketCountMap", ticketCountMap);
        req.setAttribute("revenueMap", revenueMap);

        req.getRequestDispatcher("/ticketManager.jsp").forward(req, resp);
    }

}
