package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.IUserService;

@RestController(value = "/api/user")
public class UserAPI {

	@Autowired
	private IUserService userService;
	
	@GetMapping(value = "/list")
	public List<UserDTO> findAll() {
		return userService.findAll();
	}
	
	@GetMapping(value = "/list/flag_delete/{flag_delete}")
	public List<UserDTO> findAll(@PathVariable("flag_delete") boolean flagDelete) {
		return userService.findAllByFlagDelete(flagDelete);
	}

	@GetMapping(value = "/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") boolean flagDelete, @RequestParam("page") Integer page, 
								 @RequestParam("limit") Integer limit) {
		return userService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/flag_delete/list")
	public List<UserDTO> findAllByFlagDelete(@RequestParam("flag_delete") boolean flagDelete, @RequestParam("page") Integer page, 
											@RequestParam("limit") Integer limit) {
		return userService.findAllByFlagDelete(flagDelete, page, limit);
	}
	
	@GetMapping(value = "/list/username/{key}")
	public List<UserDTO> findAllByUsername(@PathVariable("key") String key) {
		return userService.findAllByUsername(key);
	}
	
	@GetMapping(value = "/username/total_pages")
	public Integer getTotalPagesByUsername(@RequestParam("key") String key, @RequestParam("page") Integer page, 
								 			@RequestParam("limit") Integer limit) {
		return userService.getTotalPagesByUsername(key, page, limit);
	}
	
	@GetMapping(value = "/username/list")
	public List<UserDTO> findAllByUsername(@RequestParam("key") String key, @RequestParam("page") Integer page, 
											@RequestParam("limit") Integer limit) {
		return userService.findAllByUsername(key, page, limit);
	}
	
	@GetMapping(value = "/id/{id}")
	public UserDTO findOne(@PathVariable("id") Long id) {
		return userService.findOne(id);
	}
	
	@GetMapping(value = "/username/{username}")
	public UserDTO findOne(@PathVariable("username") String username) {
		return userService.findOne(username);
	}
	
	@PostMapping(value = "/insert")
	public Boolean insert(@RequestBody UserDTO userDTO) {
		return userService.insert(userDTO);
	}
	
	@PutMapping(value = "/update")
	public Boolean update(@RequestBody UserDTO userDTO, @RequestParam("id") Long id) {
		userDTO.setId(id);
		
		return userService.update(userDTO);
	}
	
	@PutMapping(value = "/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return userService.delete(id);
	}
	
	
}
