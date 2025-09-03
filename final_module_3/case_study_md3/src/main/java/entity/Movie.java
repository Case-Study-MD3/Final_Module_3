package entity;

public class Movie {
    private String image;
    private String title;
    private String type;
    private int duration;
    private String releaseDate;

    public Movie(String image, String title, String type, int duration, String releaseDate) {
        this.image = image;
        this.title = title;
        this.type = type;
        this.duration = duration;
        this.releaseDate = releaseDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getTitle() {
        return title;
    }

    public String getType() {
        return type;
    }

    public int getDuration() {
        return duration;
    }

    public String getReleaseDate() {
        return releaseDate;
    }
}
