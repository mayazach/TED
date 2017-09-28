package com.project.rooms.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.rooms.entities.Message;

public interface MessageDAO extends CrudRepository<Message, Long>{
	
	@Query("SELECT m FROM Message m WHERE m.recipient = :user")
	List<Message> findMessagesByRecipient(@Param("user") String user);
	
	@Query("SELECT m FROM Message m WHERE m.sender = :user")
	List<Message> findMessagesBySender(@Param("user") String user);
}
