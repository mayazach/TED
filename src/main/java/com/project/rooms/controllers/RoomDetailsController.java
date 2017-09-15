package com.project.rooms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.rooms.dao.RoomDAO;
import com.project.rooms.entities.Room;

@Controller
public class RoomDetailsController {
	@Autowired
	private RoomDAO roomDAO;
	
	@RequestMapping(value="/roomdetails/{id}",method = RequestMethod.GET)
	public String roomDetails(Model model, @PathVariable("id") Long id){
		Room room = roomDAO.findOne(id);
		model.addAttribute("room",room);
		return "roomdetails";
    }
	@RequestMapping(value="/updateroom/{id}",method = RequestMethod.POST)
	public String updateRoom(Model model){
    /*apla emfanizei mhnyma oti*/
    /*h diadikasia petyxe*/
    /*kai kanei redirect sthn arxikh selida*/
	return "updateroom";
	}
}


