package repository.impl;

import entity.Showtime;
import repository.BaseRepository;
import repository.IShowtimeRepository;

import java.sql.*;
import java.util.Objects;

import static repository.BaseRepository.getConnection;


public class ShowtimeRepository implements IShowtimeRepository {

    @Override
    public Showtime getShowtimeByMovieId(int movieId) {
        String query = "SELECT * FROM showtimes WHERE movie_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, movieId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                Showtime showtime = new Showtime();
                showtime.setShowtimeId(rs.getInt("showtime_id"));
                showtime.setMovieId(rs.getInt("movie_id"));
                showtime.setRoomId(rs.getInt("room_id"));
                showtime.setStartTime(rs.getString("showtime_start_time"));
                showtime.setPrice(rs.getDouble("showtime_price"));
                showtime.setTotalSeats(rs.getInt("total_seats"));
                return showtime;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public Showtime getShowtimeById(int showtimeId) {
        String query = "SELECT * FROM showtimes WHERE showtime_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, showtimeId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                Showtime showtime = new Showtime();
                showtime.setShowtimeId(rs.getInt("showtime_id"));
                showtime.setMovieId(rs.getInt("movie_id"));
                showtime.setRoomId(rs.getInt("room_id"));
                showtime.setStartTime(rs.getString("showtime_start_time"));
                showtime.setPrice(rs.getDouble("showtime_price"));
                showtime.setTotalSeats(rs.getInt("total_seats"));
                return showtime;
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy showtime theo showtimeId: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void updateSeats(int showtimeId, int newSeats) {
        String query = "UPDATE showtimes SET total_seats = ? WHERE showtime_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, newSeats);
            preparedStatement.setInt(2, showtimeId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void saveShowtime(Showtime showtime) {
        String sql = "INSERT INTO showtimes (movie_id, room_id, showtime_start_time, showtime_price, total_seats) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = Objects.requireNonNull(getConnection()).prepareStatement(sql)) {
            stmt.setInt(1, showtime.getMovieId());
            stmt.setInt(2, showtime.getRoomId());

            // nếu để String -> phải đảm bảo format "yyyy-MM-dd HH:mm:ss"
            stmt.setString(3, showtime.getStartTime());
            stmt.setDouble(4, showtime.getPrice());
            stmt.setInt(5, showtime.getTotalSeats());

            int rows = stmt.executeUpdate();
            System.out.println(">>> Showtime inserted: " + rows + " row(s).");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy số vé đã bán theo showtimeId
    public int getTicketsSold(int showtimeId) {
        int sold = 0;
        String sql = "SELECT COUNT(*) AS ticketsSold FROM tickets WHERE showtime_id = ?";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, showtimeId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                sold = rs.getInt("ticketsSold");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sold;
    }

}
