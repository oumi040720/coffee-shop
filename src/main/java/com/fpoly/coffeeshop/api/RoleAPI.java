package com.fpoly.coffeeshop.api;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	public List<RoleDTO> findAll(@PathParam("flag_delete") boolean flagDelete) {
		return roleService.findAllByFlagDelete(flagDelete);
	}
	
}
