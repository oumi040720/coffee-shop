package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.InputLogDTO;
import com.fpoly.coffeeshop.entity.InputLogEntity;

@Component
public class InputLogConveter {

	public InputLogDTO convertToDTO(InputLogEntity entity) {
		InputLogDTO dto = new InputLogDTO();
		dto.setId(entity.getId());
		dto.setCreatedBy(entity.getCreatedBy());
		dto.setCreatedDate(entity.getCreatedDate());
		dto.setModifiedBy(entity.getModifiedBy());
		dto.setModifiedDate(entity.getModifiedDate());
		dto.setOldCustomerID(entity.getOldCustomerId());
		dto.setOldFlagDelete(entity.getOldFlagDelete());
		dto.setOldProductID(entity.getOldMenuId());
		dto.setOldInputCode(entity.getOldInputCode());
		dto.setOldInputDate(entity.getOldInputDate());
		dto.setInputID(entity.getInputID());
		dto.setInputDetailID(entity.getInputDetailId());
		dto.setOldQuantity(entity.getOldQuantity());
		dto.setOldStatus(entity.getOldStatus());
		return dto;
	}
	
	public InputLogEntity convertToEntity(InputLogDTO dto) {
		InputLogEntity entity = new InputLogEntity();
		entity.setId(dto.getId());
		entity.setCreatedBy(dto.getCreatedBy());
		entity.setCreatedDate(dto.getCreatedDate());
		entity.setModifiedBy(dto.getModifiedBy());
		entity.setModifiedDate(dto.getModifiedDate());
		entity.setOldCustomerId(dto.getOldCustomerID());
		entity.setOldFlagDelete(dto.getOldFlagDelete());
		entity.setOldMenuId(dto.getOldProductID());
		entity.setOldInputCode(dto.getOldInputCode());
		entity.setOldInputDate(dto.getOldInputDate());
		entity.setInputId(dto.getInputID());
		entity.setInputDetailId(dto.getInputDetailID());
		entity.setOldQuantity(dto.getOldQuantity());
		entity.setOldStatus(dto.getOldStatus());
		return entity;
	}
	public InputLogEntity convertToEntity(InputLogDTO dto, InputLogEntity entity) {
		entity.setId(dto.getId());
		entity.setCreatedBy(dto.getCreatedBy());
		entity.setCreatedDate(dto.getCreatedDate());
		entity.setModifiedBy(dto.getModifiedBy());
		entity.setModifiedDate(dto.getModifiedDate());
		entity.setOldCustomerId(dto.getOldCustomerID());
		entity.setOldFlagDelete(dto.getOldFlagDelete());
		entity.setOldMenuId(dto.getOldProductID());
		entity.setOldInputCode(dto.getOldInputCode());
		entity.setOldInputDate(dto.getOldInputDate());
		entity.setInputDetailId(dto.getInputDetailID());
		entity.setInputId(dto.getInputID());
		entity.setOldQuantity(dto.getOldQuantity());
		entity.setOldStatus(dto.getOldStatus());
		return entity;
	}
}
