package com.fpoly.coffeeshop.repository;

import java.util.List;


import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.coffeeshop.entity.MenuLogEntity;



public interface IMenuLogRepository extends JpaRepository<MenuLogEntity, Long> {
	
	public List<MenuLogEntity> findAllByOldFlagDeleteIs(Boolean flagDelete);
	
	public List<MenuLogEntity> findAllByOldFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<MenuLogEntity> findAllByMenuId(Integer menuId);
	
	public List<MenuLogEntity> findAllByMenuId(Integer menuId, Pageable pageable);
	
	public List<MenuLogEntity> findAllByOldFlagDeleteIsAndMenuId(Boolean flagDelete, Integer menuId);
	
	public List<MenuLogEntity> findAllByOldFlagDeleteIsAndMenuId(Boolean flagDelete, Integer menuId, Pageable pageable);
}
