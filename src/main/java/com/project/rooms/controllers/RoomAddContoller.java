package com.project.rooms.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class RoomAddContoller {
	 @RequestMapping(value = "/addroom")
	 public String addroom(Model model){
	 return "addroom";
	 }
}
