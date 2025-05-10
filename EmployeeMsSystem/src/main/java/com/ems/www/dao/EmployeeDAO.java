package com.ems.www.dao;

import java.util.List;

import com.ems.www.model.Employee;

public interface EmployeeDAO {

	List<Employee> getEmployeeList();
	void updateEmployee(Long id,Employee employee);
	Employee getEmployeeById(Long id);
}
