package com.jamesluty.dojosandninjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.jamesluty.dojosandninjas.models.Dojos;
import com.jamesluty.dojosandninjas.services.DojosService;

@Controller
public class DojosController {

	@Autowired
	private DojosService dojosService;
	
//	Display routes
	@GetMapping("/")
	public String redirect() {
		return "redirect:/dojos/new";
	}
	
	@GetMapping("/dojos/new")
	public String dojos(@ModelAttribute("dojo") Dojos dojo, Model model) {
		model.addAttribute("allDojos", dojosService.getAll());
		return "dojos.jsp";
	}
	
	@GetMapping("/dojos/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dojo", dojosService.getOne(id));
		return "show.jsp";
	}
	
//	POST routes
	@PostMapping("/dojos/create")
	public String createDojo(@Valid @ModelAttribute("dojo") Dojos dojo, BindingResult result, Model model) {
		model.addAttribute("allDojos", dojosService.getAll());
		if(result.hasErrors()) {
			return "dojos.jsp";
		} else {
			dojosService.save(dojo);
			return "redirect:/dojos/new";
		}
	}
}
