package com.project.rooms.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.rooms.dao.RoomDAO;
import com.project.rooms.entities.Room;

@Controller
public class SearchController {
	@Autowired
	private RoomDAO roomDAO;
	
	Logger logger = Logger.getLogger(SearchController.class.getName());
	
	@RequestMapping(value = "/search",method = RequestMethod.POST)
	public String search(Model model,@RequestParam("city") String city,@RequestParam(value="neighborhood",required=false)String neighborhood){
		logger.info("Endpoint hit succesfully");
		List<Room> rooms = new ArrayList<>();
		for(Room room: roomDAO.findRoomByCity(city))
			rooms.add(room);
		logger.info(city);
		model.addAttribute("rooms",rooms);
		return "search";
	}

}
