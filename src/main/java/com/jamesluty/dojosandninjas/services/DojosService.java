package com.jamesluty.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamesluty.dojosandninjas.models.Dojos;
import com.jamesluty.dojosandninjas.repos.DojosRepo;

@Service
public class DojosService {

	@Autowired
	private DojosRepo dojosRepo;
	
//	Create and Update service
	public Dojos save(Dojos dojo) {
		return dojosRepo.save(dojo);
	}
	
//	Read service
	public List<Dojos> getAll(){
		return dojosRepo.findAll();
	}
	
	public Dojos getOne(Long id) {
		Optional<Dojos> optDojo = dojosRepo.findById(id);
		if(optDojo.isPresent()) {
			return optDojo.get();
		} else {
			return null;
		}
	}
	
//	Delete service
	public void delete(Long id) {
		dojosRepo.deleteById(id);
	}
}
