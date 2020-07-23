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
	
}
