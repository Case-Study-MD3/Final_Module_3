package service.impl;

import entity.Movie;
import repository.impl.MovieManagerRepository;
import service.IMovieManagerService;

import java.util.List;

public class MovieManagerServiceImpl implements IMovieManagerService {
    MovieManagerRepository repository = new MovieManagerRepository();

    @Override
    public List<Movie> getAllMovie() {
        return repository.getAllMovie();
    }

    @Override
    public int save(Movie movie) {
        return repository.save(movie);
    }
    @Override
    public void delete(int movieId) {
        repository.delete(movieId);
    }

    @Override
    public void update(Movie movie) {
        repository.update(movie);

    }
    @Override
    public List<Movie> searchMovies(String keyword, String fromDate, String toDate) {
        return repository.searchMovies(keyword, fromDate, toDate);
    }

    @Override
    public Movie findById(int id) {
        return repository.findById(id);
    }
    @Override
    public List<Movie> getTop5Movies() {
        return repository.getTop5Movies();
    }


}
