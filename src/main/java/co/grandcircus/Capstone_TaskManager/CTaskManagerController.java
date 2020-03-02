package co.grandcircus.Capstone_TaskManager;
/**
 * 
 * @author >>RanaSiroosian<<
 */
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.grandcircus.Capstone_TaskManager.DAO.Employee;
import co.grandcircus.Capstone_TaskManager.DAO.Task;
import co.grandcircus.Capstone_TaskManager.Entity.EmployeeRepo;
import co.grandcircus.Capstone_TaskManager.Entity.TaskRepo;

@Controller
public class CTaskManagerController {
	
	@Autowired
	private TaskRepo taskRepo;
	
	@Autowired
	private EmployeeRepo emRepo;
	
	@Autowired
	private HttpSession sesh;
	
	@RequestMapping("/home")
	public ModelAndView showHome() {
		return new ModelAndView ("index");
	}
	@RequestMapping("/register/employee")
	public ModelAndView showReg() {
		return new ModelAndView ("employee-reg");
	}
	
	@PostMapping("/register/employee")
	public ModelAndView submitReg(Employee employee) {
		emRepo.save(employee);
		
		return new ModelAndView("welcome","name",employee.getFirstName());
	}
	@RequestMapping("/login/employee")
	public ModelAndView showLogin() {
		return new ModelAndView ("login");
	}
	@PostMapping("/login/employee")
	public ModelAndView checkLogin(@RequestParam ("username") String username, @RequestParam("password") String password,
			RedirectAttributes red) {
		System.out.println("11"+username);

		Employee employee = emRepo.findByUsernameIgnoreCase(username);
		if(employee == null || !password.equals(employee.getPassword())) {
			red.addFlashAttribute("msg","Incorrect username or password, please try again!");
			return new ModelAndView("login");
		}
		System.out.println(username);
		sesh.setAttribute("employee", employee);
		System.out.println(username);

		return new ModelAndView ("redirect:/employee/" + employee.getId());
	}
	
	@RequestMapping("/logout")
	public ModelAndView showLogout(RedirectAttributes red) {
		sesh.invalidate();
		return new ModelAndView("redirect:/home");
	}
	@RequestMapping("/employee/{id}")
	public ModelAndView showDesk(@PathVariable ("id") Employee employee) {
		return new ModelAndView ("employee-desk","employee",employee);
	}
	
	@RequestMapping("/employee/{id}/addt")
	public ModelAndView showAddTask(@PathVariable ("id") Employee employee) {
		return new ModelAndView("task-add","employee",employee);
	}
	@PostMapping("/employee/{id}/addt")
	public ModelAndView taskAdd(@RequestParam("task") String task,@RequestParam("taskDescription") String taskDescription,
			@RequestParam("date") String date,@RequestParam("status") boolean status, @RequestParam("id") Long id,@RequestParam("username") String username ) throws ParseException {
		Date date1= new SimpleDateFormat("yyyy-MM-dd").parse(date);
//		tasks.setEmployee(emRepo.findByUsernameIgnoreCase(username));
//		taskRepo.save(tasks);
//		return new ModelAndView("redirect:/employee/{id}" + id);
		Task tasks = new Task();
		tasks.setTask(task);
		tasks.setTaskDescription(taskDescription);
		tasks.setDate(date1);
		tasks.setStatus(status);
		tasks.setEmployee(emRepo.findByUsernameIgnoreCase(username));
		taskRepo.save(tasks);

		System.out.println(id +"---");
		ModelAndView mav = new ModelAndView("redirect:/employee/" + id);

				return mav;
	}
	
	@RequestMapping("/employee/{id}/delete/{id1}")
	public ModelAndView showDelete(@PathVariable ("id1") Task tasks) {
		taskRepo.delete(tasks);
		return new ModelAndView("redirect:/employee/{id}");
	}
	
	@PostMapping("/employee/{id}/status/{id1}")
	public ModelAndView showEdit(@PathVariable("id1") Task tasks) {
		if(tasks.isStatus()) {
			tasks.setStatus(false);
		}
		else {
			tasks.setStatus(true);
		}
		taskRepo.save(tasks);
		return new ModelAndView("redirect:/employee/{id}");
	}
	
	@RequestMapping("/employee/{id}/status/{id1}")
	public ModelAndView showEdit1(@PathVariable ("id") Employee employee) {
		return new ModelAndView("task-edit","employee",employee);

	}
	
}
