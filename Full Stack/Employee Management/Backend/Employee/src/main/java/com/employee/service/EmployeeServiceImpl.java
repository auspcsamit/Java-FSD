package com.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.employee.model.Employee;
import com.employee.repo.EmployeeRepo;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepo employeeRepo;
	
	@Override
	public Employee getEmployeeById(Long employeeId) {
		
		return employeeRepo.findById(employeeId).orElse(null);
	}

	@Override
	public List<Employee> getAllEmployees() {
		
		return employeeRepo.findAll();
	}

	@Override
	public Employee addEmployee(Employee employee) {
		
		return employeeRepo.save(employee);
	}
	
	@Override
    public Employee updateEmployee(Employee employee) {
        return employeeRepo.save(employee);
    }

	@Override
	public void deleteEmployee(Long employeeId) {
		
		employeeRepo.deleteById(employeeId);
	}

}
