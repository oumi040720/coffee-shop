package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.InputDetailDTO;

public interface IInputDetailService {
	

	public List<InputDetailDTO> findAll();
	

	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete);

	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);

	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);

	
	public List<InputDetailDTO> findAllByInputCode(String InputCode);
	
	public Integer getTotalPagesByInputCode(String InputCode, Integer page, Integer limit);

	public List<InputDetailDTO> findAllByInputCode(String InputCode, Integer page, Integer limit);
	
	
	public List<InputDetailDTO> findAllByFlagDeleteAndInputCode(Boolean flagDelete, String InputCode);
	
	public Integer getTotalPagesByFlagDeleteAndInputCode(Boolean flagDelete, String InputCode, Integer page, Integer limit);
	
	public List<InputDetailDTO> findAllByFlagDeleteAndInputCode(Boolean flagDelete, String InputCode, Integer page, Integer limit);
	
	
	public InputDetailDTO findOne(Long id);
	
	public InputDetailDTO findOne(String Input);
	
	public Boolean insert(InputDetailDTO InputDTO);
	
	public Boolean update(InputDetailDTO InputdetailDTO);
	
	public Boolean delete(Long id);
}
