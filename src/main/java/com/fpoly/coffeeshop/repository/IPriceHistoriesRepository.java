package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.PriceHistoriesEntity;
@Repository
public interface IPriceHistoriesRepository extends JpaRepository<PriceHistoriesEntity, Integer> {

	public List<PriceHistoriesEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<PriceHistoriesEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	
}
