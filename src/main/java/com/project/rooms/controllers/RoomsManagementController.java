package com.project.rooms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.rooms.dao.OwnerDAO;
import com.project.rooms.dao.RoomDAO;
import com.project.rooms.entities.Owner;
import com.project.rooms.entities.Room;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
@Controller
public class RoomsManagementController {
	Logger logger = Logger.getLogger(RoomsManagementController.class.getName());
	
	@Autowired
	private RoomDAO roomDAO;
	@Autowired
	private OwnerDAO ownerDAO;
	
	@RequestMapping(value = "/managerooms",method = RequestMethod.GET)
	public String managerooms(Model model,Authentication authentication){
		logger.info("Success!!");
		String username = authentication.getName();
		Owner owner = ownerDAO.getOwnerByUsername(username);
	 
		List<Room> rooms = new ArrayList<>();
		for(Room room: roomDAO.findRoomByOwner(owner))
			rooms.add(room); 
		model.addAttribute("rooms",rooms);
		return "managerooms";
	 }
 }