package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.InputDTO;

public interface IInputService {

	public List<InputDTO> findAll();
	
	
	public List<InputDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<InputDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	
	public List<InputDTO> findAllByInputCode(String key);
	
	public Integer getTotalPagesByInputCode(String key, Integer page, Integer limit); 
	
	public List<InputDTO> findAllByInputCode(String key, Integer page, Integer limit);
	
	
	public List<InputDTO> findAllByFlagDeleteAndInputCode(Boolean flagDelete, String key);
	
	public Integer getTotalPagesByFlagDeleteAndInputCode(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public List<InputDTO> findAllByFlagDeleteAndInputCode(Boolean flagDelete, String key, Integer page, Integer limit);
	
	
	public Integer getTotalPagesByFlagDeleteAndUsername(Boolean flagDelete, String username, Integer page, Integer limit);
	
	public List<InputDTO> findAllByFlagDeleteAndUsername(Boolean flagDelete, String username, Integer page, Integer limit);
	
	
	public InputDTO findOne(Long id);
	
	public InputDTO findOne(String inputCode);
	
	public Boolean insert(InputDTO customerDTO, String username);
	
	public Boolean update(InputDTO inputDTO);
	
	public Boolean delete(Long id);
	
	
	
	public List<Long[]> getInputDetailStatistic(Integer year, Integer month);
	
	
	public List<Object[]> getTop4BestSeller();
	
	
	public List<Object[]> getSalesEveryYear();
	
	public List<Object[]> getSalesEveryMonthByYear(Integer year);

	public List<Object[]> getSalesEveryDayByYearAndMonth(Integer year, Integer month);
	
	
	public List<Object[]> getSalesRateEveryMotnhInYear(Integer year);
	
	public List<Object[]> getSalesRateEveryDayInMonthOfYear(Integer year, Integer month);
	
}

