package com.fpoly.coffeeshop.repository;

import java.util.List;


import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.coffeeshop.entity.MenuLogEntity;



public interface IMenuLogRepository extends JpaRepository<MenuLogEntity, Long> {
	
	public List<MenuLogEntity> findAllByOldFlagDelete(Boolean flagDelete);
	
	public List<MenuLogEntity> findAllByOldFlagDelete(Boolean flagDelete, Pageable pageable);
	
	public List<MenuLogEntity> findAllByMenuID(Integer menuID);
	
	public List<MenuLogEntity> findAllByMenuID(Integer menuID, Pageable pageable);
	
	public List<MenuLogEntity> findAllByOldFlagDeleteAndMenuID(Boolean flagDelete, Integer menuID);
	
	public List<MenuLogEntity> findAllByOldFlagDeleteAndMenuID(Boolean flagDelete, Integer menuID, Pageable pageable);
}
