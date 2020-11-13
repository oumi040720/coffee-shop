package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.CustomersConveter;
import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.entity.CustomersEntity;
import com.fpoly.coffeeshop.entity.UserEntity;
import com.fpoly.coffeeshop.repository.ICustomersRepository;
import com.fpoly.coffeeshop.repository.IUserRepository;
import com.fpoly.coffeeshop.service.ICustomersService;

@Service
public class CustomersService implements ICustomersService {

	@Autowired
	private ICustomersRepository cusctomersRepository;

	@Autowired
	private CustomersConveter customersConveter;
	
	@Autowired
	private IUserRepository userRepository  ;

	@Override
	public List<CustomersDTO> findAll() {
		List<CustomersEntity> list = cusctomersRepository.findAll();
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public List<CustomersDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<CustomersEntity> list = cusctomersRepository.findAllByFlagDeleteIs(flagDelete);
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return cusctomersRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<CustomersEntity> list = cusctomersRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
				.getContent();
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public CustomersDTO findOne(Long id) {
		return customersConveter.convertToDTO(cusctomersRepository.getOne(id));
	}

	@Override
	public Boolean insert(CustomersDTO userDTO) {
		try {
			UserEntity userEntity = userRepository.findOneByUsername(userDTO.getUsername());
			CustomersEntity customersEntity = customersConveter.convertToEntity(userDTO);
			customersEntity.setUser(userEntity);
			
			CustomersEntity result = cusctomersRepository.save(customersEntity);
			
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
	public Boolean update(CustomersDTO customersDTO) {
		try {
			UserEntity userEntity = userRepository.findOneByUsername(customersDTO.getUsername());
			CustomersEntity oldCustomers = cusctomersRepository.getOne(customersDTO.getId());
			CustomersEntity newCustomers = customersConveter.convertToEntity(customersDTO, oldCustomers);
			newCustomers.setUser(userEntity);
			
			CustomersEntity result = cusctomersRepository.save(newCustomers);
			
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
			cusctomersRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public CustomersDTO findOne(String fullname) {
		return customersConveter.convertToDTO(cusctomersRepository.findOneByFullname(fullname));
	}

	@Override
	public List<CustomersDTO> findAllByKey(String key) {
		List<CustomersEntity> list = cusctomersRepository
				.findAllByFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(key, key, key, key);
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public Integer getTotalPagesByKey(String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(key,
				key, key, key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByKey(String key, Integer page, Integer limit) {
		List<CustomersEntity> list = cusctomersRepository
				.findAllByFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(key, key, key, key,PageRequest.of(page, limit))
				.getContent();
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public Integer getTotalPagesByKey(Boolean flagDelete, String key, Integer page, Integer limit) {
		return cusctomersRepository.search(key, flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<CustomersDTO> search(Boolean flagDelete, String key, Integer page, Integer limit) {
		List<CustomersEntity> list = cusctomersRepository.search(key, flagDelete, PageRequest.of(page, limit)).getContent();
		
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public CustomersDTO findOne1(String user) {
		UserEntity userDTO = userRepository.findOneByUsername(user);
		return customersConveter.convertToDTO(cusctomersRepository.findOneByUser(userDTO));
	}
}
