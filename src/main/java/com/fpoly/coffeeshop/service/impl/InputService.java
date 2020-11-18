package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.InputConveter;
import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.entity.CouponEntity;
import com.fpoly.coffeeshop.entity.CustomersEntity;
import com.fpoly.coffeeshop.entity.InputEntity;
import com.fpoly.coffeeshop.entity.UserEntity;
import com.fpoly.coffeeshop.repository.ICouponRepository;
import com.fpoly.coffeeshop.repository.ICustomersRepository;
import com.fpoly.coffeeshop.repository.IInputRepository;
import com.fpoly.coffeeshop.repository.IUserRepository;
import com.fpoly.coffeeshop.service.IInputService;

@Service
public class InputService implements IInputService {

	@Autowired
	private IInputRepository inputRepository;

	@Autowired
	private InputConveter inputConveter;

	@Autowired
	private ICustomersRepository cusctomersRepository;
	
	@Autowired
	private ICouponRepository couponRepository;
	
	@Autowired
	private IUserRepository userRepository;

	@Override
	public List<InputDTO> findAll() {
		List<InputEntity> list = inputRepository.findAll();
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public List<InputDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<InputEntity> list = inputRepository.findAllByFlagDeleteIs(flagDelete);
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return inputRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<InputEntity> list = inputRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
				.getContent();
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public List<InputDTO> findAllByInputCode(String key) {
		List<InputEntity> list = inputRepository.findAllByInputCodeContaining(key);
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByInputCode(String key, Integer page, Integer limit) {
		return inputRepository.findAllByInputCodeContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDTO> findAllByInputCode(String key, Integer page, Integer limit) {
		List<InputEntity> list = inputRepository.findAllByInputCodeContaining(key, PageRequest.of(page, limit))
				.getContent();
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public InputDTO findOne(Long id) {
		return inputConveter.convertToDTO(inputRepository.getOne(id));
	}

	@Override
	public Boolean insert(InputDTO customerDTO, String username) {
		try {
			UserEntity userEntity = userRepository.findOneByUsername(username);
			CustomersEntity customersEntity = cusctomersRepository.findOneByUser(userEntity);
			InputEntity inputEntity = inputConveter.convertToEntity(customerDTO);
			inputEntity.setCustomer(customersEntity);
			//inputEntity.setInputDate(new Date(System.currentTimeMillis()));
			
			InputEntity result = inputRepository.save(inputEntity);

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
	public Boolean update(InputDTO inputDTO) {
		try {
			CustomersEntity customersEntity = cusctomersRepository.findOneByFullname(inputDTO.getFullname());
			CouponEntity couponEntity = couponRepository.findOneByCouponCode(inputDTO.getCouponCode());
			InputEntity oldInput = inputRepository.getOne(inputDTO.getId());
			InputEntity newInput = inputConveter.convertToEntity(inputDTO, oldInput);
			newInput.setCustomer(customersEntity);
			newInput.setCoupon(couponEntity);
			InputEntity result = inputRepository.save(newInput);

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
			inputRepository.deleteById(id);

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<InputDTO> findAllByFlagDeleteAndInputCode(Boolean flagDelete, String key) {
		List<InputEntity> list = inputRepository.findAllByFlagDeleteIsAndInputCodeContaining(flagDelete, key);
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndInputCode(Boolean flagDelete, String key, Integer page, Integer limit) {
		return inputRepository.findAllByFlagDeleteIsAndInputCodeContaining(flagDelete, key, PageRequest.of(page, limit))
				 .getTotalPages();
	}

	@Override
	public List<InputDTO> findAllByFlagDeleteAndInputCode(Boolean flagDelete, String key, Integer page, Integer limit) {
		List<InputEntity> list  = inputRepository.findAllByFlagDeleteIsAndInputCodeContaining(flagDelete, key, PageRequest.of(page, limit))
				.getContent();
		List<InputDTO> result = new ArrayList<>();
		
		for(InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public InputDTO findOne(String inputCode) {
		return inputConveter.convertToDTO(inputRepository.findOneByInputCode(inputCode));
	}

	
	
	@Override
	public Integer getTotalPagesByFlagDeleteAndUsername(Boolean flagDelete, String username, Integer page, Integer limit) {
		UserEntity user = userRepository.findOneByUsername(username);
		CustomersEntity customer = cusctomersRepository.findOneByUser(user);
		
		return inputRepository.findAllByFlagDeleteIsAndCustomer(flagDelete, customer, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public List<InputDTO> findAllByFlagDeleteAndUsername(Boolean flagDelete, String username, Integer page, Integer limit) {
		UserEntity user = userRepository.findOneByUsername(username);
		CustomersEntity customer = cusctomersRepository.findOneByUser(user);
		
		List<InputEntity> list  = inputRepository.findAllByFlagDeleteIsAndCustomer(flagDelete, customer, PageRequest.of(page, limit))
													.getContent();
		List<InputDTO> result = new ArrayList<>();
		
		for(InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}
	
	
	
	@Override
	public List<Long[]> getInputDetailStatistic(Integer year, Integer month) {
		return inputRepository.getInputDetailStatistic(year, month);
	}
	
	@Override
	public List<Object[]> getTop4BestSeller() {
		return inputRepository.getTop4BestSeller();
	}
	
	@Override
	public List<Object[]> getSalesEveryYear() {
		return inputRepository.getSalesEveryYear();
	}
	
	@Override
	public List<Object[]> getSalesEveryMonthByYear(Integer year) {
		return inputRepository.getSalesEveryMonthByYear(year);
	}

	@Override
	public List<Object[]> getSalesEveryDayByYearAndMonth(Integer year, Integer month) {
		return inputRepository.getSalesEveryDayByYearAndMonth(year, month);
	}
	
	@Override
	public List<Object[]> getSalesRateEveryMotnhInYear(Integer year) {
		return inputRepository.getSalesRateEveryMotnhInYear(year);
	}
	
	@Override
	public List<Object[]> getSalesRateEveryDayInMonthOfYear(Integer year, Integer month) {
		return inputRepository.getSalesRateEveryDayInMonthOfYear(year, month);
	}
	
}
