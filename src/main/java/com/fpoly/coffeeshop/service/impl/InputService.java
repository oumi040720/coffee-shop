package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.InputConveter;
import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.entity.InputEntity;
import com.fpoly.coffeeshop.repository.IInputRepositoty;
import com.fpoly.coffeeshop.service.IInputService;

@Service
public class InputService implements IInputService{
	
	@Autowired
	private IInputRepositoty inputRepositoty;
	
	@Autowired
	private InputConveter inputConveter;

	@Override
	public List<InputDTO> findAll() {
		List<InputEntity> list = inputRepositoty.findAll();
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public List<InputDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<InputEntity> list = inputRepositoty.findAllByFlagDeleteIs(flagDelete);
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return inputRepositoty.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<InputEntity> list = inputRepositoty.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
				.getContent();
		List<InputDTO> result = new ArrayList<>();

		for (InputEntity input : list) {
			result.add(inputConveter.convertToDTO(input));
		}

		return result;
	}

	@Override
	public InputDTO findOne(Long id) {
		return inputConveter.convertToDTO(inputRepositoty.getOne(id));
	}

	@Override
	public InputDTO insert(InputDTO inputDTO) {
		try {
			InputEntity inputEntity = inputConveter.convertToEntity(inputDTO);
			InputEntity result = inputRepositoty.save(inputEntity);
			return inputConveter.convertToDTO(result);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Boolean update(InputDTO inputDTO) {
		try {
			InputEntity oldInput = inputRepositoty.getOne(inputDTO.getId());
			InputEntity newInput = inputConveter.convertToEntity(inputDTO, oldInput);
			InputEntity result = inputRepositoty.save(newInput);		
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
			inputRepositoty.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
