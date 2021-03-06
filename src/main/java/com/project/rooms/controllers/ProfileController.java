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
import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.Owner;
import com.project.rooms.entities.User;

@Controller
public class ProfileController {
	Logger logger = Logger.getLogger(RoomsManagementController.class.getName());
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private OwnerDAO ownerDAO;
	
	@RequestMapping(value = "/profile",method = RequestMethod.GET)
	public String profilepage(Model model,Authentication authentication){
	int is_owner=0;
	String role;
	String username = authentication.getName();
    User user=userDAO.findUserByUsername(username);
    role=user.getRole();
    if(role.equals("owner"))
    {
    	is_owner=1;
    }
    model.addAttribute("user",user);
    try{
    	Owner owner = ownerDAO.getOwnerByUsername(username);
    	model.addAttribute("owner",owner);
    	model.addAttribute("is_owner",is_owner);
    	return "profile.jsp";
    }catch (NullPointerException e){
	    /*model.addAttribute("user",user);*/
    	model.addAttribute("is_owner",is_owner);
	    return "profile.jsp";
    }
	}
	
	/*form to edit profile*/
	@RequestMapping(value="/editprofile",method=RequestMethod.GET)
	public String editprofile(Model model,Authentication authentication)
	{
	int is_owner=0;
	String role;
	String username= authentication.getName();
	User user=userDAO.findUserByUsername(username);
	role=user.getRole();
	if(role.equals("owner"))
    {
    	is_owner=1;
    }
	model.addAttribute("user",user);
	try{
    	Owner owner = ownerDAO.getOwnerByUsername(username);
    	model.addAttribute("owner",owner);
    	model.addAttribute("is_owner",is_owner);
    	return "editprofile.jsp";
    }catch (NullPointerException e){
	
	
	return "editprofile.jsp";
    }
	}		
	
	
	/*update profile and inform the user*/
    @RequestMapping(value="/updateprofile",method = RequestMethod.POST)
    public String updateprofile(Model model,Authentication authentication,@RequestParam("firstName") String firstName,
    		@RequestParam("lastName") String lastName,@RequestParam("email") String email,@RequestParam("phone") String phone,
    		@RequestParam(value="url",required=false) String url,@RequestParam(value="description",required=false) String description,
    		@RequestParam(value="location",required=false) String location){ 	
        String username=authentication.getName();
    	User user=userDAO.findUserByUsername(username);
    	/*setFirstName(String firstName)
    	setLastName(String lastName)
    	setEmail(String email)
    	setPhone(String phone)
    	*/
    	user.setFirstName(firstName);
    	user.setLastName(lastName);
    	user.setEmail(email);
    	user.setPhone(phone);
        userDAO.save(user);
        String role;
        role=user.getRole();
        try{
        	Owner owner = ownerDAO.getOwnerByUsername(username);
        	if(url != null)
        	{
    			 owner.setUrl(url);
        	}
        	if(description != null)
        	{
   			 owner.setDescription(description);
        	}
        	if(location != null)
        	{
   			owner.setLocation(location);
        	}
        	if(role.equals("owner"))
        	{
        	ownerDAO.save(owner);
        	}
        	return "updateprofile.jsp";
        }catch (NullPointerException e){
    	
     	return "updateprofile.jsp";	
        }
    }
    
    /*form to change password*/
    @RequestMapping(value="/changepassword",method = RequestMethod.GET)
    public String changepassword(Model model,Authentication authentication)
    {
    String username=authentication.getName();
    User user=userDAO.findUserByUsername(username);
    String password=user.getPassword();
    model.addAttribute("user",user);
    model.addAttribute("password",password);

    return "changepassword.jsp";
    }
    
   /*update password and inform the user*/ 
   @RequestMapping(value="/updatepassword",method = RequestMethod.POST)
   public String updatepassword(Model model,Authentication authentication,@RequestParam("newpw") String newpw)
   {
	   String username=authentication.getName();
	   User user=userDAO.findUserByUsername(username); 
	   user.setPassword(newpw);
	   userDAO.save(user);
	   
	   return "updatepassword.jsp";
	   
   }
    
    
	
}	


