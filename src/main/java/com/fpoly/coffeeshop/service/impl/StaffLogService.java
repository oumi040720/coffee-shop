package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.StaffLogConverter;
import com.fpoly.coffeeshop.dto.StaffLogDTO;
import com.fpoly.coffeeshop.entity.StaffLogEntity;
import com.fpoly.coffeeshop.repository.IStaffLogRepository;
import com.fpoly.coffeeshop.service.IStaffLogService;

@Service
public class StaffLogService implements IStaffLogService {

	@Autowired
	private IStaffLogRepository staffLogRepository;
	
	@Autowired
	private StaffLogConverter staffLogConverter;
	
	@Override
	public List<StaffLogDTO> findAll() {
		List<StaffLogEntity> list = staffLogRepository.findAll();
		List<StaffLogDTO> result = new ArrayList<>();
		
		for (StaffLogEntity staffLog : list) {
			result.add(staffLogConverter.convertToDTO(staffLog));
		}
		
		return result;
	}

	@Override
	public List<StaffLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete) {
		List<StaffLogEntity> list = staffLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete);
		List<StaffLogDTO> result = new ArrayList<>();
		
		for (StaffLogEntity staffLog : list) {
			result.add(staffLogConverter.convertToDTO(staffLog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit) {
		return staffLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<StaffLogDTO> findAllByOldFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<StaffLogEntity> list = staffLogRepository.findAllByOldFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getContent();
		List<StaffLogDTO> result = new ArrayList<>();
		
		for (StaffLogEntity staffLog : list) {
			result.add(staffLogConverter.convertToDTO(staffLog));
		}
		
		return result;
	}

	@Override
	public List<StaffLogDTO> findAllByStaffID(Long staffID) {
		List<StaffLogEntity> list = staffLogRepository.findAllByStaffID(staffID);
		List<StaffLogDTO> result = new ArrayList<>();
		
		for (StaffLogEntity staffLog : list) {
			result.add(staffLogConverter.convertToDTO(staffLog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByStaffID(Long staffID, Integer page, Integer limit) {
		return staffLogRepository.findAllByStaffID(staffID, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<StaffLogDTO> findAllByStaffID(Long staffID, Integer page, Integer limit) {
		List<StaffLogEntity> list = staffLogRepository.findAllByStaffID(staffID, PageRequest.of(page, limit))
														.getContent();
		List<StaffLogDTO> result = new ArrayList<>();
		
		for (StaffLogEntity staffLog : list) {
			result.add(staffLogConverter.convertToDTO(staffLog));
		}
		
		return result;
	}

	@Override
	public List<StaffLogDTO> findAllByOldFlagDeleteAndStaffID(Boolean oldFlagDelete, Long staffID) {
		List<StaffLogEntity> list = staffLogRepository.findAllByOldFlagDeleteIsAndStaffID(oldFlagDelete, staffID);
		List<StaffLogDTO> result = new ArrayList<>();
		
		for (StaffLogEntity staffLog : list) {
			result.add(staffLogConverter.convertToDTO(staffLog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByOldFlagDeleteAndStaffID(Boolean oldFlagDelete, Long staffID, Integer page, Integer limit) {
		return staffLogRepository.findAllByOldFlagDeleteIsAndStaffID(oldFlagDelete, staffID, PageRequest.of(page, limit))
									.getTotalPages();
	}

	@Override
	public List<StaffLogDTO> findAllByOldFlagDeleteAndStaffID(Boolean oldFlagDelete, Long staffID, Integer page, Integer limit) {
		List<StaffLogEntity> list = staffLogRepository.findAllByOldFlagDeleteIsAndStaffID(oldFlagDelete, staffID, PageRequest.of(page, limit))
														.getContent();
		List<StaffLogDTO> result = new ArrayList<>();
		
		for (StaffLogEntity staffLog : list) {
			result.add(staffLogConverter.convertToDTO(staffLog));
		}
		
		return result;
	}

	@Override
	public Boolean insert(StaffLogDTO staffLogDTO) {
		try {
			StaffLogEntity result = staffLogRepository.save(staffLogConverter.convertToEntity(staffLogDTO));
			
			if (result != null) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public Boolean delete(Long id) {
		try {
			staffLogRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
