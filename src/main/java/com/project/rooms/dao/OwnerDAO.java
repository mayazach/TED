package com.project.rooms.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.rooms.entities.Owner;

public interface OwnerDAO extends CrudRepository<Owner, Long>{

	@Query("SELECT o FROM Owner o JOIN o.user u WHERE u.username = :username")
	Owner getOwnerByUsername(@Param("username") String username);
}
