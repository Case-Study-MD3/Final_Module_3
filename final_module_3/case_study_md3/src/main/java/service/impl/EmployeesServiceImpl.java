package service.impl;

import entity.Employees;
import repository.IEmployeesRepository;
import repository.impl.EmployeesRepository;
import service.IEmployeesService;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class EmployeesServiceImpl implements IEmployeesService {

    private final IEmployeesRepository employeesRepository = new EmployeesRepository();
    @Override
    public List<Employees> getAllEmployees() {
        return employeesRepository.getAllEmployees();
    }

    @Override
    public int save(Employees employee) {
      return employeesRepository.save(employee);
    }

    @Override
    public void update(Employees employee) {
        employeesRepository.update(employee);
    }

    @Override
    public void delete(int employeeId) {
        employeesRepository.delete(employeeId);
    }

    @Override
    public Employees findById(int employeeId) {
        return employeesRepository.findById(employeeId);
    }

    @Override
    public List<Employees> searchEmployees(String keyword) {
        List<Employees> result = new ArrayList<>();

        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllEmployees();
        }

        String lowerKey = keyword.toLowerCase();

        for (Employees e : getAllEmployees()) {
            if (e.getName() != null && e.getName().toLowerCase().contains(lowerKey)) {
                result.add(e); // nếu tên chứa keyword thì thêm vào list kết quả
            }
        }

        return result;
    }
}
