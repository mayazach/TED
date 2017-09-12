package com.project.rooms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.rooms.dao.RoomDAO;
import com.project.rooms.entities.Owner;
import com.project.rooms.entities.Room;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
@Controller
public class RoomsManagementController {
	@Autowired
	private RoomDAO roomDAO;
	
	 Logger logger = Logger.getLogger(RoomsManagementController.class.getName());
	 List<Room> rooms = new ArrayList<>();
	 @RequestMapping(value = "/managerooms",method = RequestMethod.GET)
	 public String managerooms(Model model){
	 return "managerooms";
	 }
}
/*@Autowired
private RoomDAO roomDAO;

Logger logger = Logger.getLogger(RoomsManagementController.class.getName());

 @RequestMapping(value = "/managerooms",method = RequestMethod.GET)
 public String managerooms(Model model,@RequestParam("owner") Owner owner){
 logger.info("Success!!");
 
 List<Room> rooms = new ArrayList<>();
 for(Room room: roomDAO.findRoomByOwner(owner))
		rooms.add(room); 
 model.addAttribute("rooms",rooms);
 return "managerooms";
 }
 }
	*/