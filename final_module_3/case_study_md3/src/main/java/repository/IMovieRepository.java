package repository;

import entity.Movie;
import java.util.List;

public interface IMovieRepository {
    List<Movie> getAllMovies();
    Movie getMovieByTitle(String title);
}
