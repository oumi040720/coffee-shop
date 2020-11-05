package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.IngredientsDTO;
import com.fpoly.coffeeshop.service.IIngredientService;

@RestController
public class IngredientsAPI {
	@Autowired
	private IIngredientService ingredientService;
	@GetMapping(value = "/api/ingredient/list")
	public List<IngredientsDTO> findAll(){
		return ingredientService.findAll();
	}
	@GetMapping(value = "/api/ingredient/list/flag_delete/{flag_delete}")
	public List<IngredientsDTO> findAll(@PathVariable("flag_delete") boolean flagDelete){
		return ingredientService.findAllByFlagDelete(flagDelete);
	}
	
}
