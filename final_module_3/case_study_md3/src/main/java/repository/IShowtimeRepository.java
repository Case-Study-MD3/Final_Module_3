package repository;

import entity.Showtime;

public interface IShowtimeRepository {
    Showtime getShowtimeByMovieId(int movieId);
    Showtime getShowtimeById(int showtimeId);
    void updateSeats(int showtimeId, int newSeats);
}
