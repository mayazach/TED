package com.project.rooms.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {
	@RequestMapping("/showroom")
    public String hello(Model model) {
        return "showroom";
    }

}
