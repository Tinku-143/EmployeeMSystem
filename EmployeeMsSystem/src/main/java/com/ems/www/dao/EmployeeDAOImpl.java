package com.ems.www.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ems.www.config.HibernateUtil;
import com.ems.www.model.Employee;

public class EmployeeDAOImpl implements EmployeeDAO{

	private List<Employee> employees;
	public List<Employee> getEmployeeList(){
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			Query<Employee> query=session.createQuery("FROM Employee",Employee.class);
			employees=query.getResultList();
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return employees;
	}
	public void updateEmployee(Long id,Employee employee) {
		Transaction transaction=null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			Employee emp = session.get(Employee.class, id);
			if(emp!=null) {
				emp.setName(employee.getName());
				emp.setEmail(employee.getEmail());
				emp.setSalary(employee.getSalary());
				emp.setAddress(employee.getAddress());
				session.update(emp);
				transaction.commit();
			}
		}catch (HibernateException e) {
			// TODO: handle exception
			if(transaction!=null) {
				transaction.rollback();
			}
			
		
		}
	}
	public Employee getEmployeeById(Long id) {
		Employee emp=new Employee();
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			 emp=session.get(Employee.class, id);
		}catch(HibernateException ex) {
			ex.printStackTrace();
		}
		return emp;
	}
	
}
