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

import com.fpoly.coffeeshop.dto.RoleDTO;
import com.fpoly.coffeeshop.service.IRoleService;

@RestController
public class RoleAPI {

	@Autowired
	private IRoleService roleService;
	
	@GetMapping(value = "/api/role/list")
	public List<RoleDTO> findAll() {
		return roleService.findAll();
	}
	
	@GetMapping(value = "/api/role/list/flag_delete/{flag_delete}")
	public List<RoleDTO> findAll(@PathVariable("flag_delete") boolean flagDelete) {
		return roleService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/role/id/{id}")
	public RoleDTO findOne(@PathVariable("id") Integer id) {
		return roleService.findOne(id);
	}
	
	@GetMapping(value = "/api/role/role_code/{roleCode}")
	public RoleDTO findOne(@PathVariable("roleCode") String roleCode) {
		return roleService.findOne(roleCode);
	}
	
	@PostMapping(value = "/api/role/insert")
	public Boolean insert(@RequestBody RoleDTO roleDTO) {
		return roleService.insert(roleDTO);
	}
	
	@PutMapping(value = "/api/role/update")
	public Boolean update(@RequestBody RoleDTO roleDTO, @RequestParam("id") Integer id) {
		roleDTO.setId(id);
		
		return roleService.update(roleDTO);
	}
	
	@DeleteMapping(value = "/api/role/delete")
	public Boolean delete(@RequestParam("id") Integer id) {
		return roleService.delete(id);
	}
	
}
