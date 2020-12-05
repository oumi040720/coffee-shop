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

import com.fpoly.coffeeshop.dto.CategoryDTO;
import com.fpoly.coffeeshop.service.ICategoryService;

@RestController
public class CategoryAPI {
	@Autowired
	private ICategoryService categoryService;
	
	@GetMapping(value = "/api/category/list")
	public List<CategoryDTO> findAll(){
		return categoryService.findAll();
	}
	
	@GetMapping(value = "/api/category/list/flag_delete/{flag_delete}" )
	public List<CategoryDTO> findAll(@PathVariable("flag_delete") boolean flagDelete){
		return categoryService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/category/id/{id}")
	public CategoryDTO findOne(@PathVariable("id") Integer id) {
		return categoryService.findOne(id);
	}
	
	@GetMapping(value ="/api/category/category_code/{categoryCode}" )
	public CategoryDTO findOne(@PathVariable("categoryCode") String categoryCode) {
		return categoryService.findOne(categoryCode);
	}
	
	@PostMapping(value = "/api/category/insert")
	public Boolean insert(@RequestBody CategoryDTO categoryDTO) {
		return categoryService.insert(categoryDTO);
	}
	
	@PutMapping(value = "/api/category/update")
	public Boolean update(@RequestBody CategoryDTO categoryDTO, @RequestParam("id") Integer id) {
		categoryDTO.setId(id);
		return categoryService.update(categoryDTO);
	}
	
	@DeleteMapping(value = "/api/category/delete")
	public Boolean delete(@RequestParam("id") Integer id) {
		return categoryService.delete(id);
	}
	
}
