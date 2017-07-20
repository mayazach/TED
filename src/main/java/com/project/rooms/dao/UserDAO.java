package com.project.rooms.dao;

import org.springframework.data.repository.CrudRepository;
import com.project.rooms.entities.User;

public interface UserDAO extends CrudRepository<User, Long>{

}
