package com.jamesluty.dojosandninjas.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jamesluty.dojosandninjas.models.Dojos;

@Repository
public interface DojosRepo extends CrudRepository<Dojos, Long> {
	// this method retrieves all the books from the database
	List<Dojos> findAll();
}
