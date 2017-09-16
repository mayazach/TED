package com.project.rooms.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.User;


@Controller
public class AdminPanelController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value = "/adminpanel",method = RequestMethod.GET)
	public String adminpanel(Model model){
		Logger logger = Logger.getLogger(AdminPanelController.class.getName());
		logger.info("admin panel!!");
		List <User> users = new ArrayList<>();
		for(User user: userDAO.findAllUsers())
			users.add(user);
		model.addAttribute("users",users);
		return "adminpanel";
		
	}	
	@RequestMapping(value="/userdetails/{username}",method=RequestMethod.GET)
	public String userdetails(Model model,@PathVariable("username") String username)
	{
    Logger logger = Logger.getLogger(AdminPanelController.class.getName());	
    logger.info(username);	
    User user=userDAO.findUserByUsername(username);
    model.addAttribute("user",user);
    return "userdetails";
	}
	
}





