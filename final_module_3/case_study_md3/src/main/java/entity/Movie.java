package entity;

public class Movie {

    private final String image;
    private final int movie_id;
    private final String movie_name;
    private final String movie_genre;
    private final int movie_duration;
    private final String movie_date;

    public Movie(String image, int movie_id, String movie_name, String movie_genre, int movie_duration, String movie_date) {
        this.image = image;
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.movie_genre = movie_genre;
        this.movie_duration = movie_duration;
        this.movie_date = movie_date;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public String getMovie_name() {
        return movie_name;
    }

    public String getMovie_genre() {
        return movie_genre;
    }

    public int getMovie_duration() {
        return movie_duration;
    }

    public String getMovie_date() {
        return movie_date;
    }

    public String getImage() {
        return image;
    }

}