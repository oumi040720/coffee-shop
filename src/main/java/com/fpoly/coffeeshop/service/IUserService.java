package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.UserDTO;

public interface IUserService {

	public UserDTO checkLogin(String username, String password, Boolean flagDelete);
	
	
	public List<UserDTO> findAll();
	
	
	public List<UserDTO> findAllByFlagDelete(Boolean flagDelete); 
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit); 
	
	public List<UserDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit); 
	
	
	public List<UserDTO> findAllByUsername(String key); 
	
	public Integer getTotalPagesByUsername(String key, Integer page, Integer limit); 
	
	public List<UserDTO> findAllByUsername(String key, Integer page, Integer limit); 
	
	
	public List<UserDTO> findAllByFlagDeleteAndUsername(Boolean flagDelete, String key); 
	
	public Integer getTotalPagesByFlagDeleteAndUsername(Boolean flagDelete, String key, Integer page, Integer limit); 
	
	public List<UserDTO> findAllByFlagDeleteAndUsername(Boolean flagDelete, String key, Integer page, Integer limit); 

	
	public String getP(String username);
	
	public UserDTO findOne(Long id);
	
	public UserDTO findOne(String username);
	
	
	public Boolean insert(UserDTO userDTO);
	
	public Boolean update(UserDTO userDTO);

	public Boolean delete(Long id);
	
}
