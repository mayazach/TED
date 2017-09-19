package com.project.rooms.controllers;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.rooms.dao.OwnerDAO;
import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.User;

@Controller
public class ProfileController {
	Logger logger = Logger.getLogger(RoomsManagementController.class.getName());
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value = "/profile",method = RequestMethod.GET)
	public String profilepage(Model model,Authentication authentication){
    String username = authentication.getName();
    logger.info(username);
    User user=userDAO.findUserByUsername(username);
    model.addAttribute("user",user);
    
    return "profile";	
	}
}