package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.coffeeshop.entity.PriceHistoriesEntity;

public interface IPriceHistoriesRepository extends JpaRepository<PriceHistoriesEntity, Long> {

	public List<PriceHistoriesEntity> findAllByFlagDelete(Boolean flagDelete);
	
	public List<PriceHistoriesEntity> findAllByFlagDelete(Boolean flagDelete, Pageable pageable);
	
	
}
