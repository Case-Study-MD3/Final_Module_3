package repository;

import entity.Movie;

import java.util.List;

public interface IMovieManagementRepository {
    List<Movie> getAllMovie();

    int save(Movie movie);

    void delete(int movieId);

    Movie findById(int id);

    void update(Movie movie);
}
