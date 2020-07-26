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

import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.IUserService;

@RestController
public class UserAPI {

	@Autowired
	private IUserService userService;
	
	@GetMapping(value = "/api/user/list")
	public List<UserDTO> findAll() {
		return userService.findAll();
	}
	
	@GetMapping(value = "/api/user/list/flag_delete/{flag_delete}")
	public List<UserDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete) {
		return userService.findAllByFlagDelete(flagDelete);
	}

	@GetMapping(value = "/api/user/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page, 
								 @RequestParam("limit") Integer limit) {
		return userService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/user/flag_delete/list")
	public List<UserDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page, 
											@RequestParam("limit") Integer limit) {
		return userService.findAllByFlagDelete(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/user/list/search/{key}")
	public List<UserDTO> findAllByUsername(@PathVariable("key") String key) {
		return userService.findAllByUsername(key);
	}
	
	@GetMapping(value = "/api/user/search/total_pages")
	public Integer getTotalPagesByUsername(@RequestParam("key") String key, @RequestParam("page") Integer page, 
								 			@RequestParam("limit") Integer limit) {
		return userService.getTotalPagesByUsername(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/user/search/list")
	public List<UserDTO> findAllByUsername(@RequestParam("key") String key, @RequestParam("page") Integer page, 
											@RequestParam("limit") Integer limit) {
		return userService.findAllByUsername(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/user/flag_delete/{flagDelete}/search/{key}")
	public List<UserDTO> findAllByFlagDeleteAndUsername(@PathVariable("flagDelete") Boolean flagDelete, @PathVariable("key") String key) {
		return userService.findAllByFlagDeleteAndUsername(flagDelete, key);
	}
	
	@GetMapping(value = "/api/user/flag_delete/search/total_pages")
	public Integer getTotalPagesByFlagDeleteAndUsername(@RequestParam("key") String key, @RequestParam("flag_delete") Boolean flagDelete, 
														@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return userService.getTotalPagesByFlagDeleteAndUsername(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/user/flag_delete/search/list")
	public List<UserDTO> findAllByFlagDeleteAndUsername(@RequestParam("key") String key, @RequestParam("flag_delete") Boolean flagDelete,
														@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return userService.findAllByFlagDeleteAndUsername(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/user/id/{id}")
	public UserDTO findOne(@PathVariable("id") Long id) {
		return userService.findOne(id);
	}
	
	@GetMapping(value = "/api/user/username/{username}")
	public UserDTO findOne(@PathVariable("username") String username) {
		return userService.findOne(username);
	}
	
	@PostMapping(value = "/api/user/insert")
	public Boolean insert(@RequestBody UserDTO userDTO) {
		return userService.insert(userDTO);
	}
	
	@PutMapping(value = "/api/user/update")
	public Boolean update(@RequestBody UserDTO userDTO, @RequestParam("id") Long id) {
		userDTO.setId(id);
		
		return userService.update(userDTO);
	}
	
	@DeleteMapping(value = "/api/user/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return userService.delete(id);
	}
	
	
}
