package com.fpoly.coffeeshop.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.UnitEntity;
@Repository

	public interface IUnitRepository extends JpaRepository<UnitEntity, Integer> {
	
		public UnitEntity findOneByUnitName(String unitName);
		
		public List<UnitEntity> findByFlagDeleteIs(Boolean flagDelete);
	
	}


