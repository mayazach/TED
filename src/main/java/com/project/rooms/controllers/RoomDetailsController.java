package com.project.rooms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "roomdetails.jsp";
    }
	
	@RequestMapping(value="/updateroom/{id}",method = RequestMethod.POST)
	public String updateRoom(Model model,@PathVariable("id") Long id,@RequestParam("name") String name,@RequestParam("address") String address,
			@RequestParam("guests") Integer guests,@RequestParam("price") Double price,@RequestParam("roomType") String type,
			@RequestParam("description") String description,@RequestParam("roomType") String roomType,@RequestParam("beds") Integer beds,@RequestParam("bedrooms") Integer bedrooms,
			@RequestParam("bathrooms") Integer bathrooms,@RequestParam(value="transport",required=false) String transport,
			@RequestParam(value="maxGuests",required=false) Integer maxGuests,@RequestParam(value="pricePerExtra",required=false) Double pricePerExtra,
			@RequestParam(value="rules",required=false) String rules,@RequestParam(value="squareMetres",required=false) Integer squareMetres){
    Room room = roomDAO.findOne(id);
    /*necessary fields*/
    room.setName(name);
    room.setAddress(address);
    room.setGuests(guests);
    room.setPrice(price);
    room.setRoomType(type);
    room.setDescription(description);
    room.setBeds(beds);
    room.setBedrooms(bedrooms);
    room.setBathrooms(bathrooms);
    /*no necessary fields*/
    if(maxGuests != null)
		 room.setMaxGuests(maxGuests);
	if(pricePerExtra != null)
		 room.setPricePerExtra(pricePerExtra);
	if(rules != null)
		 room.setRules(rules);
	 if(transport != null)
		 room.setTransport(transport);
	 if(squareMetres != null)
		 room.setSquareMeters(squareMetres);
    roomDAO.save(room);
	return "updateroom.jsp";
	}
}


