package repository.impl;

import entity.Ticket;
import repository.BaseRepository;
import repository.ITicketRepository;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

public class TicketRepository implements ITicketRepository {

    @Override
    public void saveTicket(Ticket ticket) {
        String sql = "INSERT INTO tickets(customer_id, showtime_id, ticket_seat, ticket_booking_date) VALUES (?, ?, ?, ?)";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, ticket.getCustomer_id());
            stmt.setInt(2, ticket.getShowtime_id());
            stmt.setString(3, ticket.getTicket_seat());
            stmt.setString(4, ticket.getTicket_booking_date());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                ticket.setTicket_id(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getNextSeatNumber(int showtimeId) {
        String sql = "SELECT COUNT(*) AS total FROM tickets WHERE showtime_id = ?";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, showtimeId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total") + 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    @Override
    public List<Ticket> getTicketsByCustomer(int customerId) {
        List<Ticket> list = new ArrayList<>();
        String sql = "SELECT * FROM tickets WHERE customer_id = ?";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Ticket ticket = new Ticket(
                        rs.getInt("ticket_id"),
                        rs.getInt("customer_id"),
                        rs.getInt("showtime_id"),
                        rs.getString("ticket_seat"),
                        rs.getString("ticket_booking_date")
                );
                list.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
