package repository;

import entity.Movie;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static repository.BaseRepository.getConnection;

public class MovieManagerRepository {

    public List<Movie> getAllMovie() {
        List<Movie> movies = new ArrayList<>();
        try (Statement statement = Objects.requireNonNull(getConnection()).createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM movies")) {

            while (resultSet.next()) {
                int id = resultSet.getInt("movie_id");
                String name = resultSet.getString("movie_name");
                String genre = resultSet.getString("movie_genre");
                int duration = resultSet.getInt("movie_duration");
                String  movieDate = resultSet.getString("movie_date");
                String images = resultSet.getString("images");

                Movie movie = new Movie(images, id,name, genre, duration, movieDate);
                movies.add(movie);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return movies;
    }
    public void save(Movie movie) {
        String sql = "INSERT INTO movies (movie_name, movie_genre, movie_duration, movie_date, images) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = Objects.requireNonNull(getConnection())
                .prepareStatement(sql)) {

            preparedStatement.setString(1, movie.getMovie_name());
            preparedStatement.setString(2, movie.getMovie_genre());
            preparedStatement.setInt(3, movie.getMovie_duration());
            preparedStatement.setString(4, movie.getMovie_date());
            preparedStatement.setString(5, movie.getImage());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void delete(int movieId) {
        String sql = "DELETE FROM movies WHERE movie_id = ?";
        try (Connection conn = getConnection()) {
            assert conn != null;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, movieId);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}

