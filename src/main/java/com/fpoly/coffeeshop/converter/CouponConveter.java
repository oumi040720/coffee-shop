package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.CouponDTO;
import com.fpoly.coffeeshop.entity.CouponEntity;

@Component
public class CouponConveter {
	 
	 public CouponDTO convertToDTO(CouponEntity entity) {
		 CouponDTO dto = new CouponDTO();
		 dto.setId(entity.getId());
		 dto.setCouponCode(entity.getCouponCode());
		 dto.setDiscount(entity.getDiscount());
		 dto.setMinTotalBill(entity.getMinTotalBill());
		 dto.setMaxDiscount(entity.getMaxDiscount());
		 dto.setStartTime(entity.getStartTime());
		 dto.setEndTime(entity.getEndTime());
		 dto.setType(entity.getType());
		 dto.setFlagDelete(entity.getFlagDelete());
		 
		 return dto;
	 }
	 
	 public CouponEntity convertToEntity(CouponDTO dto) {
		 CouponEntity entity = new CouponEntity();
		 entity.setId(dto.getId());
		 entity.setCouponCode(dto.getCouponCode());
		 entity.setDiscount(dto.getDiscount());
		 entity.setMinTotalBill(dto.getMinTotalBill());
		 entity.setMaxDiscount(dto.getMaxDiscount());
		 entity.setStartTime(dto.getStartTime());
		 entity.setEndTime(dto.getEndTime());
		 entity.setType(dto.getType());
		 entity.setFlagDelete(dto.getFlagDelete());
		 
		 return entity;
	 }
	 
	 public CouponEntity convertToEntity(CouponDTO dto, CouponEntity entity) {
		 entity.setId(dto.getId());
		 entity.setCouponCode(dto.getCouponCode());
		 entity.setDiscount(dto.getDiscount());
		 entity.setMinTotalBill(dto.getMinTotalBill());
		 entity.setMaxDiscount(dto.getMaxDiscount());
		 entity.setStartTime(dto.getStartTime());
		 entity.setEndTime(dto.getEndTime());
		 entity.setType(dto.getType());
		 entity.setFlagDelete(dto.getFlagDelete());
		 
		 return entity;
	 }
	 
}
