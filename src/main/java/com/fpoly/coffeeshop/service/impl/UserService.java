package com.fpoly.coffeeshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.UserConveter;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.entity.RoleEntity;
import com.fpoly.coffeeshop.entity.UserEntity;
import com.fpoly.coffeeshop.repository.IRoleRepository;
import com.fpoly.coffeeshop.repository.IUserRepository;
import com.fpoly.coffeeshop.service.IUserService;

@Service
public class UserService implements IUserService {

	@Autowired
	private IRoleRepository roleRepository;
	
	@Autowired
	private IUserRepository userRepository;
	
	@Autowired
	private UserConveter userConveter;
	
	@Override
	public Boolean insert(UserDTO userDTO) {
		try {
			RoleEntity roleEntity = roleRepository.findOneByRoleCode(userDTO.getRoleCode());
			UserEntity userEntity = userConveter.convertToEntity(userDTO);
			userEntity.setRole(roleEntity);
			
			UserEntity result = userRepository.save(userEntity);
			
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
