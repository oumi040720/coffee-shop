package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.InputDetailDTO;

public interface IInputDetailService {

	public List<InputDetailDTO> findAll();
	
	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	public InputDetailDTO findOne(Long id);
	
	public Boolean insert(InputDetailDTO inputDTO);
	
	public Boolean  update(InputDetailDTO inputDTO);
	
	public Boolean delete(Long id);
}
