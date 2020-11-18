package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.InputDetailEntity;
import com.fpoly.coffeeshop.entity.InputEntity;

@Repository
public interface IInputDetailRepository extends JpaRepository<InputDetailEntity, Long> {
	
	public InputDetailEntity findOneByInput(String input);

	public List<InputDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete);

	public Page<InputDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	
	public List<InputDetailEntity> findAllByInput(InputEntity input); 
	
	public Page<InputDetailEntity> findAllByInput(InputEntity input, Pageable pageable);
	
	
	public List<InputDetailEntity> findAllByFlagDeleteIsAndInput(Boolean flagDelete, InputEntity input);
	
	public Page<InputDetailEntity> findAllByFlagDeleteIsAndInput(Boolean flagDelete, InputEntity input, Pageable pageable);
}
