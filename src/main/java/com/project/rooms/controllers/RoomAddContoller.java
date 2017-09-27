package com.project.rooms.controllers;

import java.util.logging.Logger;

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
	Logger logger = Logger.getLogger(RoomController.class.getName());
	
	@Autowired
	OwnerDAO ownerDAO;
	@Autowired
	RoomDAO roomDAO;
	
	 @RequestMapping(value = "/addroom",method = RequestMethod.GET)
	 public String addroom(Model model){
	 return "addroom.jsp";
	 }
	 
	 @RequestMapping(value = "/newroom",method = RequestMethod.POST)
	 public String newroom(Authentication authentication,@RequestParam("name") String name,@RequestParam("address") String address,
			 @RequestParam("guests") Integer guests,@RequestParam(value="maxGuests",required=false) Integer maxGuests,
			 @RequestParam("price") Double price,@RequestParam(value="pricePerExtra",required=false) Double pricePerExtra,
			 @RequestParam("roomType") String roomType,@RequestParam(value="rules",required=false) String rules,
			 @RequestParam("description") String description,@RequestParam("bathrooms") Integer bathrooms ,@RequestParam("bedrooms") Integer bedrooms, 
			 @RequestParam("beds") Integer numberOfBeds,@RequestParam(value="transport",required=false) String transport){
		 String username = authentication.getName();
		 Owner owner = ownerDAO.getOwnerByUsername(username);
		 Room room = new Room(owner,name,"https://www.google.gr",guests);
		 room.setAddress(address);
		 if(maxGuests != null)
			 room.setMaxGuests(maxGuests);
		 room.setPrice(price);
		 if(pricePerExtra != null)
			 room.setPricePerExtra(pricePerExtra);
		 room.setRoomType(roomType);
		 if(rules != null)
			 room.setRules(rules);
		 room.setDescription(description);
		 room.setBathrooms(bathrooms);
		 room.setBedrooms(bedrooms);
		 room.setBeds(numberOfBeds);
		 if(transport != null)
			 room.setTransport(transport);
		 roomDAO.save(room);
		 return "../index.html";
	 }
	 
}