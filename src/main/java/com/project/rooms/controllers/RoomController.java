package com.project.rooms.controllers;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.rooms.dao.OwnerDAO;
import com.project.rooms.dao.PhotoDAO;
import com.project.rooms.dao.RoomDAO;
import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.Owner;
import com.project.rooms.entities.Photo;
import com.project.rooms.entities.Room;
import com.project.rooms.entities.User;

@Controller
public class RoomController {
	Logger logger = Logger.getLogger(RoomController.class.getName());
	
	@Autowired
	private RoomDAO roomDAO;
	
	@Autowired
	private PhotoDAO photoDAO;
	
	@Autowired 
	private OwnerDAO ownerDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value="/showroom/{id}",method = RequestMethod.GET)
    public String hello(Model model,@PathVariable("id") Long id) {
		Room room = roomDAO.findOne(id);
		List<Photo> photos = photoDAO.findPhotosByRoom(room);
		
		/*get room owner basic info*/
		Owner owner=room.getOwner();
		User user=owner.getUser();
		model.addAttribute("roomowner",user);
		String username=user.getUsername();
		
		/*String amenities*/
		String str1=room.getAmenities();
		String str2=str1.replace("{", "");
		String str3=str2.replace("}","");
		String amenities=str3.replace("\"","");
		logger.info(amenities);
		model.addAttribute("amenities",amenities);
		
		
		model.addAttribute("room",room);
		model.addAttribute("photos",photos);
        return "showroom.jsp";
    }

}
