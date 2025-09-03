package service;

import entity.Movie;
import repository.MovieManagerRepository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MovieManagerServiceImpl implements IMovieManagerService {
    MovieManagerRepository repository = new MovieManagerRepository();

    @Override
    public List<Movie> getAllMovie() {
        return repository.getAllMovie();
    }

    @Override
    public void save(Movie movie) {
        repository.save(movie);
    }
    @Override
    public void delete(int movieId) {
        repository.delete(movieId);
    }

}
