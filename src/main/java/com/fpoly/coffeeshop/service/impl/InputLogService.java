package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.InputLogConveter;
import com.fpoly.coffeeshop.dto.InputLogDTO;
import com.fpoly.coffeeshop.entity.InputLogEntity;
import com.fpoly.coffeeshop.repository.IInputLogRepository;
import com.fpoly.coffeeshop.service.IInputLogService;

@Service
public class InputLogService implements IInputLogService{

	@Autowired
	private IInputLogRepository inputLogRepository;
	
	@Autowired
	private InputLogConveter inputLogConveter;

	@Override
	public List<InputLogDTO> findAll() {
		List<InputLogEntity> list = inputLogRepository.findAll();
		List<InputLogDTO> result = new ArrayList<>();
		
		for (InputLogEntity inputlog : list) {
			result.add(inputLogConveter.convertToDTO(inputlog));
		}
		
		return result;
	}

	@Override
	public List<InputLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete) {
		List<InputLogEntity> list = inputLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete);
		List<InputLogDTO> result = new ArrayList<>();
		
		for (InputLogEntity inputlog : list) {
			result.add(inputLogConveter.convertToDTO(inputlog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit) {
		return inputLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete, Integer page, Integer limit) {
		List<InputLogEntity> list = inputLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete,PageRequest.of(page, limit)).getContent();
		List<InputLogDTO> result = new ArrayList<>();
		
		for (InputLogEntity inputlog : list) {
			result.add(inputLogConveter.convertToDTO(inputlog));
		}
		
		return result;
	}

	@Override
	public List<InputLogDTO> findAllByInputID(Long inputID) {
		List<InputLogEntity> list = inputLogRepository.findAllByInputID(inputID);
		List<InputLogDTO> result = new ArrayList<>();
		
		for (InputLogEntity inputlog : list) {
			result.add(inputLogConveter.convertToDTO(inputlog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByInputID(Long inputID, Integer page, Integer limit) {
		return inputLogRepository.findAllByInputID(inputID, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputLogDTO> findAllByInputID(Long inputID, Integer page, Integer limit) {
		List<InputLogEntity> list = inputLogRepository.findAllByInputID(inputID, PageRequest.of(page, limit)).getContent();
		List<InputLogDTO> result = new ArrayList<>();
		
		for (InputLogEntity inputlog : list) {
			result.add(inputLogConveter.convertToDTO(inputlog));
		}
		
		return result;
	}

	@Override
	public List<InputLogDTO> findAllByOldFlagDeleteAndInputID(Boolean oldFlagDelete, Long inputID) {
		List<InputLogEntity> list = inputLogRepository.findAllByOldFlagDeleteIsAndInputID(oldFlagDelete, inputID);
		List<InputLogDTO> result = new ArrayList<>();
		
		for (InputLogEntity inputlog : list) {
			result.add(inputLogConveter.convertToDTO(inputlog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByOldFlagDeleteAndInputID(Boolean oldFlagDelete, Long inputID, Integer page,
			Integer limit) {
		return inputLogRepository.findAllByOldFlagDeleteIsAndInputID(oldFlagDelete, inputID, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputLogDTO> findAllByOldFlagDeleteAndInputID(Boolean oldFlagDelete, Long inputID, Integer page,
			Integer limit) {
		List<InputLogEntity> list = inputLogRepository.findAllByOldFlagDeleteIsAndInputID(oldFlagDelete, inputID, PageRequest.of(page, limit)).getContent();
		List<InputLogDTO> result = new ArrayList<>();
		
		for (InputLogEntity inputlog : list) {
			result.add(inputLogConveter.convertToDTO(inputlog));
		}
		
		return result;
	}

	@Override
	public Boolean insert(InputLogDTO inputLogDTO) {
		try {
			InputLogEntity result = inputLogRepository.save(inputLogConveter.convertToEntity(inputLogDTO));
			
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
			inputLogRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
