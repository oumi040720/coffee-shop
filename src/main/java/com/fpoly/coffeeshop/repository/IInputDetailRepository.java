package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.InputDetailEntity;

@Repository
public interface IInputDetailRepository extends JpaRepository<InputDetailEntity, Long>{
	
	public List<InputDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete);

	public Page<InputDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);

}
