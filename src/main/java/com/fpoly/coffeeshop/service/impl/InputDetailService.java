package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.InputDetailConveter;
import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.entity.ProductEntity;
import com.fpoly.coffeeshop.entity.InputDetailEntity;
import com.fpoly.coffeeshop.entity.InputEntity;
import com.fpoly.coffeeshop.repository.IProductRepository;
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
	private IProductRepository menuRepository;

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
			ProductEntity menuEntity = menuRepository.findOneByProductName(inputDTO.getProduct());
			InputEntity inputEntity = inputRepository.findOneByInputCode(inputDTO.getInput());
			InputDetailEntity inputDetailEntity = inputDetailConveter.convertToEntity(inputDTO);
			inputDetailEntity.setProduct(menuEntity);
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
	public Boolean update(InputDetailDTO inputdetailDTO) {
		try {
			ProductEntity menuEntity = menuRepository.findOneByProductName(inputdetailDTO.getProduct());
			InputEntity inputEntity = inputRepository.findOneByInputCode(inputdetailDTO.getInput());
			InputDetailEntity oldInputDetailEntity = inputDetailRepository.getOne(inputdetailDTO.getId());
			InputDetailEntity newInputDetailEntity = inputDetailConveter.convertToEntity(inputdetailDTO,oldInputDetailEntity);
			newInputDetailEntity.setProduct(menuEntity);
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
	public List<InputDetailDTO> findAllByInputCode(String inputCode) {
		InputEntity input = inputRepository.findOneByInputCode(inputCode);
		System.out.println(input);
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByInput(input);
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByInputCode(String inputCode, Integer page, Integer limit) {
		InputEntity input = inputRepository.findOneByInputCode(inputCode);
		return inputDetailRepository.findAllByInput(input,  PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDetailDTO> findAllByInputCode(String inputCode, Integer page, Integer limit) {
		InputEntity input = inputRepository.findOneByInputCode(inputCode);
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByInput(input,PageRequest.of(page, limit)).getContent();
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public List<InputDetailDTO> findAllByFlagDeleteAndInputCode(Boolean flagDelete, String inputCode) {
		InputEntity input = inputRepository.findOneByInputCode(inputCode);
		
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByFlagDeleteIsAndInput(flagDelete, input);
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndInputCode(Boolean flagDelete, String inputCode, Integer page,
			Integer limit) {
		InputEntity input = inputRepository.findOneByInputCode(inputCode);
		return inputDetailRepository
				.findAllByFlagDeleteIsAndInput(flagDelete, input, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<InputDetailDTO> findAllByFlagDeleteAndInputCode(Boolean flagDelete, String inputCode, Integer page,
			Integer limit) {
		InputEntity input = inputRepository.findOneByInputCode(inputCode);
		
		List<InputDetailDTO> result = new ArrayList<>();
		List<InputDetailEntity> list = inputDetailRepository.findAllByFlagDeleteIsAndInput(flagDelete, input, PageRequest.of(page, limit)).getContent();
		
		for (InputDetailEntity inputDetail : list) {
			result.add(inputDetailConveter.convertToDTO(inputDetail));
		}
		
		return result;
	}

	@Override
	public InputDetailDTO findOne(String input) {
		return inputDetailConveter.convertToDTO(inputDetailRepository.findOneByInput(input));
	}
	
}
