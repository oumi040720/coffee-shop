package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.CustomersConveter;
import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.entity.CustomersEntity;
import com.fpoly.coffeeshop.repository.ICusctomersRepository;
import com.fpoly.coffeeshop.service.ICustomersService;

@Service
public class CustomersService implements ICustomersService {

	@Autowired
	private ICusctomersRepository cusctomersRepository;

	@Autowired
	private CustomersConveter customersConveter;

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

	
}
