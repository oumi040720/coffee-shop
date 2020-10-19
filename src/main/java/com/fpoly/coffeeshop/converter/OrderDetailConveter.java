package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.entity.OrderDetailEntity;

@Component
public class OrderDetailConveter {

	public OrderDetailDTO convertToDTO(OrderDetailEntity entity) {
		OrderDetailDTO dto = new OrderDetailDTO();
		dto.setId(entity.getId());
		dto.setQuantity(entity.getQuantity());
		dto.setProduct(entity.getProduct().getProductName());
		dto.setOrder(entity.getOrder().getOrderCode());
		dto.setPrice(entity.getPrice());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;
	}

	public OrderDetailEntity convertToEntity(OrderDetailDTO dto) {
		OrderDetailEntity entity = new OrderDetailEntity();
		entity.setId(dto.getId());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
	
	public OrderDetailEntity convertToEntity(OrderDetailDTO dto, OrderDetailEntity entity) {
		entity.setId(dto.getId());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
}
