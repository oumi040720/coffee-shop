package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.UnitDTO;

public interface IUnitService {
	
		public List<UnitDTO> findAll();
  
  		 public List<UnitDTO> findAllbyFlagDelete(Boolean flagDelete);
  		
  		 public UnitDTO findOne(Long id);
  		 
  		 public UnitDTO findOne(String unitName);
  		 
  		 public Boolean insert(UnitDTO unitDTO);
  		 
  		 public Boolean update(UnitDTO unitDTO);
  		 
  		 public Boolean delete(Long id);
  		 
}
