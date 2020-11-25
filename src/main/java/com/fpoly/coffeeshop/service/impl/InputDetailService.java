package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.InputDetailConveter;
import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.entity.IngredientsEntity;
import com.fpoly.coffeeshop.entity.InputDetailEntity;
import com.fpoly.coffeeshop.entity.InputEntity;
import com.fpoly.coffeeshop.entity.UnitEntity;
import com.fpoly.coffeeshop.repository.IIngredientsRepository;
import com.fpoly.coffeeshop.repository.IInputDetailRepository;
import com.fpoly.coffeeshop.repository.IInputRepositoty;
import com.fpoly.coffeeshop.repository.IUnitRepository;
import com.fpoly.coffeeshop.service.IInputDetailService;
import com.fpoly.coffeeshop.service.IInputService;
@Service
public class InputDetailService implements IInputDetailService{

	@Autowired
	private IInputDetailRepository  inputDetailRepository;
	
	@Autowired
	private IInputRepositoty  inputRepository;
	
	@Autowired
	private IIngredientsRepository  ingredientsRepository;
	
	@Autowired
	private IUnitRepository  unitRepository;
	
	@Autowired
	private  InputDetailConveter inputDetailConveter;
	
	@Autowired
	private IInputService inputService;
	
	@Override
	public List<InputDetailDTO> findAll() {
		List<InputDetailEntity> list = inputDetailRepository.findAll();
		List<InputDetailDTO> result = new ArrayList<>();

		for (InputDetailEntity inputdetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputdetail));
		}
		return result;
	}

	@Override
	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<InputDetailEntity> list = inputDetailRepository.findAllByFlagDeleteIs(flagDelete);
		List<InputDetailDTO> result = new ArrayList<>();

		for (InputDetailEntity inputdetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputdetail));
		}
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return inputDetailRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<InputDetailEntity> list = inputDetailRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
				.getContent();
		List<InputDetailDTO> result = new ArrayList<>();

		for (InputDetailEntity inputdetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputdetail));
		}

		return result;
	}

	@Override
	public InputDetailDTO findOne(Long id) {
		return inputDetailConveter.convertToDTO(inputDetailRepository.getOne(id));
	}

	@Override
	public Boolean insert(InputDetailDTO inputDTO) {
		try {
			IngredientsEntity ingredientsEntity = ingredientsRepository.findOneByName(inputDTO.getIngredientName());
			UnitEntity unitEntity = unitRepository.findOneByUnitName(inputDTO.getUnitName());
			InputEntity inputEntity = inputRepository.findOneById(inputDTO.getInputID());
			
			InputDetailEntity inputDetailEntity = inputDetailConveter.convertToEntity(inputDTO);
			
			inputDetailEntity.setIngredients(ingredientsEntity);
			inputDetailEntity.setUnits(unitEntity);
			inputDetailEntity.setInputs(inputEntity);
			InputDetailEntity result = inputDetailRepository.save(inputDetailEntity);
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
	public Boolean update(InputDetailDTO inputDTO) {
		try {
			InputEntity inputEntity = inputRepository.getOne(inputDTO.getId());
			IngredientsEntity ingredientsEntity = ingredientsRepository.findOneByName(inputDTO.getIngredientName());
			UnitEntity unitEntity = unitRepository.findOneByUnitName(inputDTO.getUnitName());
			InputDetailEntity oldInputDetailEntity = inputDetailRepository.getOne(inputDTO.getId());
			InputDetailEntity newInputDetailEntity = inputDetailConveter.convertToEntity(inputDTO,oldInputDetailEntity);
			newInputDetailEntity.setIngredients(ingredientsEntity);
			newInputDetailEntity.setInputs(inputEntity);
			newInputDetailEntity.setUnits(unitEntity);
			InputDetailEntity result = inputDetailRepository.save(newInputDetailEntity);
			
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
			inputDetailRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
