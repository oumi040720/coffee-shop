package com.fpoly.coffeeshop.service;

import java.util.List;
import java.util.Date;

import com.fpoly.coffeeshop.dto.InputDetailDTO;

public interface IInputDetailService {
	

	public List<InputDetailDTO> findAll();
	

	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete);

	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);

	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);

	
	public List<InputDetailDTO> findAllByInputDate(Date inputDate);
	
	public Integer getTotalPagesByInputDate(Date inputDate, Integer page, Integer limit);

	public List<InputDetailDTO> findAllByInputDate(Date inputDate, Integer page, Integer limit);
	
	
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(Boolean flagDelete, Date inputDate);
	
	public Integer getTotalPagesByFlagDeleteAndInputDate(Boolean flagDelete, Date inputDate, Integer page, Integer limit);
	
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(Boolean flagDelete, Date inputDate, Integer page, Integer limit);
	
	
	public InputDetailDTO findOne(Long id);
	
	public InputDetailDTO findOne(Date input);
	
	public Boolean insert(InputDetailDTO inputDTO);
	
	public Boolean update(InputDetailDTO inputdetailDTO);
	
	public Boolean delete(Long id);
}
