	package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.fpoly.coffeeshop.dto.IngredientsDTO;
import com.fpoly.coffeeshop.service.IIngredientService;

@RestController
public class IngredientsAPI {
	@Autowired
	private IIngredientService ingredientService;

	@GetMapping(value = "/api/ingredient/list")
	public List<IngredientsDTO> findAll() {
		return ingredientService.findAll();
	}

	@GetMapping(value = "/api/ingredient/list/flag_delete/{flag_delete}")
	public List<IngredientsDTO> findAll(@PathVariable("flag_delete") boolean flagDelete) {
		return ingredientService.findAllByFlagDelete(flagDelete);
	}

	@GetMapping(value = "/api/ingredient/flag_delete/total_page")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {

		return ingredientService.getTotalPages(flagDelete, page - 1, limit);
	}
	@GetMapping(value = "/api/ingredient/flag_delete/list")
	public List<IngredientsDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete,
			@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return ingredientService.findAllByFlagDelete(flagDelete, page -1, limit);
	}
	@GetMapping(value = "/api/ingredient/list/search_or/{key}")
	public List<IngredientsDTO> findAllByIngredientCode(@PathVariable("key") String name ){
		return ingredientService.findAllByIngredientCode(name);
	}
	@GetMapping(value = "/api/ingredient/search_or/{total_pages}")
	public Integer getTotalPagesByIngredIngredientCode(@PathVariable("key") String name, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return ingredientService.getTotalPagesByIngredientCode(name, page - 1, limit);
	}
	@GetMapping(value = "/api/ingredient/search_or/list")
	public List<IngredientsDTO> findAllByIngredientCode(@RequestParam("key") String name, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit){
		return ingredientService.findAllByIngredientCode(name, page - 1, limit);
	}
	@GetMapping(value = "api/ingredient/id/{id}")
	public IngredientsDTO findOne(@PathVariable("id") Long id) {
		return ingredientService.findOne(id);
	}
	@GetMapping(value = "api/ingredient/name/{}")
	public IngredientsDTO findOne(@PathVariable("name") String name) {
		return ingredientService.findOne(name);
	}
	
	@PostMapping(value = "api/ingredient/insert")
	public Boolean insert(@RequestBody IngredientsDTO ingredientsDTO) {
		return ingredientService.insert(ingredientsDTO);
	}
	@PutMapping(value = "/api/ingredient/update")
	public Boolean update(@RequestBody IngredientsDTO ingredientsDTO, @RequestParam("id") Long id) {
		ingredientsDTO.setId(id);
		return ingredientService.update(ingredientsDTO);
	}
	@DeleteMapping(value = "/api/ingredient/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return ingredientService.delete(id);
	}
	

}
