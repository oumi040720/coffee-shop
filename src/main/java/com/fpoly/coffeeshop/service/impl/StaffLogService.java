package com.fpoly.coffeeshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.fpoly.coffeeshop.converter.StaffLogConverter;
import com.fpoly.coffeeshop.dto.StaffLogDTO;
import com.fpoly.coffeeshop.entity.StaffLogEntity;
import com.fpoly.coffeeshop.repository.IStaffLogRepository;
import com.fpoly.coffeeshop.service.IStaffLogService;

public class StaffLogService implements IStaffLogService {

	@Autowired
	private IStaffLogRepository staffLogRepository;
	
	@Autowired
	private StaffLogConverter staffLogConverter;
	
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
	
}
