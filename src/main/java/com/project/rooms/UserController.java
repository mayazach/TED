package com.project.rooms;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.User;

@RestController
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping("/users")
	public List<User> getUsers(){
		List<User> users = new ArrayList<>();
		for(User user: userDAO.findAll())
			users.add(user);
		return users;
	}
}
