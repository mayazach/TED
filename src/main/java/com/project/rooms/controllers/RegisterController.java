package com.project.rooms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.User;

@Controller
public class RegisterController {
	
	@Autowired
	UserDAO userDAO;
	
	@PostMapping("/registerUser")
	public String registerUser(@RequestParam("uname") String username,@RequestParam("pword") String password,
			@RequestParam("fname") String firstName,@RequestParam("lname") String lastName,
			@RequestParam("mail") String mail,@RequestParam("phone") String phone,@RequestParam("role") String role){
		User user = new User(username,password,firstName,lastName,mail,phone,"photourl","user");
		userDAO.save(user);
		return "updateroom";
	}

}
