package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.InputEntity;

@Repository
public interface IInputRepositoty extends JpaRepository<InputEntity, Long>{

	public List<InputEntity> findAllByFlagDeleteIs(Boolean flagDelete);

	public Page<InputEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public InputEntity findOneById(Long id);
	
	
	
}
