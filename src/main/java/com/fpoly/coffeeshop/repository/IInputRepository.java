package com.fpoly.coffeeshop.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.InputEntity;
@Repository

	public interface IInputRepository extends JpaRepository<InputEntity, Integer> {
	
		public InputEntity findOneByInputDate(String inputDate);
		
		public List<InputEntity> findByFlagDeleteIs(Boolean flagDelete);
	
	}


