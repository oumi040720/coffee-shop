package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.RoleDTO;
import com.fpoly.coffeeshop.entity.RoleEntity;

@Component
public class RoleConveter {

	public RoleDTO convertToDTO(RoleEntity entity) {
		RoleDTO dto = new RoleDTO();
		dto.setId(entity.getId());
		dto.setRoleName(entity.getRoleName());
		dto.setRoleCode(entity.getRoleCode());
		dto.setFlagDelete(entity.getFlagDelete());
		
		return dto;
	}
	
	public RoleEntity convertToEntity(RoleDTO dto) {
		RoleEntity entity = new RoleEntity();
		entity.setId(dto.getId());
		entity.setRoleName(dto.getRoleName());
		entity.setRoleCode(dto.getRoleCode());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
	
	public RoleEntity convertToEntity(RoleDTO dto, RoleEntity entity) {
		entity.setId(dto.getId());
		entity.setRoleName(dto.getRoleName());
		entity.setRoleCode(dto.getRoleCode());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
	
}
