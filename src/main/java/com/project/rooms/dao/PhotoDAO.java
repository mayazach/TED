package com.project.rooms.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.rooms.entities.Photo;
import com.project.rooms.entities.Room;

public interface PhotoDAO extends CrudRepository<Photo,Long>{

	@Query("SELECT p FROM Photo p WHERE p.room = :room")
	List<Photo> findPhotosByRoom(@Param("room") Room room);
}
