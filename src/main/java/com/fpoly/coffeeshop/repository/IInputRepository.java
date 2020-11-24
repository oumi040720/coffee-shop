package com.fpoly.coffeeshop.repository;
import java.util.List;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.InputEntity;
@Repository

	public interface IInputRepository extends JpaRepository<InputEntity, Long> {
	
		public InputEntity findOneByInputDate(Date inputDate);
		
		public List<InputEntity> findByFlagDeleteIs(Boolean flagDelete);
	
	}


