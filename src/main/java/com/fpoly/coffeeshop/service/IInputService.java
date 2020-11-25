package com.fpoly.coffeeshop.service;
import java.util.List;

import com.fpoly.coffeeshop.dto.InputDTO;

public interface IInputService {
	
	public List<InputDTO> findAll();
	
	public List<InputDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<InputDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	public InputDTO findOne(Long id);
	
	public InputDTO insert(InputDTO inputDTO);
	
	public Boolean  update(InputDTO inputDTO);
	
	public Boolean delete(Long id);
}
