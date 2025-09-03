package entity;

import java.time.LocalDate;

public class Movie {
    private String name;
    private String genre;
    private int duration;
    private LocalDate movieDate;
    private String images;

    public Movie(String name, String genre, int duration, LocalDate movieDate, String images) {
        this.name = name;
        this.genre = genre;
        this.duration = duration;
        this.movieDate = movieDate;
        this.images = images;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public LocalDate getMovieDate() {
        return movieDate;
    }

    public void setMovieDate(LocalDate movieDate) {
        this.movieDate = movieDate;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}