package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.InputDTO;

public interface IInputService {
	
		public List<InputDTO> findAll();
  
  		 public List<InputDTO> findAllbyFlagDelete(Boolean flagDelete);
  		
  		 public InputDTO findOne(Long id);
  		 
  		 public InputDTO findOne(String inputName);
  		 
  		 public Boolean insert(InputDTO inputDTO);
  		 
  		 public Boolean update(InputDTO inputDTO);
  		 
  		 public Boolean delete(Long id);
  		 
}
