package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.entity.InputEntity;

@Component
public class InputConveter {

	public InputDTO convertToDTO(InputEntity entity) {
		InputDTO dto = new InputDTO();
		dto.setId(entity.getId());
		dto.setInputCode(entity.getInputCode());
		dto.setInputDate(entity.getInputDate());
		dto.setStatus(entity.getStatus());
		dto.setAddress(entity.getAddress());
		dto.setPhone(entity.getPhone());
		dto.setTotalPrice(entity.getTotalPrice());
		dto.setNote(entity.getNote());
		dto.setFlagDelete(entity.getFlagDelete());
		if(entity.getCoupon() != null){
		dto.setCouponCode(entity.getCoupon().getCouponCode());
		}
		if(entity.getCustomer() != null) {		
			dto.setFullname(entity.getCustomer().getFullname());
		}
		return dto;
	}

	public InputEntity convertToEntity(InputDTO dto) {
		InputEntity entity = new InputEntity();
		entity.setId(dto.getId());
		entity.setInputCode(dto.getInputCode());
		entity.setInputDate(dto.getInputDate());
		entity.setStatus(dto.getStatus());
		entity.setAddress(dto.getAddress());
		entity.setPhone(dto.getPhone());
		entity.setTotalPrice(dto.getTotalPrice());
		entity.setNote(dto.getNote());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
	
	public InputEntity convertToEntity(InputDTO dto,  InputEntity entity) {
		entity.setId(dto.getId());
		entity.setInputCode(dto.getInputCode());
		entity.setInputDate(dto.getInputDate());
		entity.setStatus(dto.getStatus());
		entity.setAddress(dto.getAddress());
		entity.setPhone(dto.getPhone());
		entity.setTotalPrice(dto.getTotalPrice());
		entity.setNote(dto.getNote());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
}
