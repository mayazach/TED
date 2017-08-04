package com.project.rooms.dao;

import org.springframework.data.repository.CrudRepository;
import com.project.rooms.entities.Owner;

public interface OwnerDAO extends CrudRepository<Owner, Long>{

}
