package com.project.rooms.dao;

import org.springframework.data.repository.CrudRepository;
import com.project.rooms.entities.Room;

public interface RoomDAO extends CrudRepository<Room,Long>{

}
