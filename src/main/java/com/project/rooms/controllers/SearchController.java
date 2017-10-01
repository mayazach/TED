package com.project.rooms.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
	
	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public String search(Model model,@RequestParam("city") String city,@RequestParam(value="neighborhood",required=false)String neighborhood,
			@RequestParam("guests") Integer guests,@RequestParam(value = "price",required=false) Double price,
			@RequestParam(value = "roomType",required=false) String roomType,@RequestParam(value="wifi",required=false) String wifi,
			@RequestParam(value = "time-arrival",required=false) String dateFrom,@RequestParam(value="time-departure", required=false) String dateTo,
			@RequestParam(value = "ac",required=false) String ac, @RequestParam(value = "heating",required=false) String heating,
			@RequestParam(value = "kitchen",required=false) String kitchen,@RequestParam(value = "tv",required=false) String tv,
			@RequestParam(value = "parking",required=false) String parking,@RequestParam(value = "elevator",required=false) String elevator,
			@RequestParam(value = "country",required=false) String country){
		if(wifi == null)
			wifi = "";
		if(ac == null)
			ac = "";
		if(heating == null)
			heating = "";
		if(kitchen == null)
			kitchen = "";
		if(tv == null)
			tv = "";
		if(parking == null)
			parking = "";
		if(elevator == null)
			elevator = "";
		if(country == null)
			country = "";
		int people = 17;
		double maxPrice = 600000;
		Date from;
		Date to;
		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		logger.info(dateFrom.toString());
		logger.info(dateTo.toString());
		Calendar cal = Calendar.getInstance();
		cal.set(2099, 11, 31);
		String type = "Any";
		if(guests != null)
			people = guests;
		if(price != null)
			maxPrice = price;
		if(roomType != null)
			type = roomType;
		try{if(dateFrom.equals(""))
			from = cal.getTime();
		else
			from = df.parse(dateFrom);
		cal.set(2000, 0, 1);
		if(dateTo.equals(""))
			to = cal.getTime();
		else
			to = df.parse(dateTo);
		List<Room> rooms = new ArrayList<>();
		for(Room room: roomDAO.searchRooms(neighborhood, city, people,maxPrice,type,wifi,from,to,ac,heating,kitchen,tv,parking,elevator,country))
			rooms.add(room);
		model.addAttribute("rooms",rooms);
		}catch (ParseException p){
			p.printStackTrace();
		}
		return "search.jsp";
	}

}
