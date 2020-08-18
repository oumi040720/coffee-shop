package com.fpoly.coffeeshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.PriceHistoriesConverter;
import com.fpoly.coffeeshop.dto.MenuDTO;
import com.fpoly.coffeeshop.repository.IPriceHistoriesRepository;
import com.fpoly.coffeeshop.service.IPriceHistoriesService;

@Service
public class PriceHistoriesService implements IPriceHistoriesService {
	
	@Autowired
	private IPriceHistoriesRepository priceHistoriesRepository;
	
	@Autowired
	private PriceHistoriesConverter priceHistoriesConverter;
	
	@Override
	public List<MenuDTO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MenuDTO> findAllByFlagDeleteIs(Boolean flagDelete) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MenuDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public MenuDTO findOne(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Boolean insert(MenuDTO menuDTO) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Boolean update(MenuDTO menuDTO) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
}
