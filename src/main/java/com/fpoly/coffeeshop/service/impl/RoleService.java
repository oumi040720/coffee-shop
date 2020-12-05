package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.RoleConveter;
import com.fpoly.coffeeshop.dto.RoleDTO;
import com.fpoly.coffeeshop.entity.RoleEntity;
import com.fpoly.coffeeshop.repository.IRoleRepository;
import com.fpoly.coffeeshop.service.IRoleService;

@Service
public class RoleService implements IRoleService {

	@Autowired
	private IRoleRepository roleRepository;
	
	@Autowired
	private RoleConveter roleConveter;
	
	@Override
	public List<RoleDTO> findAll() {
		List<RoleEntity> list = roleRepository.findAll();
		List<RoleDTO> result = new ArrayList<>();
		
		for (RoleEntity role : list) {
			result.add(roleConveter.convertToDTO(role));
		}
		
		return result;
	}
	
	@Override
	public List<RoleDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<RoleEntity> list = roleRepository.findAllByFlagDeleteIs(flagDelete);
		List<RoleDTO> result = new ArrayList<>();
		
		for (RoleEntity role : list) {
			result.add(roleConveter.convertToDTO(role));
		}
		
		return result;
	}
	
	@Override
	public RoleDTO findOne(Integer id) {
		try {
			return roleConveter.convertToDTO(roleRepository.getOne(id));
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public RoleDTO findOne(String roleCode) {
		try {
			return roleConveter.convertToDTO(roleRepository.findOneByRoleCode(roleCode));
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public Boolean insert(RoleDTO roleDTO) {
		try {
			RoleEntity result = roleRepository.save(roleConveter.convertToEntity(roleDTO));
			
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
	public Boolean update(RoleDTO roleDTO) {
		try {
			RoleEntity oldRole = roleRepository.getOne(roleDTO.getId());
			RoleEntity newRole = roleConveter.convertToEntity(roleDTO, oldRole);
			
			RoleEntity result = roleRepository.save(newRole);
			
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
	public Boolean delete(Integer id) {
		try {
			roleRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
