package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.InputDetailConveter;
import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.entity.UnitEntity;
import com.fpoly.coffeeshop.entity.InputDetailEntity;
import com.fpoly.coffeeshop.entity.InputEntity;
import com.fpoly.coffeeshop.repository.IUnitRepository;
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
	private IUnitRepository menuRepository;

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
	public InputDetailDTO findOne(Integer id) {
		return inputDetailConveter.convertToDTO(inputDetailRepository.getOne(id));
	}

	@Override
	public Boolean insert(InputDetailDTO inputDTO) {
		try {
			UnitEntity menuEntity = menuRepository.findOneByUnitName(inputDTO.getUnit());
			InputEntity inputEntity = inputRepository.findOneByInputDate(inputDTO.getInputDate());
			InputDetailEntity inputDetailEntity = inputDetailConveter.convertToEntity(inputDTO);
			inputDetailEntity.setUnit(menuEntity);
			inputDetailEntity.setId(inputEntity);
			
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
	public Boolean update(InputDetailDTO inputdetailDTO) {
		try {
			UnitEntity menuEntity = menuRepository.findOneByUnitName(inputdetailDTO.getUnit());
			InputEntity inputEntity = inputRepository.findOneByInputDate(inputdetailDTO.getInputDate());
			InputDetailEntity oldInputDetailEntity = inputDetailRepository.getOne(inputdetailDTO.getId());
			InputDetailEntity newInputDetailEntity = inputDetailConveter.convertToEntity(inputdetailDTO,oldInputDetailEntity);
			newInputDetailEntity.setUnit(menuEntity);
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
	public Boolean delete(Integer id) {
		try {
			inputDetailRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public List<InputDetailDTO> findAllByInputDate(String inputDate) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		System.out.println(input);
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByInput(input);
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByInputDate(String inputDate, Integer page, Integer limit) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		return inputDetailRepository.findAllByInput(input,  PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDetailDTO> findAllByInputDate(String inputDate, Integer page, Integer limit) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByInput(input,PageRequest.of(page, limit)).getContent();
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(Boolean flagDelete, String inputDate) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByFlagDeleteIsAndInput(flagDelete, input);
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndInputDate(Boolean flagDelete, String inputDate, Integer page,
			Integer limit) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		return inputDetailRepository
				.findAllByFlagDeleteIsAndInput(flagDelete, input, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(Boolean flagDelete, String inputDate, Integer page,
			Integer limit) {
		InputEntity input = inputRepository.findOneByInputDate(inputDate);
		
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByFlagDeleteIsAndInput(flagDelete, input, PageRequest.of(page, limit)).getContent();
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public InputDetailDTO findOne(String inputDate) {
		return inputDetailConveter.convertToDTO(inputDetailRepository.findOneByInputDate(inputDate));
	}
	
}
