package com.project.rooms.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class RoomsManagementController {
	
	
	 @RequestMapping(value = "/managerooms",method = RequestMethod.GET)
	 public String managerooms(Model model){
	       
	 return "managerooms";
	 }
}
