package com.project.rooms.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.rooms.entities.Owner;
import com.project.rooms.entities.Room;

public interface RoomDAO extends CrudRepository<Room,Long>{

	@Query("SELECT r FROM Room r WHERE r.city =:city")
	List<Room> findRoomByCity(@Param("city") String city);
	
	@Query("SELECT r FROM Room r WHERE r.owner =:owner")
	List<Room> findRoomByOwner(@Param("owner") Owner owner);
	
	@Query("SELECT r FROM Room r JOIN r.country c WHERE (r.neighborhood = :neighborhood OR :neighborhood = '') "
			+ "AND (r.city = :city OR :city = '') AND r.maxGuests >= :guests AND r.price <= :price "
			+ "AND (r.roomType =:roomType OR :roomType = 'Any' ) AND (r.amenities LIKE CONCAT('%',:wifi,'%')) "
			+ "ORDER BY r.price")
	List<Room> searchRooms(@Param("neighborhood") String neighborhood,@Param("city") String city,
			@Param("guests") int guests,@Param("price") double price,@Param("roomType") String roomType,
			@Param("wifi") String wifi);
	
	
	
}
