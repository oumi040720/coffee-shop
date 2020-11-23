package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.InputConveter;
import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.entity.InputEntity;
import com.fpoly.coffeeshop.repository.IInputRepository;
import com.fpoly.coffeeshop.service.IInputService;

@Service
public class InputsService implements IInputService {

	
	@Autowired
	private IInputRepository inputRepository;
	@Autowired
	private InputConveter inputConveter;
	@Override
	public List<InputDTO> findAll() {
		List<InputEntity> list = inputRepository.findAll();
		List<InputDTO> result = new ArrayList<>();
		for(InputEntity input : list) {
			result.add(inputConveter.ConvertToDTO(input));
		}
		return result;
	}
	@Override
	public List<InputDTO> findAllbyFlagDelete(Boolean flagDelete) {
		// TODO Auto-generated method stub
		List<InputEntity> list = inputRepository.findByFlagDeleteIs(flagDelete);
		List<InputDTO> result = new ArrayList<>();
		for(InputEntity input : list ) {
			result.add(inputConveter.ConvertToDTO(input));
		}
		return result;
	}
	@Override
	public InputDTO findOne(Long id) {
		
		return inputConveter.ConvertToDTO(inputRepository.getOne(id));
	}
	
	@Override
	public Boolean insert(InputDTO inputDTO) {
		try {
			InputEntity result = inputRepository.save(inputConveter.convertToEntity(inputDTO));
			if (result != null) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public Boolean update(InputDTO inputDTO) {
		try {
			InputEntity oldInput = inputRepository.getOne(inputDTO.getId());
			InputEntity newInput = inputConveter.convertToEntity(inputDTO,oldInput);
			
			InputEntity result = inputRepository.save(newInput);
			if (result != null) {
				return true;  
				
			}else {
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
	public InputDTO findOne(Date inputDate) {
		
		return inputConveter.ConvertToDTO(inputRepository.findOneByInputDate(inputDate));
	}
	
	
	
	
	
	
}
