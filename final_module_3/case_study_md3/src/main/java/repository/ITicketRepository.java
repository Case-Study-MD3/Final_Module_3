package repository;

import entity.Ticket;
import java.util.List;

public interface ITicketRepository {
    void saveTicket(Ticket ticket);
    int getNextSeatNumber(int showtimeId);
    List<Ticket> getTicketsByCustomer(int customerId);
}
