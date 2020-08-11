package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.OrderLogDTO;
import com.fpoly.coffeeshop.entity.OrderLogEntity;

@Component
public class OrderLogConveter {

	public OrderLogDTO convertToDTO(OrderLogEntity entity) {
		OrderLogDTO dto = new OrderLogDTO();
		dto.setId(entity.getId());
		dto.setCreatedBy(entity.getCreatedBy());
		dto.setCreatedDate(entity.getCreatedDate());
		dto.setModifiedBy(entity.getModifiedBy());
		dto.setModifiedDate(entity.getModifiedDate());
		dto.setOldCustomerID(entity.getOldCustomerId());
		dto.setOldFlagDelete(entity.getOldFlagDelete());
		dto.setOldMenuID(entity.getOldMenuId());
		dto.setOldOrderCode(entity.getOldOrderCode());
		dto.setOldOrderDate(entity.getOldOrderDate());
		dto.setOrderID(entity.getOrderID());
		dto.setOrderDetailID(entity.getOrderDetailId());
		dto.setOldQuantity(entity.getOldQuantity());
		dto.setOldStatus(entity.getOldStatus());
		return dto;
	}
	
	public OrderLogEntity convertToEntity(OrderLogDTO dto) {
		OrderLogEntity entity = new OrderLogEntity();
		entity.setId(dto.getId());
		entity.setCreatedBy(dto.getCreatedBy());
		entity.setCreatedDate(dto.getCreatedDate());
		entity.setModifiedBy(dto.getModifiedBy());
		entity.setModifiedDate(dto.getModifiedDate());
		entity.setOldCustomerId(dto.getOldCustomerID());
		entity.setOldFlagDelete(dto.getOldFlagDelete());
		entity.setOldMenuId(dto.getOldMenuID());
		entity.setOldOrderCode(dto.getOldOrderCode());
		entity.setOldOrderDate(dto.getOldOrderDate());
		entity.setOrderId(dto.getOrderID());
		entity.setOrderDetailId(dto.getOrderDetailID());
		entity.setOldQuantity(dto.getOldQuantity());
		entity.setOldStatus(dto.getOldStatus());
		return entity;
	}
	public OrderLogEntity convertToEntity(OrderLogDTO dto, OrderLogEntity entity) {
		entity.setId(dto.getId());
		entity.setCreatedBy(dto.getCreatedBy());
		entity.setCreatedDate(dto.getCreatedDate());
		entity.setModifiedBy(dto.getModifiedBy());
		entity.setModifiedDate(dto.getModifiedDate());
		entity.setOldCustomerId(dto.getOldCustomerID());
		entity.setOldFlagDelete(dto.getOldFlagDelete());
		entity.setOldMenuId(dto.getOldMenuID());
		entity.setOldOrderCode(dto.getOldOrderCode());
		entity.setOldOrderDate(dto.getOldOrderDate());
		entity.setOrderDetailId(dto.getOrderDetailID());
		entity.setOrderId(dto.getOrderID());
		entity.setOldQuantity(dto.getOldQuantity());
		entity.setOldStatus(dto.getOldStatus());
		return entity;
	}
}
