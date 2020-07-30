package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.StaffDTO;

public interface IStaffService {

	public List<StaffDTO> findAll();

	
	public List<StaffDTO> findAllByFlagDelete(Boolean flagDelete);

	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);

	public List<StaffDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);

	
	public List<StaffDTO> findAllByKey(String key);

	public Integer getTotalPagesByKey(String key, Integer page, Integer limit);

	public List<StaffDTO> findAllByKey(String key, Integer page, Integer limit);
	
	
	public List<StaffDTO> findAllByFlagDeleteAndKey(Boolean flagDelete, String key);

	public Integer getTotalPagesByFlagDeleteAndKey(Boolean flagDelete, String key, Integer page, Integer limit);

	public List<StaffDTO> findAllByFlagDeleteAndKey(Boolean flagDelete, String key, Integer page, Integer limit);
	
	
	public StaffDTO findOne(Long id);
	
	
	public Boolean insert(StaffDTO userDTO);
	
	public Boolean update(StaffDTO userDTO);

	public Boolean delete(Long id);
	
}
