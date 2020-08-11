package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.MenuLogEntity;

@Repository
public interface IMenuLogRepository extends JpaRepository<MenuLogEntity, Integer> {
	
	public List<MenuLogEntity> findAllByOldFlagDeleteIs(Boolean flagDelete);
	
	public Page<MenuLogEntity> findAllByOldFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<MenuLogEntity> findAllByMenuId(Integer menuId);
	
	public Page<MenuLogEntity> findAllByMenuId(Integer menuId, Pageable pageable);
	
	public List<MenuLogEntity> findAllByOldFlagDeleteIsAndMenuId(Boolean flagDelete, Integer menuId);
	
	public Page<MenuLogEntity> findAllByOldFlagDeleteIsAndMenuId(Boolean flagDelete, Integer menuId, Pageable pageable);
}
