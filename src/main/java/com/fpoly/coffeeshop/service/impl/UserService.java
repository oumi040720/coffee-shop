package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.UserConveter;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.entity.RoleEntity;
import com.fpoly.coffeeshop.entity.UserEntity;
import com.fpoly.coffeeshop.repository.IRoleRepository;
import com.fpoly.coffeeshop.repository.IUserRepository;
import com.fpoly.coffeeshop.service.IUserService;
import com.fpoly.coffeeshop.util.DecryptionUtil;
import com.fpoly.coffeeshop.util.EncrpytionUtil;

@Service
public class UserService implements IUserService {

	@Autowired
	private IRoleRepository roleRepository;
	
	@Autowired
	private IUserRepository userRepository;
	
	@Autowired
	private UserConveter userConveter;
	
	@Override
	public UserDTO checkLogin(String username, String password, Boolean flagDelete) {
		try {
			String decryption = DecryptionUtil.decryption(getP(username));
			
			if (decryption.equals(password)) {
				return userConveter.convertToDTO(userRepository.findOneByUsernameAndFlagDelete(username, flagDelete));
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public List<UserDTO> findAll() {
		List<UserEntity> list = userRepository.findAll();
		List<UserDTO> result = new ArrayList<>();

		for (UserEntity user : list) {
			result.add(userConveter.convertToDTO(user));
		}
		
		return result;
	}
	
	@Override
	public List<UserDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<UserEntity> list = userRepository.findAllByFlagDeleteIs(flagDelete);
		List<UserDTO> result = new ArrayList<>();

		for (UserEntity user : list) {
			result.add(userConveter.convertToDTO(user));
		}
		
		return result;
	}
	
	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return userRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
							 .getTotalPages();
	}
	
	@Override
	public List<UserDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<UserEntity> list = userRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
											  .getContent();
		List<UserDTO> result = new ArrayList<>();

		for (UserEntity user : list) {
			result.add(userConveter.convertToDTO(user));
		}
		
		return result;
	}
	
	@Override
	public List<UserDTO> findAllByUsername(String key) {
		List<UserEntity> list = userRepository.findAllByUsernameContaining(key);
		List<UserDTO> result = new ArrayList<>();
		
		for (UserEntity user : list) {
			result.add(userConveter.convertToDTO(user));
		}
		
		return result;
	}
	
	@Override
	public Integer getTotalPagesByUsername(String key, Integer page, Integer limit) {
		return userRepository.findAllByUsernameContaining(key, PageRequest.of(page, limit))
							 .getTotalPages();
	}
	
	@Override
	public List<UserDTO> findAllByUsername(String key, Integer page, Integer limit) {
		List<UserEntity> list = userRepository.findAllByUsernameContaining(key, PageRequest.of(page, limit))
											  .getContent();
		List<UserDTO> result = new ArrayList<>();
		
		for (UserEntity user : list) {
			result.add(userConveter.convertToDTO(user));
		}
		
		return result;
	}
	
	@Override
	public List<UserDTO> findAllByFlagDeleteAndUsername(Boolean flagDelete, String key) {
		List<UserEntity> list = userRepository.findAllByFlagDeleteIsAndUsernameContaining(flagDelete, key);
		List<UserDTO> result = new ArrayList<>();
		
		for (UserEntity user : list) {
			result.add(userConveter.convertToDTO(user));
		}
		
		return result;
	}
	
	@Override
	public Integer getTotalPagesByFlagDeleteAndUsername(Boolean flagDelete, String key, Integer page, Integer limit) {
		return userRepository.findAllByFlagDeleteIsAndUsernameContaining(flagDelete, key, PageRequest.of(page, limit))
							 .getTotalPages();
	}
	
	@Override
	public List<UserDTO> findAllByFlagDeleteAndUsername(Boolean flagDelete, String key, Integer page, Integer limit) {
		List<UserEntity> list = userRepository.findAllByFlagDeleteIsAndUsernameContaining(flagDelete, key, PageRequest.of(page, limit))
											  .getContent();
		List<UserDTO> result = new ArrayList<>();
		
		for (UserEntity user : list) {
			result.add(userConveter.convertToDTO(user));
		}
		
		return result;
	}
	
	@Override
	public String getP(String username) {
		String p = userRepository.findOneByUsername(username).getPassword();
		
		return p;
	}
	
	@Override
	public UserDTO findOne(Long id) {
		return userConveter.convertToDTO(userRepository.getOne(id));
	}
	
	@Override
	public UserDTO findOne(String username) {
		try {
			return userConveter.convertToDTO(userRepository.findOneByUsername(username));
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public Boolean insert(UserDTO userDTO) {
		try {
			RoleEntity roleEntity = roleRepository.findOneByRoleCode(userDTO.getRoleCode());
			UserEntity userEntity = userConveter.convertToEntity(userDTO);
			userEntity.setPassword(EncrpytionUtil.encrpytion(userDTO.getPassword()));
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
	
	@Override
	public Boolean update(UserDTO userDTO) {
		try {
			userDTO.setPassword(EncrpytionUtil.encrpytion(userDTO.getPassword()));
			
			RoleEntity roleEntity = roleRepository.findOneByRoleCode(userDTO.getRoleCode());
			UserEntity oldUser = userRepository.getOne(userDTO.getId());
			UserEntity newUser = userConveter.convertToEntity(userDTO, oldUser);
			newUser.setRole(roleEntity);
			
			UserEntity result = userRepository.save(newUser);
			
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
			userRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
