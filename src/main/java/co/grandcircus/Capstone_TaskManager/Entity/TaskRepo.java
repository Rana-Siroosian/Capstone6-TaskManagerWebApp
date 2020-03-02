package co.grandcircus.Capstone_TaskManager.Entity;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.Capstone_TaskManager.DAO.Task;

public interface TaskRepo extends JpaRepository<Task,Long>{

}
