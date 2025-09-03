package service.impl;

import entity.Showtime;
import entity.Ticket;
import repository.IShowtimeRepository;
import repository.ITicketRepository;
import repository.impl.ShowtimeRepository;
import repository.impl.TicketRepository;
import service.ITicketService;

import java.util.List;

public class TicketService implements ITicketService {
    private final ITicketRepository ticketRepository = new TicketRepository();
    private final IShowtimeRepository repository = new ShowtimeRepository();



    @Override
    public Ticket createTicket(int customerId, int showtimeId, int seatNumber) {
        String seatCode = "A" + seatNumber;
        Showtime showtime = repository.getShowtimeById(showtimeId);
        String ticketTime = showtime.getStartTime();

        Ticket ticket = new Ticket(0, customerId, showtimeId, seatCode, ticketTime);
        ticketRepository.saveTicket(ticket);
        return ticket;
    }



    @Override
    public List<Ticket> getTicketsByCustomer(int customerId) {
        return ticketRepository.getTicketsByCustomer(customerId);
    }


    public int getNextSeatNumber(int showtimeId) {
        return ticketRepository.getNextSeatNumber(showtimeId);
    }
}
