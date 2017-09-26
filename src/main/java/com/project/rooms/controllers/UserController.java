package com.project.rooms.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.User;

@RestController
public class UserController {
	Logger logger = Logger.getLogger(SearchController.class.getName());
	
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping("/users")
	public List<User> getUsers(){
		List<User> users = new ArrayList<>();
		for(User user: userDAO.findAll())
			users.add(user);
		return users;
	}
	
	@GetMapping("/logged")
	String getLoggedUser(){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

            List<String> roles = new ArrayList<String>();

            for (GrantedAuthority a : authorities) {
                roles.add(a.getAuthority());
            }
            return roles.get(0);
        }
        else {
            return "anonymous";
        }
	}
	
	@GetMapping("/usernameExists/{username}")
	String usernameExists(@PathVariable String username){
		User user = userDAO.findUserByUsername(username);
		if(user != null)
			return "true";
		else
			return "false";
	}
}
