package com.project.rooms.controllers;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.rooms.dao.OwnerDAO;
import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.Owner;
import com.project.rooms.entities.User;

@Controller
public class OwnerController {
	Logger logger = Logger.getLogger(OwnerController.class.getName());
	@Autowired
	private OwnerDAO ownerDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	/*contact with rooms's owner with messages*/
	/*tha allaksei gia na bainei apo to profil*/
	@RequestMapping(value="/contactowner/{id}",method = RequestMethod.GET)
	public String contactowner(Model model,Authentication authentication,@PathVariable("id") Long id){
		/*owner-recipient*/
		Owner owner = ownerDAO.findOne(id);
		User recipient=owner.getUser();
		String dokimi=recipient.getUsername();
		/*logger.info(dokimi);*/
		String senderna=authentication.getName();
		/*user-sender*/
		User sender=userDAO.findUserByUsername(senderna);
		
		/*User recipient=userDAO.*/
	    model.addAttribute("sender",sender);
		model.addAttribute("recipient",recipient);
		return "contactowner.jsp";
	}
	
	/*contact with users*/
	@RequestMapping(value="/contactusers",method=RequestMethod.GET)
	public String contactuser(Model model,Authentication authentication)
	{
		
		
		return "contactuser.jsp";
	}
}



