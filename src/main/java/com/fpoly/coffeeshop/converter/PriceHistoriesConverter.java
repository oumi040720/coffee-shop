package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.PriceHistoriesDTO;
import com.fpoly.coffeeshop.entity.PriceHistoriesEntity;

@Component
public class PriceHistoriesConverter {
	
	public PriceHistoriesDTO converToDTO(PriceHistoriesEntity entity) {
		
		PriceHistoriesDTO dto = new PriceHistoriesDTO();
		dto.setId(entity.getId());
		dto.setStarDate(entity.getStartDate());
		dto.setEndDate(entity.getEndDate());
		dto.setPrice(entity.getPrice());
		dto.setFlagDelete(entity.getFlagDelete());
		
		return dto;
	}
	
	public PriceHistoriesEntity convertToEntity(PriceHistoriesDTO dto) {
		
		PriceHistoriesEntity entity = new PriceHistoriesEntity();
		entity.setId(dto.getId());
		entity.setStartDate(dto.getStarDate());
		entity.setEndDate(dto.getEndDate());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());

		return entity;
	}
	
	public PriceHistoriesEntity convertToEntity(PriceHistoriesDTO dto, PriceHistoriesEntity entity) {
		
		entity.setId(dto.getId());
		entity.setStartDate(dto.getStarDate());
		entity.setEndDate(dto.getStarDate());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
	
}
