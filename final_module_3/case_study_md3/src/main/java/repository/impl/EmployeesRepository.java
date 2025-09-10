package repository.impl;

import entity.Employees;
import repository.IEmployeesRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static repository.BaseRepository.getConnection;

public class EmployeesRepository implements IEmployeesRepository {
    @Override
    public List<Employees> getAllEmployees() {
        List<Employees> employees = new ArrayList<>();
        String spl = "SELECT * FROM employees";
        try (Statement statement = Objects.requireNonNull(getConnection()).createStatement();
             ResultSet rs = statement.executeQuery(spl)) {

            while (rs.next()) {
                int id = rs.getInt("employee_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");

                Employees employee = new Employees(id,name,email,phone);
                employees.add(employee);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employees;
    }

    @Override
    public int save(Employees employee) {
        String sql = "INSERT INTO employees (name, email, phone_number) VALUES (?, ?, ?)";
        int employeeId = -1;
        try (PreparedStatement ps = Objects.requireNonNull(getConnection())
                .prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, employee.getName());
            ps.setString(2, employee.getEmail());
            ps.setString(3, employee.getPhoneNumber());

            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    employeeId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeId;
    }

    @Override
    public void update(Employees employee) {
        String sql = "UPDATE employees SET name=?, email=?, phone_number=? WHERE employee_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = Objects.requireNonNull(conn).prepareStatement(sql)) {

            ps.setString(1, employee.getName());
            ps.setString(2, employee.getEmail());
            ps.setString(3, employee.getPhoneNumber());
            ps.setInt(4,employee.getId());


            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int employeeId) {
        String sql = "DELETE FROM employees WHERE employee_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = Objects.requireNonNull(conn).prepareStatement(sql)) {

            ps.setInt(1, employeeId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Employees findById(int employeeId) {
        String sql = "SELECT * FROM employees WHERE employee_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = Objects.requireNonNull(conn).prepareStatement(sql)) {

            ps.setInt(1, employeeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Employees(
                        rs.getInt("employee_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone_number")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Employees> searchEmployees(String keyword) {
        List<Employees> list = new ArrayList<>();
        String sql = "SELECT * FROM employees WHERE name LIKE ? OR email LIKE ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employees(
                        rs.getInt("employee_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone_number")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean existsByEmail(String email) {
        String sql = "SELECT COUNT(*) FROM employees WHERE email = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = Objects.requireNonNull(conn).prepareStatement(sql)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Nếu COUNT > 0, email đã tồn tại
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // nếu lỗi hoặc không tìm thấy, trả về false
    }
}
