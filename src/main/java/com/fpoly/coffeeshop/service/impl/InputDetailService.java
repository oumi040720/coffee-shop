package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;	

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.InputDetailConveter;
import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.entity.ProductEntity;
import com.fpoly.coffeeshop.entity.UnitEntity;
import com.fpoly.coffeeshop.entity.IngredientsEntity;
import com.fpoly.coffeeshop.entity.InputDetailEntity;
import com.fpoly.coffeeshop.entity.InputEntity;
import com.fpoly.coffeeshop.entity.OrderDetailEntity;
import com.fpoly.coffeeshop.repository.IUnitRepository;
import com.fpoly.coffeeshop.repository.IIngredientsRepository;
import com.fpoly.coffeeshop.repository.IInputDetailRepository;
import com.fpoly.coffeeshop.repository.IInputRepository;
import com.fpoly.coffeeshop.service.IInputDetailService;

@Service
public class InputDetailService implements IInputDetailService {

	@Autowired
	private IInputDetailRepository inputDetailRepository;

	@Autowired
	private InputDetailConveter inputDetailConveter;

	@Autowired
	private IInputRepository inputRepository;
	
	@Autowired
	private IUnitRepository unitRepository;
	
	@Autowired
	private IIngredientsRepository ingredientRepository;

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
		List<InputDetailEntity> list = inputDetailRepository
				.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getContent();
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
			UnitEntity unitEntity = unitRepository.findOneByUnitName(inputDTO.getUnit());
			IngredientsEntity ingredientEntity = ingredientRepository.findOneByName(inputDTO.getIngredient());
			InputEntity inputEntity = inputRepository.findOneByInputDate(inputDTO.getInput());
			InputDetailEntity inputDetailEntity = inputDetailConveter.convertToEntity(inputDTO);
			inputDetailEntity.setUnit(unitEntity);
			inputDetailEntity.setIngredient(ingredientEntity);
			inputDetailEntity.setInput(inputEntity);
			
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
	public Boolean update(InputDetailDTO inputDetailDTO) {
		try {
			UnitEntity unitEntity = unitRepository.findOneByUnitName(inputDetailDTO.getUnit());
			IngredientsEntity ingredientEntity = ingredientRepository.findOneByName(inputDetailDTO.getIngredient());
			InputEntity inputEntity = inputRepository.findOneByInputDate(inputDetailDTO.getInput());
			InputDetailEntity oldInputDetailEntity = inputDetailRepository.getOne(inputDetailDTO.getId());
			InputDetailEntity newInputDetailEntity = inputDetailConveter.convertToEntity(inputDetailDTO, oldInputDetailEntity);
			newInputDetailEntity.setUnit(unitEntity);
			newInputDetailEntity.setIngredient(ingredientEntity);
			newInputDetailEntity.setInput(inputEntity);
			
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
	
	@Override
	public List<InputDetailDTO> findAllByInputDate(Date inputDate) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		System.out.println(input);
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByInput(input);
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	public Integer getTotalPagesByInputDate(Date inputDate, Integer page, Integer limit) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		return inputDetailRepository.findAllByInput(input,  PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDetailDTO> findAllByInputDate(Date inputDate, Integer page, Integer limit) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByInput(input,PageRequest.of(page, limit)).getContent();
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(Boolean flagDelete, Date inputDate) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByFlagDeleteIsAndInput(flagDelete, input);
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	public Integer getTotalPagesByFlagDeleteAndInputDate(Boolean flagDelete, Date inputDate, Integer page,Integer limit) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		return inputDetailRepository
				.findAllByFlagDeleteIsAndInput(flagDelete, input, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(Boolean flagDelete, Date inputDate, Integer page, Integer limit) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByFlagDeleteIsAndInput(flagDelete, input, PageRequest.of(page, limit)).getContent();
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public InputDetailDTO findOne(Date inputDate) {
		return inputDetailConveter.convertToDTO(inputDetailRepository.findOneByInput(inputDate));
	}
	
}
