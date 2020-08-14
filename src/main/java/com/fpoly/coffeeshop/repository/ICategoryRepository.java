package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CategoryEntity;

@Repository
public interface ICategoryRepository extends JpaRepository<CategoryEntity, Integer> {

	
	public CategoryEntity findOneByCategoryCode(String categoryCode);
	
	public List<CategoryEntity> findAllByFlagDeleteIs(Boolean flagDelete);
}
