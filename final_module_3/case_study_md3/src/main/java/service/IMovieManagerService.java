package service;

import entity.Movie;
import java.util.List;

public interface IMovieManagerService{
    List<Movie> getAllMovie();

    int save(Movie movie);
    void delete(int movieId);
    void update(Movie movie);
    Movie findById(int id);
    List<Movie> searchMovies(String keyword, String fromDate, String toDate);
    List<Movie> getTop5Movies();


}
