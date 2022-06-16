package com.jamesluty.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamesluty.dojosandninjas.models.Ninjas;
import com.jamesluty.dojosandninjas.repos.NinjasRepo;

@Service
public class NinjasService {

	@Autowired
	private NinjasRepo ninjasRepo;
	
//	Create and Update service
	public Ninjas save(Ninjas ninja) {
		return ninjasRepo.save(ninja);
	}
	
//	Read service
	public List<Ninjas> getAll(){
		return ninjasRepo.findAll();
	}
	
	public Ninjas getOne(Long id) {
		Optional<Ninjas> optNinja = ninjasRepo.findById(id);
		if(optNinja.isPresent()) {
			return optNinja.get();
		} else {
			return null;
		}
	}
	
//	Delete service
	public void delete(Long id) {
		ninjasRepo.deleteById(id);
	}
}
