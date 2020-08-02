package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.StaffConverter;
import com.fpoly.coffeeshop.dto.StaffDTO;
import com.fpoly.coffeeshop.entity.StaffEntity;
import com.fpoly.coffeeshop.entity.UserEntity;
import com.fpoly.coffeeshop.repository.IStaffRepository;
import com.fpoly.coffeeshop.repository.IUserRepository;
import com.fpoly.coffeeshop.service.IStaffService;

@Service
public class StaffService implements IStaffService {

	@Autowired
	private IStaffRepository staffRepository;
	
	@Autowired
	private IUserRepository userRepository;
	
	@Autowired
	private StaffConverter staffConverter;
	
	@Override
	public List<StaffDTO> findAll() {
		List<StaffEntity> list = staffRepository.findAll();
		List<StaffDTO> result = new ArrayList<>();
		
		for (StaffEntity staff : list) {
			result.add(staffConverter.convertToDTO(staff));
		}
		
		return result;
	}

	@Override
	public List<StaffDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<StaffEntity> list = staffRepository.findAllByFlagDeleteIs(flagDelete);
		List<StaffDTO> result = new ArrayList<>();
		
		for (StaffEntity staff : list) {
			result.add(staffConverter.convertToDTO(staff));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return staffRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
							  .getTotalPages();
	}

	@Override
	public List<StaffDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<StaffEntity> list = staffRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
												.getContent();
		List<StaffDTO> result = new ArrayList<>();
		
		for (StaffEntity staff : list) {
			result.add(staffConverter.convertToDTO(staff));
		}
		
		return result;
	}

	@Override
	public List<StaffDTO> findAllByKey(String key) {
		List<StaffEntity> list = staffRepository.findAllByFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(key, key, key, key);
		List<StaffDTO> result = new ArrayList<>();
		
		for (StaffEntity staff : list) {
			result.add(staffConverter.convertToDTO(staff));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByKey(String key, Integer page, Integer limit) {
		return staffRepository.findAllByFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(key, key, key, key, PageRequest.of(page, limit))
							  .getTotalPages();
	}

	@Override
	public List<StaffDTO> findAllByKey(String key, Integer page, Integer limit) {
		List<StaffEntity> list = staffRepository.findAllByFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(key, key, key, key, 
												 PageRequest.of(page, limit)).getContent();
		List<StaffDTO> result = new ArrayList<>();
		
		for (StaffEntity staff : list) {
			result.add(staffConverter.convertToDTO(staff));
		}
		
		return result;
	}

	@Override
	public List<StaffDTO> findAllByFlagDeleteAndKey(Boolean flagDelete, String key) {
		List<StaffEntity> list = staffRepository.findAllByFlagDeleteAndFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(flagDelete, 
																														key, key, key, key);
		List<StaffDTO> result = new ArrayList<>();
		
		for (StaffEntity staff : list) {
			result.add(staffConverter.convertToDTO(staff));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndKey(Boolean flagDelete, String key, Integer page, Integer limit) {
		return staffRepository.findAllByFlagDeleteAndFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(flagDelete, key, key, key, key,
																									PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<StaffDTO> findAllByFlagDeleteAndKey(Boolean flagDelete, String key, Integer page, Integer limit) {
		List<StaffEntity> list = staffRepository.findAllByFlagDeleteAndFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(flagDelete, 
																					key, key, key, key, PageRequest.of(page, limit)).getContent();
		List<StaffDTO> result = new ArrayList<>();
		
		for (StaffEntity staff : list) {
			result.add(staffConverter.convertToDTO(staff));
		}

		return result;
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
