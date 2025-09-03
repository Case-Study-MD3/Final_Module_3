package repository;

import entity.Movie;
import java.util.HashMap;
import java.util.Map;

public class MovieRepository {
    private static final Map<String, Movie> movies = new HashMap<>();

    static {
        movies.put("Avengers Endgame", new Movie("images/avengersEndgamejpg.jpg","Avengers Endgame", "Action", 180, "2025-08-01"));
        movies.put("The Conjuring 3", new Movie("images/conjuring.jpg","The Conjuring 3", "Horror", 112, "2025-08-05"));
        movies.put("Fast & Furious 10", new Movie("images/gr9KBOV.jpg","Fast & Furious 10", "Action", 145, "2025-08-10"));
        movies.put("Minions: The Rise of Gru", new Movie("images/minions-.jpg","Minions: The Rise of Gru", "Animation", 90, "2025-08-15"));
        movies.put("Oppenheimer", new Movie("images/oppenheimer.jpg","Oppenheimer", "Drama", 180, "2025-08-20"));
        movies.put("Spider-Man: No Way Home", new Movie("images/spiderman.jpeg","Spider-Man: No Way Home", "Action", 150, "2025-08-22"));
        movies.put("Frozen II", new Movie("images/frozenII.jpg","Frozen II", "Animation", 103, "2025-08-25"));
        movies.put("Inception", new Movie("images/inception.jpg","Inception", "Sci-Fi", 148, "2025-08-28"));
        movies.put("Joker", new Movie("images/joker.jpg","Joker", "Drama", 122, "2025-08-30"));
    }

    public static Movie getMovieByTitle(String title) {
        return movies.get(title);
    }

    public static Map<String, Movie> getAllMovies() {
        return movies;
    }
}
