package service;

import entity.Movie;

import java.util.List;


public interface IMovieService {
    List<Movie> getAllMovies();
    Movie getMovieByTitle(String title);

}

