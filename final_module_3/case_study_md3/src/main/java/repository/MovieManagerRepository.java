package repository;

import entity.Movie;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MovieManagerRepository {

    public List<Movie> getAllMovie() {
        List<Movie> movies = new ArrayList<>();
        try (Statement statement = BaseRepository.getConnection().createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM movies")) {

            while (resultSet.next()) {
                String name = resultSet.getString("movie_name");
                String genre = resultSet.getString("movie_genre");
                int duration = resultSet.getInt("movie_duration");
                LocalDate movieDate = resultSet.getDate("movie_date").toLocalDate();
                String images = resultSet.getString("images");

                Movie movie = new Movie(name, genre, duration, movieDate, images);
                movies.add(movie);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return movies;
    }


}

