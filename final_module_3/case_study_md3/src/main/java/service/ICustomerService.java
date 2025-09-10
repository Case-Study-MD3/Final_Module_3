package service;

import entity.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> findAll();

    void save (Customer customer);

    void update(Customer customer);

    void delete(int id);

    List<Customer> searchById(String idLike);

    List<Customer> searchByName(String nameLike);
}
