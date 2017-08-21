package com.project.rooms.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.rooms.entities.Room;

public interface RoomDAO extends CrudRepository<Room,Long>{

	@Query("SELECT r FROM Room r WHERE r.city =:city")
	List<Room> findRoomByCity(@Param("city") String city);
}
