package entity;

import java.time.LocalDateTime;

public class Ticket {
    private int ticket_id;
    private int customer_id;
    private int showtime_id;
    private String ticket_seat;
    private String ticket_booking_date;

    public Ticket() {}

    public Ticket(int ticketId, int customerId, int showtimeId, String ticketSeat, String bookingDate) {
        this.ticket_id = ticketId;
        this.customer_id = customerId;
        this.showtime_id = showtimeId;
        this.ticket_seat = ticketSeat;
        this.ticket_booking_date = bookingDate;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getShowtime_id() {
        return showtime_id;
    }

    public void setShowtime_id(int showtime_id) {
        this.showtime_id = showtime_id;
    }

    public String getTicket_seat() {
        return ticket_seat;
    }

    public void setTicket_seat(String ticket_seat) {
        this.ticket_seat = ticket_seat;
    }

    public String getTicket_booking_date() {
        return ticket_booking_date;
    }

    public void setTicket_booking_date(String ticket_booking_date) {
        this.ticket_booking_date = ticket_booking_date;
    }
}
