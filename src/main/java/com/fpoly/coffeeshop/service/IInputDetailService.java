package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.InputDetailDTO;

public interface IInputDetailService {
	

	public List<InputDetailDTO> findAll();
	

	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete);

	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);

	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);

	
	public List<InputDetailDTO> findAllByInputDate(String input_id);
	
	public Integer getTotalPagesByInputDate(String inputDate, Integer page, Integer limit);

	public List<InputDetailDTO> findAllByInputDate(String inputDate, Integer page, Integer limit);
	
	
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(Boolean flagDelete, String inputDate);
	
	public Integer getTotalPagesByFlagDeleteAndInputDate(Boolean flagDelete, String inputDate, Integer page, Integer limit);
	
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(Boolean flagDelete, String inputDate, Integer page, Integer limit);
	
	
	public InputDetailDTO findOne(Integer id);
	
	public InputDetailDTO findOne(String input);
	
	public Boolean insert(InputDetailDTO inputDTO);
	
	public Boolean update(InputDetailDTO inputdetailDTO);
	
	public Boolean delete(Integer id);
}
