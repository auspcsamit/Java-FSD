package com.employee.service;

import java.util.List;

import com.employee.model.Employee;

public interface EmployeeService {
	
	Employee getEmployeeById(Long employeeId);
	List<Employee> getAllEmployees();
	Employee addEmployee(Employee employee);
	void deleteEmployee(Long employeeId);
	Employee updateEmployee(Employee employee);

}
