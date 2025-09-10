package repository.impl;

import entity.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        Statement statement = null;
        try {
            statement = BaseRepository.getConnection().createStatement();

            String query = "SELECT c.customer_id, c.customer_name, c.email, p.phone_num " +
                    "FROM customers c " +
                    "JOIN phone p ON c.customer_id =  p.customer_id";

            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String customerName = resultSet.getString("customer_name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone_num");

                customers.add(new Customer(id, customerName, email, phone));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customers;
    }


    @Override
    public void save(Customer customer) {
        PreparedStatement customerStmt = null;
        PreparedStatement phoneStmt = null;
        ResultSet generatedKeys = null;

        try {
            Connection connection = BaseRepository.getConnection();


            String customerSql = "INSERT INTO customers (customer_name, email) VALUES (?, ?)";
            customerStmt = connection.prepareStatement(customerSql, Statement.RETURN_GENERATED_KEYS);

            customerStmt.setString(1, customer.getCustomerName());
            customerStmt.setString(2, customer.getCustomerEmail());
            customerStmt.executeUpdate();

            generatedKeys = customerStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int customerId = generatedKeys.getInt(1);

                if (customer.getCustomerPhone() != null && !customer.getCustomerPhone().isEmpty()) {
                    String phoneSql = "INSERT INTO phone (customer_id, phone_num) VALUES (?, ?)";
                    phoneStmt = connection.prepareStatement(phoneSql);
                    phoneStmt.setInt(1, customerId);
                    phoneStmt.setInt(2, Integer.parseInt(customer.getCustomerPhone()));
                    phoneStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (customerStmt != null) customerStmt.close();
                if (phoneStmt != null) phoneStmt.close();
            } catch (SQLException ignored) {}
        }
    }


    @Override
    public void update(Customer customer) {
        PreparedStatement customerStmt = null;
        PreparedStatement phoneStmt = null;

        try {
            Connection connection = BaseRepository.getConnection();


            String updateCustomerSql = "UPDATE customers SET customer_name = ?, email = ? WHERE customer_id = ?";
            customerStmt = connection.prepareStatement(updateCustomerSql);
            customerStmt.setString(1, customer.getCustomerName());
            customerStmt.setString(2, customer.getCustomerEmail());
            customerStmt.setInt(3, customer.getCustomerId());
            customerStmt.executeUpdate();


            String updatePhoneSql = "UPDATE phone SET phone_num = ? WHERE customer_id = ?";
            phoneStmt = connection.prepareStatement(updatePhoneSql);
            phoneStmt.setString(1, customer.getCustomerPhone()); // nếu bạn vẫn để INT thì đổi thành setInt
            phoneStmt.setInt(2, customer.getCustomerId());
            phoneStmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (customerStmt != null) customerStmt.close();
                if (phoneStmt != null) phoneStmt.close();
            } catch (SQLException ignored) {}
        }
    }


    @Override
    public void delete(int id) {
        Connection connection = null;
        PreparedStatement ticketStmt = null;
        PreparedStatement phoneStmt = null;
        PreparedStatement customerStmt = null;

        try {
            connection = BaseRepository.getConnection();
            connection.setAutoCommit(false);


            String deleteTicketsSql = "DELETE FROM tickets WHERE customer_id = ?";
            ticketStmt = connection.prepareStatement(deleteTicketsSql);
            ticketStmt.setInt(1, id);
            ticketStmt.executeUpdate();


            String deletePhoneSql = "DELETE FROM phone WHERE customer_id = ?";
            phoneStmt = connection.prepareStatement(deletePhoneSql);
            phoneStmt.setInt(1, id);
            phoneStmt.executeUpdate();


            String deleteCustomerSql = "DELETE FROM customers WHERE customer_id = ?";
            customerStmt = connection.prepareStatement(deleteCustomerSql);
            customerStmt.setInt(1, id);
            customerStmt.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            try {
                if (connection != null) connection.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException("Rollback failed: " + ex.getMessage(), ex);
            }
            throw new RuntimeException("Delete failed: " + e.getMessage(), e);
        } finally {
            try {
                if (ticketStmt != null) ticketStmt.close();
                if (phoneStmt != null) phoneStmt.close();
                if (customerStmt != null) customerStmt.close();
                if (connection != null) connection.setAutoCommit(true);
            } catch (SQLException ignored) {}
        }
    }




    @Override
    public List<Customer> searchById(String idLike) {
        List<Customer> customers = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Connection connection = BaseRepository.getConnection();

            String sql = "SELECT c.customer_id, c.customer_name, c.email, p.phone_num " +
                    "FROM customers c " +
                    "LEFT JOIN phone p ON c.customer_id = p.customer_id " +
                    "WHERE c.customer_id LIKE ?";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, "%" + idLike + "%");
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("customer_id");
                String name = rs.getString("customer_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_num");

                customers.add(new Customer(id, name, email, phone));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException ignored) {}
        }

        return customers;
    }


    @Override
    public List<Customer> searchByName(String nameLike) {
        List<Customer> customers = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Connection connection = BaseRepository.getConnection();

            String sql = "SELECT c.customer_id, c.customer_name, c.email, p.phone_num " +
                    "FROM customers c " +
                    "LEFT JOIN phone p ON c.customer_id = p.customer_id " +
                    "WHERE c.customer_name LIKE ?";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, "%" + nameLike + "%");
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("customer_id");
                String name = rs.getString("customer_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_num");

                customers.add(new Customer(id, name, email, phone));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException ignored) {}
        }

        return customers;
    }

}
