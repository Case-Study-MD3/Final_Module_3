package service;

import entity.Movie;
import repository.MovieRepository;
import java.util.Map;

public class MovieServiceImpl implements IMovieService {

    @Override
    public Map<String, Movie> getAllMovies() {
        return MovieRepository.getAllMovies();
    }

    @Override
    public Movie getMovieByTitle(String title) {
        return MovieRepository.getMovieByTitle(title);
    }
}
