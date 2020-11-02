package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.MenuConverter;
import com.fpoly.coffeeshop.dto.ProductDTO;
import com.fpoly.coffeeshop.entity.CategoryEntity;
import com.fpoly.coffeeshop.entity.ProductEntity;
import com.fpoly.coffeeshop.repository.ICategoryRepository;
import com.fpoly.coffeeshop.repository.IProductRepository;
import com.fpoly.coffeeshop.service.IProductService;

@Service
public class ProductService implements IProductService {
	@Autowired
	private IProductRepository menuRepository;

	@Autowired
	private ICategoryRepository categoryRepository;

	@Autowired
	private MenuConverter menuConverter;

	@Override
	public List<ProductDTO> findAll() {
		List<ProductEntity> list = menuRepository.findAll();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity menu : list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}

	@Override
	public List<ProductDTO> findAllByCategoryCode(String categoryCode) {
		CategoryEntity categoryEntity = categoryRepository.findOneByCategoryCode(categoryCode);
		List<ProductEntity> list = menuRepository.findAllByCategory(categoryEntity);
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity menu : list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}

	@Override
	public List<ProductDTO> findAllByFlagDeleteIs(Boolean flagDelete) {
		List<ProductEntity> list = menuRepository.findAllByFlagDeleteIs(flagDelete);
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity menu : list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {

		return menuRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<ProductDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit) {
		List<ProductEntity> list = menuRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
				.getContent();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity menu : list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}

	@Override
	public List<ProductDTO> findAllByProductNameContaining(String key) {
		List<ProductEntity> list = menuRepository.findAllByProductNameContaining(key);
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity menu : list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByProductNameContaining(String key, Integer page, Integer limit) {
		return menuRepository.findAllByProductNameContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<ProductDTO> findAllByProductNameContaining(String key, Integer page, Integer limit) {
		List<ProductEntity> list = menuRepository.findAllByProductNameContaining(key, PageRequest.of(page, limit))
				.getContent();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity menu : list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}

	@Override
	public List<ProductDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key) {
		List<ProductEntity> list = menuRepository.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key);
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity menu : list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page,
			Integer limit) {
		return menuRepository
				.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, PageRequest.of(page, limit))
				.getTotalPages();
	}

	@Override
	public List<ProductDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page,
			Integer limit) {
		List<ProductEntity> list = menuRepository
				.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, PageRequest.of(page, limit))
				.getContent();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity menu : list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}

	@Override
	public ProductDTO findOne(Integer id) {
		return menuConverter.convertToDTO(menuRepository.getOne(id));
	}

	@Override
	public Boolean insert(ProductDTO categoryDTO) {
		try {
			CategoryEntity categoryEntity = categoryRepository.findOneByCategoryName(categoryDTO.getProductName());
			ProductEntity menuEntity = menuConverter.convertToEntity(categoryDTO);
			menuEntity.setCategory(categoryEntity);

			ProductEntity result = menuRepository.save(menuEntity);

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
	public Boolean update(ProductDTO menuDTO) {
		try {
			CategoryEntity categoryEntity = categoryRepository.findOneByCategoryName(menuDTO.getProductName());
			ProductEntity oldMenu = menuRepository.getOne(menuDTO.getId());
			ProductEntity newMenu = menuConverter.convertToEntity(menuDTO, oldMenu);
			newMenu.setCategory(categoryEntity);

			ProductEntity result = menuRepository.save(newMenu);
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
			menuRepository.deleteById(id);

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public ProductDTO findOne(String productName) {
		return menuConverter.convertToDTO(menuRepository.findOneByProductName(productName));
	}
}
