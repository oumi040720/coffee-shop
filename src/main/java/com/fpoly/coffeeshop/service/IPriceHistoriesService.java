package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.PriceHistoriesDTO;


public interface IPriceHistoriesService {
	
	public List<PriceHistoriesDTO> findAll();
	
	
	public List<PriceHistoriesDTO> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<PriceHistoriesDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit);
	
	public PriceHistoriesDTO findOne(Integer id);
	
	public Boolean insert(PriceHistoriesDTO priceHistoriesDTO);
	
	public Boolean update(PriceHistoriesDTO priceHistoriesDTO);
	
	public Boolean delete(Integer id);
}
