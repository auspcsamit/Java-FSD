package com.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.employee.model.Employee;
import com.employee.service.EmployeeService;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/employees")
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@GetMapping("/id")
	public Employee getEmployeeById(@RequestParam Long id) {
		Employee employee = employeeService.getEmployeeById(id);
		if(employee != null) {
			return employee;
		} else {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Employee not found");
		}
	}
	
	@GetMapping("/all")
	public List<Employee> getAllEmployees(){
		List<Employee> employees = employeeService.getAllEmployees();
		return employees;
	}
	
	@PostMapping("/add")
	public Employee addEmployee(@RequestBody Employee employee){
		Employee emp = employeeService.addEmployee(employee);
		return emp;
	}
	
	@PutMapping("/update")
    public Employee updateEmployee(@RequestParam Long id, @RequestBody Employee updatedEmployee) {
        Employee existingEmployee = employeeService.getEmployeeById(id);
        if (existingEmployee != null) {
            updatedEmployee.setEmpId(id);
            employeeService.updateEmployee(updatedEmployee);
            return existingEmployee;
        } else {
        	throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Employee not found");
        }
    }
	
	@DeleteMapping("/delete")
	public void deleteEmployee(@RequestParam Long id){
		employeeService.deleteEmployee(id);
		
	}

}
