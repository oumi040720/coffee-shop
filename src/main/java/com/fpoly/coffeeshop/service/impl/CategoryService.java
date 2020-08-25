package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.CategoryConveter;
import com.fpoly.coffeeshop.dto.CategoryDTO;
import com.fpoly.coffeeshop.entity.CategoryEntity;
import com.fpoly.coffeeshop.repository.ICategoryRepository;
import com.fpoly.coffeeshop.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {
	@Autowired
	private ICategoryRepository categoryRepository;
	@Autowired
	private CategoryConveter categoryConveter;
	@Override
	public List<CategoryDTO> findAll() {
		
		List<CategoryEntity> list = categoryRepository.findAll();
		List<CategoryDTO> result = new ArrayList<>();
		for(CategoryEntity category : list) {
			result.add(categoryConveter.convertToDTO(category));
		}
		
		return result;
	}

	@Override
	public List<CategoryDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<CategoryEntity> list = categoryRepository.findAllByFlagDeleteIs(flagDelete);
		List<CategoryDTO> result = new ArrayList<>();
		for(CategoryEntity category : list) {
			result.add(categoryConveter.convertToDTO(category));
		}
		
		return result;
	}

	@Override
	public CategoryDTO findOne(Integer id) {
		
		return categoryConveter.convertToDTO(categoryRepository.getOne(id));
	}

	@Override
	public CategoryDTO findOne(String categoryCode) {
		
		return categoryConveter.convertToDTO(categoryRepository.findOneByCategoryCode(categoryCode));
	}

	@Override
	public Boolean insert(CategoryDTO categoryDTO) {
		try {
			CategoryEntity resutl = categoryRepository.save(categoryConveter.convertToEntity(categoryDTO));
			if(resutl != null ) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean update(CategoryDTO categoryDTO) {
		
		try {
			CategoryEntity oldCategory = categoryRepository.getOne(categoryDTO.getId());
			CategoryEntity newCategory = categoryConveter.convertToEntity(categoryDTO,oldCategory);
			
			CategoryEntity result = categoryRepository.save(newCategory);
			if(result != null) {
				return true;
				
			}else {
				return false;
			}
		} catch (Exception e) {
			return false;		}
	}

	@Override
	public Boolean delete(Integer id) {
		try {
			categoryRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
	

}
