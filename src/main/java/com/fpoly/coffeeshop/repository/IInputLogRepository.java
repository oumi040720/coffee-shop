package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.InputLogEntity;

@Repository
public interface IInputLogRepository extends JpaRepository<InputLogEntity, Long> {

	public List<InputLogEntity> findAllByOldFlagDeleteIs(Boolean oldFlagDelete);

	public Page<InputLogEntity> findAllByOldFlagDeleteIs(Boolean oldFlagDelete, Pageable pageable);
	
	public List<InputLogEntity> findAllByInputID(Long inputId);
	
	public Page<InputLogEntity> findAllByInputID(Long inputId, Pageable pageable);
	
	public List<InputLogEntity> findAllByOldFlagDeleteIsAndInputID(Boolean oldFlagDelete, Long inputId);
	
	public Page<InputLogEntity> findAllByOldFlagDeleteIsAndInputID(Boolean oldFlagDelete, Long inputId, Pageable pageable);
	
}
