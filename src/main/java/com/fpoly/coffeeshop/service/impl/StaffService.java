package com.fpoly.coffeeshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fpoly.coffeeshop.converter.StaffConverter;
import com.fpoly.coffeeshop.dto.StaffDTO;
import com.fpoly.coffeeshop.entity.StaffEntity;
import com.fpoly.coffeeshop.entity.UserEntity;
import com.fpoly.coffeeshop.repository.IStaffRepository;
import com.fpoly.coffeeshop.repository.IUserRepository;
import com.fpoly.coffeeshop.service.IStaffService;

public class StaffService implements IStaffService {

	@Autowired
	private IStaffRepository staffRepository;
	
	@Autowired
	private IUserRepository userRepository;
	
	@Autowired
	private StaffConverter staffConverter;
	
	@Override
	public List<StaffDTO> findAll() {
		return null;
	}

	@Override
	public List<StaffDTO> findAllByFlagDelete(Boolean flagDelete) {
		return null;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return null;
	}

	@Override
	public List<StaffDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		return null;
	}

	@Override
	public List<StaffDTO> findAllByKey(String key) {
		return null;
	}

	@Override
	public Integer getTotalPagesByKey(String key, Integer page, Integer limit) {
		return null;
	}

	@Override
	public List<StaffDTO> findAllByKey(String key, Integer page, Integer limit) {
		return null;
	}

	@Override
	public List<StaffDTO> findAllByFlagDeleteAndKey(Boolean flagDelete, String key) {
		return null;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndKey(Boolean flagDelete, String key, Integer page, Integer limit) {
		return null;
	}

	@Override
	public List<StaffDTO> findAllByFlagDeleteAndKey(Boolean flagDelete, String key, Integer page, Integer limit) {
		return null;
	}

	@Override
	public StaffDTO findOne(Long id) {
		return staffConverter.convertToDTO(staffRepository.getOne(id));
	}

	@Override
	public Boolean insert(StaffDTO userDTO) {
		try {
			UserEntity userEntity = userRepository.findOneByUsername(userDTO.getUsername());
			StaffEntity staffEntity = staffConverter.convertToEntity(userDTO);
			staffEntity.setUser(userEntity);
			
			StaffEntity result = staffRepository.save(staffEntity);
			
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
	public Boolean update(StaffDTO staffDTO) {
		try {
			UserEntity userEntity = userRepository.findOneByUsername(staffDTO.getUsername());
			StaffEntity oldStaff = staffRepository.getOne(staffDTO.getId());
			StaffEntity newStaff = staffConverter.convertToEntity(staffDTO, oldStaff);
			newStaff.setUser(userEntity);
			
			StaffEntity result = staffRepository.save(newStaff);
			
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
			staffRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
