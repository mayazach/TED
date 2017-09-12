package com.project.rooms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.rooms.dao.OwnerDAO;
import com.project.rooms.dao.RoomDAO;
import com.project.rooms.entities.Owner;
import com.project.rooms.entities.Room;


@Controller
public class RoomAddContoller {
	@Autowired
	OwnerDAO ownerDAO;
	@Autowired
	RoomDAO roomDAO;
	
	 @RequestMapping(value = "/addroom",method = RequestMethod.GET)
	 public String addroom(Model model){
	 return "addroom";
	 }
	 
	 @RequestMapping(value = "/newroom",method = RequestMethod.POST)
	 public String newroom(Authentication authentication,@RequestParam("name") String name,@RequestParam("guests") Integer guests,
			 @RequestParam("beds") Integer numberOfBeds,@RequestParam(value="transport",required=false) String transport){
		 String username = authentication.getName();
		 Owner owner = ownerDAO.getOwnerByUsername(username);
		 Room room = new Room(owner,name,"https://www.google.gr",guests);
		 room.setBeds(numberOfBeds);
		 if(transport != null)
			 room.setTransport(transport);
		 roomDAO.save(room);
		 
	     return "index";
	 }
	 
}