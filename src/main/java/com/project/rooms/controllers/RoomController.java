package com.project.rooms.controllers;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.rooms.dao.RoomDAO;
import com.project.rooms.entities.Room;

@Controller
public class RoomController {
	Logger logger = Logger.getLogger(RoomController.class.getName());
	
	@Autowired
	private RoomDAO roomDAO;
	
	@RequestMapping(value="/showroom/{id}",method = RequestMethod.GET)
    public String hello(Model model,@PathVariable("id") Long id) {
		Room room = roomDAO.findOne(id);
		model.addAttribute("room",room);
        return "showroom";
    }

}