package com.employee.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.employee.model.Employee;

public interface EmployeeRepo extends JpaRepository<Employee, Long> {

}
