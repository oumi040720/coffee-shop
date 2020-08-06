package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.CustomersConveter;
import com.fpoly.coffeeshop.dto.CustomersDTO;
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
	public List<CustomersDTO> findAllByFullname(String key) {
		List<CustomersEntity> list = cusctomersRepository.findAllByFullnameContaining(key);
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public Integer getTotalPagesByFullname(String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByFullnameContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByFullname(String key, Integer page, Integer limit) {
		List<CustomersEntity> list = (cusctomersRepository.findAllByFullnameContaining(key,
				PageRequest.of(page, limit))).getContent();
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public List<CustomersDTO> findAllByEmail(String key) {
		List<CustomersEntity> list = cusctomersRepository.findAllByEmailContaining(key);
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public Integer getTotalPagesByEmail(String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByEmailContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByEmail(String key, Integer page, Integer limit) {
		List<CustomersEntity> list = (cusctomersRepository.findAllByEmailContaining(key,
				PageRequest.of(page, limit))).getContent();
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public List<CustomersDTO> findAllByAddress(String key) {
		List<CustomersEntity> list = cusctomersRepository.findAllByAddressContaining(key);
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public Integer getTotalPagesByAddress(String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByAddressContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByAddress(String key, Integer page, Integer limit) {
		List<CustomersEntity> list = (cusctomersRepository.findAllByAddressContaining(key,
				PageRequest.of(page, limit))).getContent();
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public List<CustomersDTO> findAllByPhone(String key) {
		List<CustomersEntity> list = cusctomersRepository.findAllByPhoneContaining(key);
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public Integer getTotalPagesByPhone(String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByPhoneContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByPhone(String key, Integer page, Integer limit) {
		List<CustomersEntity> list = (cusctomersRepository.findAllByPhoneContaining(key,
				PageRequest.of(page, limit))).getContent();
		List<CustomersDTO> result = new ArrayList<>();

		for (CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}

		return result;
	}

	@Override
	public List<CustomersDTO> findAllByFlagDeleteAndFullname(Boolean flagDelete, String key) {
		List<CustomersEntity> list  = cusctomersRepository.findAllByFlagDeleteIsAndFullnameContaining(flagDelete, key);
		List<CustomersDTO> result = new ArrayList<>();
		
		for(CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndFullname(Boolean flagDelete, String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByFlagDeleteIsAndFullnameContaining(flagDelete, key, PageRequest.of(page, limit))
				 .getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByFlagDeleteAndFullname(Boolean flagDelete, String key, Integer page,
			Integer limit) {
		List<CustomersEntity> list  = cusctomersRepository.findAllByFlagDeleteIsAndFullnameContaining(flagDelete, key, PageRequest.of(page, limit))
				.getContent();
		List<CustomersDTO> result = new ArrayList<>();
		
		for(CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public List<CustomersDTO> findAllByFlagDeleteAndEmail(Boolean flagDelete, String key) {
		List<CustomersEntity> list  = cusctomersRepository.findAllByFlagDeleteIsAndEmailContaining(flagDelete, key);
		List<CustomersDTO> result = new ArrayList<>();
		
		for(CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndEmail(Boolean flagDelete, String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByFlagDeleteIsAndEmailContaining(flagDelete, key, PageRequest.of(page, limit))
				 .getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByFlagDeleteAndEmail(Boolean flagDelete, String key, Integer page, Integer limit) {
		List<CustomersEntity> list  = cusctomersRepository.findAllByFlagDeleteIsAndEmailContaining(flagDelete, key, PageRequest.of(page, limit))
				.getContent();
		List<CustomersDTO> result = new ArrayList<>();
		
		for(CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public List<CustomersDTO> findAllByFlagDeleteAndPhone(Boolean flagDelete, String key) {
		List<CustomersEntity> list  = cusctomersRepository.findAllByFlagDeleteIsAndPhoneContaining(flagDelete, key);
		List<CustomersDTO> result = new ArrayList<>();
		
		for(CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndPhone(Boolean flagDelete, String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByFlagDeleteIsAndPhoneContaining(flagDelete, key, PageRequest.of(page, limit))
				 .getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByFlagDeleteAndPhone(Boolean flagDelete, String key, Integer page, Integer limit) {
		List<CustomersEntity> list  = cusctomersRepository.findAllByFlagDeleteIsAndPhoneContaining(flagDelete, key, PageRequest.of(page, limit))
				.getContent();
		List<CustomersDTO> result = new ArrayList<>();
		
		for(CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public List<CustomersDTO> findAllByFlagDeleteAndAddress(Boolean flagDelete, String key) {
		List<CustomersEntity> list  = cusctomersRepository.findAllByFlagDeleteIsAndAddressContaining(flagDelete, key);
		List<CustomersDTO> result = new ArrayList<>();
		
		for(CustomersEntity customer : list) {
			result.add(customersConveter.convertToDTO(customer));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndAddress(Boolean flagDelete, String key, Integer page, Integer limit) {
		return cusctomersRepository.findAllByFlagDeleteIsAndAddressContaining(flagDelete, key, PageRequest.of(page, limit))
				 .getTotalPages();
	}

	@Override
	public List<CustomersDTO> findAllByFlagDeleteAndAddress(Boolean flagDelete, String key, Integer page,
			Integer limit) {
		List<CustomersEntity> list  = cusctomersRepository.findAllByFlagDeleteIsAndAddressContaining(flagDelete, key, PageRequest.of(page, limit))
				.getContent();
		List<CustomersDTO> result = new ArrayList<>();
		
		for(CustomersEntity customer : list) {
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

}
