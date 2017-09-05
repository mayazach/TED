package com.project.rooms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.rooms.dao.OwnerDAO;
import com.project.rooms.entities.Owner;

@Controller
public class OwnerController {

	@Autowired
	private OwnerDAO ownerDAO;
	
	@RequestMapping(value="/owner/{id}",method = RequestMethod.GET)
	public String showOwner(Model model,@PathVariable("id") Long id){
		Owner owner = ownerDAO.findOne(id);
		model.addAttribute("owner",owner);
		return "contactowner";
	}
}
