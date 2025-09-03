package service;

import entity.Movie;
import java.util.List;

public interface IMovieManagerService{
    List<Movie> getAllMovie();

    void save(Movie movie);
    void delete(int movieId);
}
