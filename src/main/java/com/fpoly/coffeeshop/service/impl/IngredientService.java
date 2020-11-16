package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.IngredientsConveter;
import com.fpoly.coffeeshop.dto.IngredientsDTO;
import com.fpoly.coffeeshop.entity.IngredientsEntity;
import com.fpoly.coffeeshop.repository.IIngredientsRepository;
import com.fpoly.coffeeshop.service.IIngredientService;

@Service
public class IngredientService implements IIngredientService {
	@Autowired
	private IngredientsConveter ingredientsConveter;
	@Autowired
	private IIngredientsRepository iIngredientsRepository;

	@Override
	public List<IngredientsDTO> findAll() {
		List<IngredientsEntity> list = iIngredientsRepository.findAll();
		List<IngredientsDTO> result = new ArrayList<>();
		for (IngredientsEntity ingredient : list) {
			result.add(ingredientsConveter.convertToDTO(ingredient));
		}
		return result;
	}

	@Override
	public List<IngredientsDTO> findAllByFlagDelete(Boolean flagDelete) {
		// TODO Auto-generated method stub
		List<IngredientsEntity> list = iIngredientsRepository.findByFlagDeleteIs(flagDelete);
		List<IngredientsDTO> result = new ArrayList<>();
		for (IngredientsEntity ingredient : list) {
			result.add(ingredientsConveter.convertToDTO(ingredient));
		}
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return iIngredientsRepository.findByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<IngredientsDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<IngredientsEntity> list = iIngredientsRepository
				.findByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getContent();
		List<IngredientsDTO> result = new ArrayList<>();
		for (IngredientsEntity ingredient : list) {
			result.add(ingredientsConveter.convertToDTO(ingredient));
		}
		return result;
	}

	@Override
	public List<IngredientsDTO> findAllByIngredientCode(String ingredientCode) {
		List<IngredientsEntity> list = iIngredientsRepository.findAllByName(ingredientCode);
		List<IngredientsDTO> result = new ArrayList<>();
		for (IngredientsEntity ingredient : list) {
			result.add(ingredientsConveter.convertToDTO(ingredient));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByIngredientCode(String ingredientCode, Integer page, Integer limit) {

		return iIngredientsRepository.findAllByName(ingredientCode, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<IngredientsDTO> findAllByIngredientCode(String ingredientCode, Integer page, Integer limit) {
		List<IngredientsEntity> list = iIngredientsRepository
				.findAllByName(ingredientCode, PageRequest.of(page, limit)).getContent();

		List<IngredientsDTO> result = new ArrayList<>();
		for (IngredientsEntity ingredient : list) {
			result.add(ingredientsConveter.convertToDTO(ingredient));
		}
		return result;
	}

	@Override
	public Boolean insert(IngredientsDTO ingredientDTO) {
		try {
			IngredientsEntity resutl = iIngredientsRepository.save(ingredientsConveter.convertToEntity(ingredientDTO));
			if (resutl != null) {
				return true;

			} else {
				return false;

			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean update(IngredientsDTO ingredientDTO) {
		try {

			IngredientsEntity oldIngredient = iIngredientsRepository.getOne(ingredientDTO.getId());
			IngredientsEntity newIngredient = ingredientsConveter.convetToEntity(ingredientDTO, oldIngredient);
			IngredientsEntity resutl = iIngredientsRepository.save(newIngredient);
			if (resutl != null) {
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
			iIngredientsRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public IngredientsDTO findOne(String name) {
		try {
			return ingredientsConveter.convertToDTO(iIngredientsRepository.findOneByName(name));
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public IngredientsDTO findOne(Long id) {

		return ingredientsConveter.convertToDTO(iIngredientsRepository.getOne(id));
	}

}
