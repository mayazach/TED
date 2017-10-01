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
			+ "AND (r.amenities LIKE CONCAT('%',:ac,'%')) AND (r.amenities LIKE CONCAT('%',:heating,'%')) "
			+ "AND (r.amenities LIKE CONCAT('%',:kitchen,'%')) AND (r.amenities LIKE CONCAT('%',:parking,'%')) "
			+ "AND (r.amenities LIKE CONCAT('%',:elevator,'%')) AND :dateFrom >= r.dateFrom AND :dateTo <= r.dateTo "
			+ "AND (r.amenities LIKE CONCAT('%',:tv,'%')) AND (c.name = :country OR :country = '') ORDER BY r.price")
	List<Room> searchRooms(@Param("neighborhood") String neighborhood,@Param("city") String city,
			@Param("guests") int guests,@Param("price") double price,@Param("roomType") String roomType,
			@Param("wifi") String wifi,@Param("dateFrom") Date dateFrom,@Param("dateTo") Date dateTo,
			@Param("ac") String ac,@Param("heating") String heating,@Param("kitchen") String kitchen,
			@Param("tv") String tv,@Param("parking") String parking,@Param("elevator") String elevator,
			@Param("country") String country);
	
	
	
}
