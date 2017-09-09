package com.project.rooms.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.rooms.entities.User;

public interface UserDAO extends CrudRepository<User, Long>{
	
	@Query("SELECT u FROM User u WHERE u.username = :username")
	User findUserByUsername(@Param("username") String username);

}
