package com.fpoly.coffeeshop.converter;

import com.fpoly.coffeeshop.dto.StaffLogDTO;
import com.fpoly.coffeeshop.entity.StaffLogEntity;

public class StaffLogConverter {

	public StaffLogDTO convertToDTO(StaffLogEntity entity) {
		StaffLogDTO dto = new StaffLogDTO();
		dto.setId(entity.getId());
		dto.setCreatedDate(entity.getCreatedDate());
		dto.setCreatedBy(entity.getCreatedBy());
		dto.setModifiedDate(entity.getModifiedDate());
		dto.setModifiedBy(entity.getModifiedBy());
		dto.setOldFullname(entity.getOldFullname());
		dto.setOldBirthday(entity.getOldBirthday());
		dto.setOldEmail(entity.getOldEmail());
		dto.setOldPhone(entity.getOldPhone());
		dto.setOldAddress(entity.getOldAddress());
		dto.setOldPhoto(entity.getOldPhoto());
		dto.setOldStaffID(entity.getOldStaffID());
		dto.setOldUserID(entity.getOldUserID());
		dto.setOldUsername(entity.getOldUsername());
		dto.setOldFlagDelete(entity.getOldFlagDelete());
		
		return dto;
	}
	
	public StaffLogEntity convertToEntity(StaffLogDTO dto) {
		StaffLogEntity entity = new StaffLogEntity();
		entity.setId(dto.getId());
		entity.setCreatedDate(dto.getCreatedDate());
		entity.setCreatedBy(dto.getCreatedBy());
		entity.setModifiedDate(dto.getModifiedDate());
		entity.setModifiedBy(dto.getModifiedBy());
		entity.setOldFullname(dto.getOldFullname());
		entity.setOldBirthday(dto.getOldBirthday());
		entity.setOldEmail(dto.getOldEmail());
		entity.setOldPhone(dto.getOldPhone());
		entity.setOldAddress(dto.getOldAddress());
		entity.setOldPhoto(dto.getOldPhoto());
		entity.setOldStaffID(dto.getOldStaffID());
		entity.setOldUserID(dto.getOldUserID());
		entity.setOldUsername(dto.getOldUsername());
		entity.setOldFlagDelete(dto.getOldFlagDelete());
		
		return entity;
	}
	
}
