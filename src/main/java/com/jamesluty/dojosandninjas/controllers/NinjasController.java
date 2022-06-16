package com.jamesluty.dojosandninjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jamesluty.dojosandninjas.models.Ninjas;
import com.jamesluty.dojosandninjas.services.DojosService;
import com.jamesluty.dojosandninjas.services.NinjasService;

@Controller
public class NinjasController {

	@Autowired
	private NinjasService ninjasService;
	
	@Autowired
	private DojosService dojosService;
	
//	Display Routes
	@GetMapping("/ninjas/new")
	public String ninjas(@ModelAttribute("ninja") Ninjas ninja, Model model) {
		model.addAttribute("allDojos", dojosService.getAll());
		return "ninjas.jsp";
	}
	
//	POST routes
	@PostMapping("/ninjas/create")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninjas ninja, BindingResult result, Model model) {
		model.addAttribute("allDojos", dojosService.getAll());
		if(result.hasErrors()) {
			return "ninjas.jsp";
		} else {
			ninjasService.save(ninja);
			return "redirect:/dojos/new";
		}
	}
}
