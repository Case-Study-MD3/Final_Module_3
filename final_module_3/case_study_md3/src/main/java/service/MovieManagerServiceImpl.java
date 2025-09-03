package service;

import entity.Movie;
import repository.MovieManagerRepository;

import java.util.List;

public class MovieManagerServiceImpl implements IMovieManagerService {
    private MovieManagerRepository movieManagerRepository = new MovieManagerRepository();
    @Override
    public List<Movie> getAllMovie() {
        return movieManagerRepository.getAllMovie();
    }

}
