package service.impl;

import entity.Showtime;
import repository.impl.ShowtimeRepository;
import service.IShowtimeService;

public class ShowtimeService implements IShowtimeService {

    private final static ShowtimeRepository repo = new ShowtimeRepository();
    @Override
    public Showtime getShowtimeByMovieId(int movieId) {
        return repo.getShowtimeByMovieId(movieId);
    }

    @Override
    public void updateSeats(int showtimeId, int newSeats) {
    repo.updateSeats(showtimeId, newSeats);
    }

    @Override
    public void save(Showtime showtime) {
        repo.saveShowtime(showtime);
    }
    public int getRemainingSeats(int showtimeId) {
        Showtime showtime = repo.getShowtimeByMovieId(showtimeId);
        if(showtime != null){
            int sold = repo.getTicketsSold(showtimeId);
            return showtime.getTotalSeats() - sold;
        }
        return 0;
    }
}
