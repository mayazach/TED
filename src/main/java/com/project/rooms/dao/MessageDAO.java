package com.project.rooms.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.rooms.entities.Message;

public interface MessageDAO extends CrudRepository<Message, Long>{
	
	@Query("SELECT m FROM Message m JOIN m.recipient u WHERE u.username = :user")
	List<Message> findMessagesByRecipient(@Param("user") String user);
	
	@Query("SELECT m FROM Message m JOIN m.sender u WHERE u.username = :user")
	List<Message> findMessagesBySender(@Param("user") String user);
}
