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

	@GetMapping(value = "/api/customers/list/search_f/{key}")
	public List<CustomersDTO> findAllByFullname(@PathVariable("key") String key) {
		return customersService.findAllByFullname(key);
	}

	@GetMapping(value = "/api/customers/search_f/total_pages")
	public Integer getTotalPagesByFullname(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByFullname(key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/search_f/list")
	public List<CustomersDTO> findAllByFullname(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.findAllByFullname(key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/list/search_e/{key}")
	public List<CustomersDTO> findAllByEmail(@PathVariable("key") String key) {
		return customersService.findAllByEmail(key);
	}

	@GetMapping(value = "/api/customers/search_e/total_pages")
	public Integer getTotalPagesByEmail(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByEmail(key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/search_e/list")
	public List<CustomersDTO> findAllByEmail(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.findAllByEmail(key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/list/search_a/{key}")
	public List<CustomersDTO> findAllByAddress(@PathVariable("key") String key) {
		return customersService.findAllByAddress(key);
	}

	@GetMapping(value = "/api/customers/search_a/total_pages")
	public Integer getTotalPagesByAddress(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByAddress(key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/search_a/list")
	public List<CustomersDTO> findAllByAddress(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.findAllByAddress(key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/list/search_p/{key}")
	public List<CustomersDTO> findAllByPhone(@PathVariable("key") String key) {
		return customersService.findAllByPhone(key);
	}

	@GetMapping(value = "/api/customers/search_p/total_pages")
	public Integer getTotalPagesByPhone(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByPhone(key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/search_p/list")
	public List<CustomersDTO> findAllByPhone(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.findAllByPhone(key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/{flagDelete}/search_fn/{key}")
	public List<CustomersDTO> findAllByFlagDeleteAndFullname(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String key) {
		return customersService.findAllByFlagDeleteAndFullname(flagDelete, key);
	}

	@GetMapping(value = "/api/customers/flag_delete/search_fn/total_pages")
	public Integer getTotalPagesByFlagDeleteAndFullname(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByFlagDeleteAndFullname(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/search_fn/list")
	public List<CustomersDTO> findAllByFlagDeleteAndFullname(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.findAllByFlagDeleteAndFullname(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/{flagDelete}/search_e/{key}")
	public List<CustomersDTO> findAllByFlagDeleteAndEmail(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String key) {
		return customersService.findAllByFlagDeleteAndEmail(flagDelete, key);
	}

	@GetMapping(value = "/api/customers/flag_delete/search_e/total_pages")
	public Integer getTotalPagesByFlagDeleteAndEmail(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByFlagDeleteAndEmail(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/search_e/list")
	public List<CustomersDTO> findAllByFlagDeleteAndEmail(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.findAllByFlagDeleteAndEmail(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/{flagDelete}/search_p/{key}")
	public List<CustomersDTO> findAllByFlagDeleteAndPhone(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String key) {
		return customersService.findAllByFlagDeleteAndPhone(flagDelete, key);
	}

	@GetMapping(value = "/api/customers/flag_delete/search_p/total_pages")
	public Integer getTotalPagesByFlagDeleteAndPhone(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByFlagDeleteAndPhone(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/search_p/list")
	public List<CustomersDTO> findAllByFlagDeleteAndPhone(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.findAllByFlagDeleteAndPhone(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/{flagDelete}/search_a/{key}")
	public List<CustomersDTO> findAllByFlagDeleteAndAddress(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String key) {
		return customersService.findAllByFlagDeleteAndAddress(flagDelete, key);
	}

	@GetMapping(value = "/api/customers/flag_delete/search_a/total_pages")
	public Integer getTotalPagesByFlagDeleteAndAddress(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.getTotalPagesByFlagDeleteAndAddress(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/flag_delete/search_a/list")
	public List<CustomersDTO> findAllByFlagDeleteAndAddress(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return customersService.findAllByFlagDeleteAndAddress(flagDelete, key, page - 1, limit);
	}

	@GetMapping(value = "/api/customers/id/{id}")
	public CustomersDTO findOne(@PathVariable("id") Long id) {
		return customersService.findOne(id);
	}
	
	@GetMapping(value = "/api/customers/fullname/{fullname}")
	public CustomersDTO findOne(@PathVariable("fullname") String fullname) {
		return customersService.findOne(fullname);
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
