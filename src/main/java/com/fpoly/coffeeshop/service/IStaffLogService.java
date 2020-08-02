package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.StaffLogDTO;

public interface IStaffLogService {

	public List<StaffLogDTO> findAll();
	
	
	public List<StaffLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete);
	
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit);

	public List<StaffLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete, Integer page, Integer limit);
	
	
	public List<StaffLogDTO> findAllByStaffID(Long staffID);
	
	public Integer getTotalPagesByStaffID(Long staffID, Integer page, Integer limit);

	public List<StaffLogDTO> findAllByStaffID(Long staffID, Integer page, Integer limit);
	
	
	public List<StaffLogDTO> findAllByOldFlagDeleteAndStaffID(Boolean oldFlagDelete, Long staffID);
	
	public Integer getTotalPagesByOldFlagDeleteAndStaffID(Boolean oldFlagDelete, Long staffID, Integer page, Integer limit);

	public List<StaffLogDTO> findAllByOldFlagDeleteAndStaffID(Boolean oldFlagDelete, Long staffID, Integer page, Integer limit);
	
	
	public Boolean insert(StaffLogDTO staffLogDTO);
	
	public Boolean delete(Long id);
	
}
