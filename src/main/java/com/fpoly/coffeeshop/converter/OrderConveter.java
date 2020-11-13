package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.entity.OrderEntity;

@Component
public class OrderConveter {

	public OrderDTO convertToDTO(OrderEntity entity) {
		OrderDTO dto = new OrderDTO();
		dto.setId(entity.getId());
		dto.setOrderCode(entity.getOrderCode());
		dto.setOrderDate(entity.getOrderDate());
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

	public OrderEntity convertToEntity(OrderDTO dto) {
		OrderEntity entity = new OrderEntity();
		entity.setId(dto.getId());
		entity.setOrderCode(dto.getOrderCode());
		entity.setOrderDate(dto.getOrderDate());
		entity.setStatus(dto.getStatus());
		entity.setAddress(dto.getAddress());
		entity.setPhone(dto.getPhone());
		entity.setTotalPrice(dto.getTotalPrice());
		entity.setNote(dto.getNote());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
	
	public OrderEntity convertToEntity(OrderDTO dto,  OrderEntity entity) {
		entity.setId(dto.getId());
		entity.setOrderCode(dto.getOrderCode());
		entity.setOrderDate(dto.getOrderDate());
		entity.setStatus(dto.getStatus());
		entity.setAddress(dto.getAddress());
		entity.setPhone(dto.getPhone());
		entity.setTotalPrice(dto.getTotalPrice());
		entity.setNote(dto.getNote());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
}
