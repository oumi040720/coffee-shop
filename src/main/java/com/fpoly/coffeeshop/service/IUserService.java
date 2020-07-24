package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.UserDTO;

public interface IUserService {

	public List<UserDTO> findAll();
	
	public List<UserDTO> findAllByFlagDelete(Boolean flagDelete); 
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit); 
	
	public List<UserDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit); 
	
	public UserDTO findOne(Long id);
	
	public UserDTO findOne(String username);
	
	public Boolean insert(UserDTO userDTO);
	
	public Boolean update(UserDTO userDTO);

	public Boolean delete(Long id);
	
}
