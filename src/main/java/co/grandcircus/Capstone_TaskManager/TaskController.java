package co.grandcircus.Capstone_TaskManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import co.grandcircus.Capstone_TaskManager.Entity.EmployeeRepo;
import co.grandcircus.Capstone_TaskManager.Entity.TaskRepo;

@Controller
public class TaskController {

	
	@Autowired
	private TaskRepo taskRepo;
	
	@Autowired
	private EmployeeRepo emRepo;
	
	
}
