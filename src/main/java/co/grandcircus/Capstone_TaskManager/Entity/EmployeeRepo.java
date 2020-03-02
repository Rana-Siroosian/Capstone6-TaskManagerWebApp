package co.grandcircus.Capstone_TaskManager.Entity;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.Capstone_TaskManager.DAO.Employee;


public interface EmployeeRepo extends JpaRepository<Employee,Long>{
	
	Employee findByUsernameIgnoreCase(String username);
}
