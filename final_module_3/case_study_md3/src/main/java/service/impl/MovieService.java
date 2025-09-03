package service.impl;

import entity.Movie;
import repository.IMovieRepository;
import repository.impl.MovieRepository;
import service.IMovieService;


import java.util.List;


public class MovieService implements IMovieService {

    private final IMovieRepository movieRepository = new MovieRepository();

    @Override
    public List<Movie> getAllMovies() {
        return movieRepository.getAllMovies();
    }

    @Override
    public Movie getMovieByTitle(String title) {
        return movieRepository.getMovieByTitle(title);
    }
}
