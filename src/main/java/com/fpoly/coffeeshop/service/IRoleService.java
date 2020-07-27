package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.RoleDTO;

public interface IRoleService {

	public List<RoleDTO> findAll();
	
	public List<RoleDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public RoleDTO findOne(Integer id);
	
	public RoleDTO findOne(String roleCode);
	
	public Boolean insert(RoleDTO roleDTO);
	
	public Boolean update(RoleDTO roleDTO);
	
	public Boolean delete(Integer id);
	
}
