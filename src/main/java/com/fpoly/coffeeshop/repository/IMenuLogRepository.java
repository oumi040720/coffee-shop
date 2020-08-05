package com.fpoly.coffeeshop.repository;

import java.util.List;


import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.coffeeshop.entity.MenuLogEntity;



public interface IMenuLogRepository extends JpaRepository<MenuLogEntity, Long> {
	
	public List<MenuLogEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public List<MenuLogEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
}
