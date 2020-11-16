package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CategoryEntity;
import com.fpoly.coffeeshop.entity.ProductEntity;

@Repository
public interface IProductRepository extends JpaRepository<ProductEntity, Integer> {
	
	public List<ProductEntity> findAllByCategory(CategoryEntity categoryEntity);
	
	public Page<ProductEntity> findAllByFlagDeleteIsAndCategory(Boolean flagDelete, CategoryEntity categoryEntity, Pageable pageable);
	
	public ProductEntity findOneByProductName(String productName);
	
	public List<ProductEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<ProductEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<ProductEntity> findAllByProductNameContaining(String productName);
	
	public Page<ProductEntity> findAllByProductNameContaining(String productName, Pageable pageable);
	
	public List<ProductEntity> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String productName);
	
	public Page<ProductEntity> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String productName, Pageable pageable);
	
	
}
