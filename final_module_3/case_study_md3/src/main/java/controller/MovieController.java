package controller;

import entity.Movie;
import service.IMovieService;
import service.impl.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/movies")
public class MovieController extends HttpServlet {
    private final IMovieService movieService = new MovieService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Movie> movies = movieService.getAllMovies();
        request.setAttribute("movies", movies);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

