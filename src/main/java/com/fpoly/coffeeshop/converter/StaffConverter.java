package com.fpoly.coffeeshop.converter;

import com.fpoly.coffeeshop.dto.StaffDTO;
import com.fpoly.coffeeshop.entity.StaffEntity;

public class StaffConverter {

	public StaffDTO convertToDTO(StaffEntity entity) {
		StaffDTO dto = new StaffDTO();
		dto.setId(entity.getId());
		dto.setFullname(entity.getFullname());
		dto.setBirthday(entity.getBirthday());
		dto.setEmail(entity.getEmail());
		dto.setPhone(entity.getPhone());
		dto.setAddress(entity.getAddress());
		dto.setPhoto(entity.getPhoto());
		dto.setUsername(entity.getUser().getUsername());
		dto.setFlagDelete(entity.getFlagDelete());
		
		return dto;
	}
	
	public StaffEntity convertToEntity(StaffDTO dto) {
		StaffEntity entity = new StaffEntity();
		entity.setId(dto.getId());
		entity.setFullname(dto.getFullname());
		entity.setBirthday(dto.getBirthday());
		entity.setEmail(dto.getEmail());
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity.setPhoto(dto.getPhoto());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
	
	public StaffEntity convertToEntity(StaffDTO dto, StaffEntity entity) {
		entity.setId(dto.getId());
		entity.setFullname(dto.getFullname());
		entity.setBirthday(dto.getBirthday());
		entity.setEmail(dto.getEmail());
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity.setPhoto(dto.getPhoto());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
	
}
