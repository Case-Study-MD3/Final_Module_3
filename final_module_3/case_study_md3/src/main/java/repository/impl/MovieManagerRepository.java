package repository.impl;

import entity.Movie;
import repository.IMovieManagementRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static repository.BaseRepository.getConnection;

public class MovieManagerRepository implements IMovieManagementRepository {

    @Override
    public List<Movie> getAllMovie() {
        List<Movie> movies = new ArrayList<>();
        try (Statement statement = Objects.requireNonNull(getConnection()).createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM movies")) {

            while (resultSet.next()) {
                int id = resultSet.getInt("movie_id");
                String name = resultSet.getString("movie_name");
                String genre = resultSet.getString("movie_genre");
                int duration = resultSet.getInt("movie_duration");
                String movieDate = resultSet.getString("movie_date");
                String images = resultSet.getString("images");

                Movie movie = new Movie(images, id, name, genre, duration, movieDate);
                movies.add(movie);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return movies;
    }

    @Override
    public int save(Movie movie) {
        String sql = "INSERT INTO movies (movie_name, movie_genre, movie_duration, movie_date, images) VALUES (?, ?, ?, ?, ?)";
        int movieId = -1;
        try (PreparedStatement preparedStatement = Objects.requireNonNull(getConnection())
                .prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, movie.getMovie_name());
            preparedStatement.setString(2, movie.getMovie_genre());
            preparedStatement.setInt(3, movie.getMovie_duration());
            preparedStatement.setString(4, movie.getMovie_date());
            preparedStatement.setString(5, movie.getImage());

            preparedStatement.executeUpdate();
            try (ResultSet rs = preparedStatement.getGeneratedKeys()) {
                if (rs.next()) {
                    movieId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return movieId;
    }

    @Override
    public void delete(int movieId) {
        String deleteShowtimes = "DELETE FROM showtimes WHERE movie_id = ?";
        String deleteMovie = "DELETE FROM movies WHERE movie_id = ?";
        try (Connection conn = getConnection()) {
            assert conn != null;
            conn.setAutoCommit(false);

            try (PreparedStatement ps1 = conn.prepareStatement(deleteShowtimes);
                 PreparedStatement ps2 = conn.prepareStatement(deleteMovie)) {

                ps1.setInt(1, movieId);
                ps1.executeUpdate();

                ps2.setInt(1, movieId);
                ps2.executeUpdate();

                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Movie movie) {
        String sql = "UPDATE movies SET movie_name=?, movie_genre=?, movie_duration=?, movie_date=?, images=? WHERE movie_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = Objects.requireNonNull(conn).prepareStatement(sql)) {

            ps.setString(1, movie.getMovie_name());
            ps.setString(2, movie.getMovie_genre());
            ps.setInt(3, movie.getMovie_duration());
            ps.setString(4, movie.getMovie_date());
            ps.setString(5, movie.getImage());
            ps.setInt(6, movie.getMovie_id());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Movie findById(int id) {
        String sql = "SELECT * FROM movies WHERE movie_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = Objects.requireNonNull(conn).prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Movie(
                        rs.getString("images"),
                        rs.getInt("movie_id"),
                        rs.getString("movie_name"),
                        rs.getString("movie_genre"),
                        rs.getInt("movie_duration"),
                        rs.getString("movie_date")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
