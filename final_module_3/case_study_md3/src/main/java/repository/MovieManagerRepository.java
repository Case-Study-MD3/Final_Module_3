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


}

