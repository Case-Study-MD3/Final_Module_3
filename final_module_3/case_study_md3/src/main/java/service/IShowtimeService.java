package service;

import entity.Showtime;

public interface IShowtimeService {
    Showtime getShowtimeByMovieId(int movieId);
    void updateSeats(int showtimeId, int newSeats);
}
