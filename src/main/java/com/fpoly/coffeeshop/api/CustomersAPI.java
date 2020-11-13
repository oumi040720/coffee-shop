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

import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.service.ICustomersService;

@RestController
public class CustomersAPI {

	@Autowired
	private ICustomersService customersService;

	@GetMapping(value = "/api/customers/list")
	public List<CustomersDTO> findAll() {
		return customersService.findAll();
	}

	@GetMapping(value = "/api/customers/list/flag_delete/{flag_delete}")
	public List<CustomersDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete) {
		return customersService.findAllByFlagDelete(flagDelete);
	}

	@GetMapping(value = "/api/customers/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPages(flagDelete, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/list")
	public List<CustomersDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete,
			@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return customersService.findAllByFlagDelete(flagDelete, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/list/search/{key}")
	public List<CustomersDTO> findAllByKey(@PathVariable("key") String key) {
		return customersService.findAllByKey(key);
	}

	@GetMapping(value = "/api/customers/search/total_pages")
	public Integer getTotalPagesByKey(@RequestParam("key") String key, @RequestParam("page") Integer page, 
										@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByKey(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/customers/search/list")
	public List<CustomersDTO> findAllByKey(@RequestParam("key") String key, @RequestParam("page") Integer page, 
										@RequestParam("limit") Integer limit) {
		return customersService.findAllByKey(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff/flag_delete/search_c/total_pages")
	public Integer getTotalPagesByFlagDeleteAndKey(@RequestParam("key") String key, @RequestParam("flag_delete") Boolean flagDelete, 
													@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByKey(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff/flag_delete/search_c/list")
	public List<CustomersDTO> findAllByFlagDeleteAndKey(@RequestParam("key") String key, @RequestParam("flag_delete") Boolean flagDelete,
													@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return customersService.search(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/id/{id}")
	public CustomersDTO findOne(@PathVariable("id") Long id) {
		return customersService.findOne(id);
	}
	
	@GetMapping(value = "/api/customers/fullname/{fullname}")
	public CustomersDTO findOne(@PathVariable("fullname") String fullname) {
		return customersService.findOne(fullname);
	}
	
	@GetMapping(value = "/api/customers/username/{username}")
	public CustomersDTO findOne1(@PathVariable("username") String username) {
		return customersService.findOne1(username);
	}

	@PostMapping(value = "/api/customers/insert")
	public Boolean insert(@RequestBody CustomersDTO customersDTO) {
		return customersService.insert(customersDTO);
	}

	@PutMapping(value = "/api/customers/update")
	public Boolean update(@RequestBody CustomersDTO customersDTO, @RequestParam("id") Long id) {
		customersDTO.setId(id);
		return customersService.update(customersDTO);
	}

	@DeleteMapping(value = "/api/customers/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return customersService.delete(id);
	}
}
