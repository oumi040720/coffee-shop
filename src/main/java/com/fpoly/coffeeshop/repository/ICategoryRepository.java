package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CategoryEntity;

@Repository
public interface ICategoryRepository extends JpaRepository<CategoryEntity, Integer> {

	public List<CategoryEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<CategoryEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<CategoryEntity> findAllByCategoryCodeContaining(String categoryCode);
	
	public Page<CategoryEntity> findAllByCategoryCodeContaining(String categoryCode, Pageable pageable);
	
}
