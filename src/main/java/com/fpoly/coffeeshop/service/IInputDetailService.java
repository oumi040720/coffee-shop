package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.InputDetailDTO;

public interface IInputDetailService {
	

	public List<InputDetailDTO> findAll();
	

	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete);

	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);

	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);

	
	public List<InputDetailDTO> findAllByInputId(String input_id);
	
	public Integer getTotalPagesByInputId(String inputId, Integer page, Integer limit);

	public List<InputDetailDTO> findAllByInputId(String inputId, Integer page, Integer limit);
	
	
	public List<InputDetailDTO> findAllByFlagDeleteAndInputId(Boolean flagDelete, String inputId);
	
	public Integer getTotalPagesByFlagDeleteAndInputId(Boolean flagDelete, String inputId, Integer page, Integer limit);
	
	public List<InputDetailDTO> findAllByFlagDeleteAndInputId(Boolean flagDelete, String inputId, Integer page, Integer limit);
	
	
	public InputDetailDTO findOne(Long id);
	
	public InputDetailDTO findOne(String input);
	
	public Boolean insert(InputDetailDTO inputDTO);
	
	public Boolean update(InputDetailDTO inputdetailDTO);
	
	public Boolean delete(Long id);
}
