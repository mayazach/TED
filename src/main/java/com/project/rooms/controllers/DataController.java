package com.project.rooms.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.project.rooms.dao.*;
import com.project.rooms.entities.*;

@RestController
public class DataController {
	@Autowired
	private CountryDAO countryDAO;
	@Autowired
	private OwnerDAO ownerDAO;
	@Autowired
	private RoomDAO roomDAO;
	
	@GetMapping("/countries")
	public List<Country> getCountries(){
		List<Country> countries = new ArrayList<>();
		for(Country country: countryDAO.findAll())
			countries.add(country);
		return countries;
	}
	
	@GetMapping("/owners")
	public List<Owner> getOwners(){
		List<Owner> owners = new ArrayList<>();
		for(Owner owner: ownerDAO.findAll())
			owners.add(owner);
		return owners;
	}
	
	@GetMapping("/rooms")
	public List<Room> getRooms(){
		List<Room> rooms = new ArrayList<>();
		for(Room room: roomDAO.findAll())
			rooms.add(room);
		return rooms;
	}
}