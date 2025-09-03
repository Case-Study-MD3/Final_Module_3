package repository.impl;

import entity.Movie;
import repository.BaseRepository;
import repository.IMovieRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieRepository implements IMovieRepository {

    @Override
    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT movie_id, movie_name, movie_genre, movie_duration, movie_date, images FROM movies";

        try (Connection conn = BaseRepository.getConnection()) {
            assert conn != null;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    int movie_id = Integer.parseInt(rs.getString("movie_id"));
                    String movie_name = rs.getString("movie_name");
                    String movie_genre = rs.getString("movie_genre");
                    int movie_duration = rs.getInt("movie_duration");
                    String movie_date = rs.getString("movie_date");
                    String image = rs.getString("images");

                    movies.add(new Movie(image,movie_id, movie_name, movie_genre, movie_duration, movie_date));
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movies;
    }

    @Override
    public Movie getMovieByTitle(String title) {
        Movie movie = null;
        String sql = "SELECT movie_id,movie_name, movie_genre, movie_duration, movie_date, images FROM movies WHERE movie_name = ?";

        try (Connection conn = BaseRepository.getConnection()) {
            assert conn != null;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, title);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        int movie_id = Integer.parseInt(rs.getString("movie_id"));
                        String movie_name = rs.getString("movie_name");
                        String movie_genre = rs.getString("movie_genre");
                        int movie_duration = rs.getInt("movie_duration");
                        String movie_date = rs.getString("movie_date");
                        String image = rs.getString("images");

                        movie = new Movie(image,movie_id, movie_name, movie_genre, movie_duration, movie_date);
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movie;
    }
}
