package controller;

import entity.Movie;
import service.IMovieService;
import service.impl.MovieService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    
    private final IMovieService movieService = new MovieService();

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
                req.setAttribute("image", movie.getImage());

                req.getRequestDispatcher("booking.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Movie not found!");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing movie title!");
        }
    }
}
