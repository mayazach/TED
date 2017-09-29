package com.project.rooms.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.rooms.dao.MessageDAO;
import com.project.rooms.dao.OwnerDAO;
import com.project.rooms.dao.UserDAO;
import com.project.rooms.entities.Message;
import com.project.rooms.entities.Owner;
import com.project.rooms.entities.Room;
import com.project.rooms.entities.User;

@Controller
public class OwnerController {
	Logger logger = Logger.getLogger(OwnerController.class.getName());
	@Autowired
	private OwnerDAO ownerDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private MessageDAO messageDAO;
	
	@RequestMapping(value="/contactowner/{id}",method = RequestMethod.GET)
	public String contactowner(Model model,Authentication authentication,@PathVariable("id") Long id){
			Owner owner = ownerDAO.findOne(id);
		User recipient=owner.getUser();
		String dokimi=recipient.getUsername();
		String senderna=authentication.getName();
		
		User sender=userDAO.findUserByUsername(senderna);
		
		model.addAttribute("sender",sender);
		model.addAttribute("recipient",recipient);
		return "contactowner.jsp";
	}
	
	/*1.contact with users-View messages(subjects only)*/
	/*links to 2. and 3.*/
	@RequestMapping(value="/contactuser",method=RequestMethod.GET)
	public String contactuser(Model model,Authentication authentication)
	{
		List<Message> messages=new ArrayList<>();
		String recnam=authentication.getName();
		User recipient=userDAO.findUserByUsername(recnam);
		for(Message message : messageDAO.findMessagesByRecipient(recnam))
			messages.add(message);
		/*receive messages for the recipient*/
		
		logger.info("bike");
		logger.info(recnam);
		
	   	model.addAttribute("messages",messages);
	   	   
		
		
		return "contactuser.jsp";
	}
	/*2.read a message and answer to the user-sender*/
      @RequestMapping(value="/readanswer/{id}",method=RequestMethod.GET)
      public String readanswer(Model model,Authentication authentication,@PathVariable("id") Long id )
      {
	  /*receive message with id*/
    	  Message message = messageDAO.findOne(id);
    	  logger.info(authentication.getName());
    	  logger.info(message.getRecipient().getUsername());
    	  if(authentication.getName().equals(message.getRecipient().getUsername())){
      /*take the username of the message's sender*/
    	  String username = message.getSender().getUsername();
    	  model.addAttribute("message",message);
    	  model.addAttribute("username",username);
    	  }
    	  return "readanswer.jsp";  	  
      }


      /*3.send a new message*/
//      @RequestMapping(value="/sendnew",method=RequestMethod.GET)
//      public String sendnew(Model model,Authentication authentication)
//      {
// 
//      return "sendnew.jsp";
//      }
     
      /*4. Store message and inform that the message has been sent*/
      /*4.Redirect to /contactuser*/
      @RequestMapping(value="/storemes",method=RequestMethod.POST)
      public String storemes(Model model,Authentication authentication,
      @RequestParam("recipientName") String recipientName,
      @RequestParam("subject") String subject,@RequestParam("text") String text){
	       String userName=authentication.getName();
	       User sender=userDAO.findUserByUsername(userName);
	       User recipient=userDAO.findUserByUsername(recipientName);
	       /*create a new message object and save it*/
	       
	      return "storemes.jsp";
      }
      
}