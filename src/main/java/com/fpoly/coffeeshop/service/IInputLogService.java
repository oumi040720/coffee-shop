package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.InputLogDTO;

public interface IInputLogService {
	
	public List<InputLogDTO> findAll();
	
	
	public List<InputLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete);
	
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit);
	
	public List<InputLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete, Integer page, Integer limit);
	
	
	public List<InputLogDTO> findAllByInputID(Long orderID);
	
	public Integer getTotalPagesByInputID(Long inputID, Integer page, Integer limit); 
	
	public List<InputLogDTO> findAllByInputID(Long inputID, Integer page, Integer limit);
	
	
	public List<InputLogDTO> findAllByOldFlagDeleteAndInputID(Boolean oldFlagDelete, Long inputID);
	
	public Integer getTotalPagesByOldFlagDeleteAndInputID(Boolean oldFlagDelete, Long inputID, Integer page, Integer limit);
	
	public List<InputLogDTO> findAllByOldFlagDeleteAndInputID(Boolean oldFlagDelete, Long inputID, Integer page, Integer limit);
	

	
	public Boolean insert(InputLogDTO InputLogDTO);
	
	public Boolean delete(Long id);

}
