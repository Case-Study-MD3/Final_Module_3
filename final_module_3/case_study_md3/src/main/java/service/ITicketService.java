package service;

import entity.Ticket;
import java.util.List;

public interface ITicketService {
    Ticket createTicket(int customerId, int showtimeId, int seatNumber);
    List<Ticket> getTicketsByCustomer(int customerId);

    int getNextSeatNumber(int showtimeId);

}
