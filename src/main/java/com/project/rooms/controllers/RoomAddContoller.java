package com.project.rooms.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

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
	 @ResponseStatus(value=HttpStatus.OK)
	 public String newroom(Authentication authentication,@RequestParam("name") String name,@RequestParam("address") String address,
			 @RequestParam("guests") Integer guests,@RequestParam(value="maxGuests",required=false) Integer maxGuests,
			 @RequestParam("price") Double price,@RequestParam(value="pricePerExtra",required=false) Double pricePerExtra,
			 @RequestParam("roomType") String roomType,@RequestParam(value="rules",required=false) String rules,
			 @RequestParam("description") String description,@RequestParam("bathrooms") Integer bathrooms ,@RequestParam("bedrooms") Integer bedrooms, 
			 @RequestParam("beds") Integer numberOfBeds,@RequestParam(value="transport",required=false) String transport,
			 @RequestParam(value="squareMetres",required=false) Integer squareMetres,@RequestParam(value="time-beginning") String dateFrom,
			 @RequestParam(value="time-end",required=false) String dateTo){
		 
		 Calendar cal = Calendar.getInstance();
		 cal.set(2099, 11, 31);
		 Date from,to;
		 SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
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
		 try{
		 if(dateFrom.equals(""))
			from = cal.getTime();
		 else
			from = df.parse(dateFrom);
		 cal.set(2000, 0, 1);
		 if(dateTo.equals(""))
			to = cal.getTime();
		 else
			to = df.parse(dateTo);
		 room.setDescription(description);
		 room.setBathrooms(bathrooms);
		 room.setBedrooms(bedrooms);
		 room.setBeds(numberOfBeds);
		 room.setDateFrom(from);
		 room.setDateTo(to);
		 if(transport != null)
			 room.setTransport(transport);
		 if(squareMetres != null)
			 room.setSquareMeters(squareMetres);
		 roomDAO.save(room);
		 return "../index.html";
		 }catch(ParseException p){
			 p.printStackTrace();
		 }
		 return "addroom.jsp";
	 }
	 
}