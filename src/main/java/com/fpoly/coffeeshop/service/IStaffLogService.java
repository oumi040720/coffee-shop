package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.StaffLogDTO;

public interface IStaffLogService {

	public List<StaffLogDTO> findAll();
	
	
	public List<StaffLogDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);

	public List<StaffLogDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	
	public List<StaffLogDTO> findAllByStaffID(Long staffID);
	
	public Integer getTotalPagesByStaffID(Long staffID, Integer page, Integer limit);

	public List<StaffLogDTO> findAllByStaffID(Long staffID, Integer page, Integer limit);
	
	
	public List<StaffLogDTO> findAllByFlagDeleteAndStaffID(Boolean flagDelete, Long staffID);
	
	public Integer getTotalPagesByFlagDeleteAndStaffID(Boolean flagDelete, Long staffID, Integer page, Integer limit);

	public List<StaffLogDTO> findAllByFlagDeleteAndStaffID(Boolean flagDelete, Long staffID, Integer page, Integer limit);
	
	
	public Boolean insert(StaffLogDTO staffLogDTO);
	
	public Boolean delete(Long id);
	
}
