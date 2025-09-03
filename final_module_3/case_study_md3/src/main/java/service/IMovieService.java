package service;

import entity.Movie;
import java.util.Map;

public interface IMovieService {
    Map<String, Movie> getAllMovies();
    Movie getMovieByTitle(String title);
}
