package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.MenuEntity;
@Repository
public interface IMenuRepository extends JpaRepository<MenuEntity, Integer> {
	
	public List<MenuEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<MenuEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<MenuEntity> findAllByProductNameContaining(String productName);
	
	public Page<MenuEntity> findAllByProductNameContaining(String productName, Pageable pageable);
	
	public List<MenuEntity> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String productName);
	
	public Page<MenuEntity> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String productName, Pageable pageable);
	
	
}
