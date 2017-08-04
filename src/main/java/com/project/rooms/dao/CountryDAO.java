package com.project.rooms.dao;

import org.springframework.data.repository.CrudRepository;
import com.project.rooms.entities.Country;

public interface CountryDAO extends CrudRepository<Country, Long>{

}
