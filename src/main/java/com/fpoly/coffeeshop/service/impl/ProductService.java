package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.ProductConverter;
import com.fpoly.coffeeshop.dto.ProductDTO;
import com.fpoly.coffeeshop.entity.CategoryEntity;
import com.fpoly.coffeeshop.entity.ProductEntity;
import com.fpoly.coffeeshop.repository.ICategoryRepository;
import com.fpoly.coffeeshop.repository.IProductRepository;
import com.fpoly.coffeeshop.service.IProductService;

@Service
public class ProductService implements IProductService {
	@Autowired
	private IProductRepository productRepository;

	@Autowired
	private ICategoryRepository categoryRepository;

	@Autowired
	private ProductConverter productConverter;

	@Override
	public List<ProductDTO> findAll() {
		List<ProductEntity> list = productRepository.findAll();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}

	@Override
	public List<ProductDTO> findAllByCategoryCode(String categoryCode) {
		CategoryEntity categoryEntity = categoryRepository.findOneByCategoryCode(categoryCode);
		List<ProductEntity> list = productRepository.findAllByCategory(categoryEntity);
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}

	@Override
	public List<ProductDTO> findAllByFlagDeleteIs(Boolean flagDelete) {
		List<ProductEntity> list = productRepository.findAllByFlagDeleteIs(flagDelete);
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {

		return productRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<ProductDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit) {
		List<ProductEntity> list = productRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
				.getContent();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}

	@Override
	public List<ProductDTO> findAllByProductNameContaining(String key) {
		List<ProductEntity> list = productRepository.findAllByProductNameContaining(key);
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByProductNameContaining(String key, Integer page, Integer limit) {
		return productRepository.findAllByProductNameContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<ProductDTO> findAllByProductNameContaining(String key, Integer page, Integer limit) {
		List<ProductEntity> list = productRepository.findAllByProductNameContaining(key, PageRequest.of(page, limit))
				.getContent();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}

	@Override
	public List<ProductDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key) {
		List<ProductEntity> list = productRepository.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key);
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page,
			Integer limit) {
		return productRepository
				.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, PageRequest.of(page, limit))
				.getTotalPages();
	}

	@Override
	public List<ProductDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page,
			Integer limit) {
		List<ProductEntity> list = productRepository
				.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, PageRequest.of(page, limit))
				.getContent();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndCategoryCode(Boolean flagDelete, String categoryCode, Integer page, Integer limit) {
		CategoryEntity categoryEntity = categoryRepository.findOneByCategoryCode(categoryCode);
		
		return productRepository.findAllByFlagDeleteIsAndCategory(flagDelete, categoryEntity, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public List<ProductDTO> findAllByFlagDeleteAndCategoryCode(Boolean flagDelete, String categoryCode, Integer page,
			Integer limit) {
		CategoryEntity categoryEntity = categoryRepository.findOneByCategoryCode(categoryCode);
		
		List<ProductEntity> list = productRepository
									.findAllByFlagDeleteIsAndCategory(flagDelete, categoryEntity, PageRequest.of(page, limit))
									.getContent();
		List<ProductDTO> result = new ArrayList<>();

		for (ProductEntity product : list) {
			result.add(productConverter.convertToDTO(product));
		}
		return result;
	}
	
	@Override
	public ProductDTO findOne(Integer id) {
		return productConverter.convertToDTO(productRepository.getOne(id));
	}

	@Override
	public Boolean insert(ProductDTO productDTO) {
		try {
			//fix findOneByCategoryName to findOneByCategoryCode
			CategoryEntity categoryEntity = categoryRepository.findOneByCategoryCode(productDTO.getCategoryCode());
			ProductEntity productEntity = productConverter.convertToEntity(productDTO);
			productEntity.setCategory(categoryEntity);

			ProductEntity result = productRepository.save(productEntity);

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
	public Boolean update(ProductDTO productDTO) {
		try {
			//fix findOneByCategoryName to findOneByCategoryCode
			CategoryEntity categoryEntity = categoryRepository.findOneByCategoryCode(productDTO.getCategoryCode());
			ProductEntity oldProduct = productRepository.getOne(productDTO.getId());
			ProductEntity newProduct = productConverter.convertToEntity(productDTO, oldProduct);
			newProduct.setCategory(categoryEntity);

			ProductEntity result = productRepository.save(newProduct);
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
			productRepository.deleteById(id);

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public ProductDTO findOne(String productName) {
		return productConverter.convertToDTO(productRepository.findOneByProductName(productName));
	}
}
