package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.RoleDTO;

public interface IRoleService {

	public List<RoleDTO> findAll();
	
	public List<RoleDTO> findAllByFlagDelete(Boolean flagDelete);
	
}
