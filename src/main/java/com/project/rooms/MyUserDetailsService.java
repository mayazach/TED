package com.project.rooms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.User;

@Component
public class MyUserDetailsService implements UserDetailsService{
	
	@Autowired
	UserDAO userDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username){
		try{
		User user = userDAO.findUserByUsername(username);
		return new MyUserPrincipal(user);
		}
		catch(Exception e){
			throw new UsernameNotFoundException("User not found");
		}
	}
	
	

}
