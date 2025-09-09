package service.impl;

import entity.Customer;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {

    private CustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public void update(Customer customer) {
       customerRepository.update(customer);
    }

    @Override
    public void delete(int id) {
     customerRepository.delete(id);
    }

    @Override
    public List<Customer> searchById(String idLike) {
        return customerRepository.searchById(idLike);
    }

    @Override
    public List<Customer> searchByName(String nameLike) {
        return customerRepository.searchByName(nameLike);
    }
}
