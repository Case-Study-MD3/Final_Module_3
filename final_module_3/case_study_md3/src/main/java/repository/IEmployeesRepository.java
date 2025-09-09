package repository;

import entity.Employees;

import java.util.List;

public interface IEmployeesRepository {

    //theem nhan vien
    List<Employees> getAllEmployees();
    int save(Employees employee);
    void update(Employees employee);
    void delete(int employeeId);
    Employees findById(int employeeId);

    List<Employees> searchEmployees(String keyword);
}
