package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.OrderLogEntity;

@Repository
public interface IOrderLogRepository extends JpaRepository<OrderLogEntity, Long> {

	public List<OrderLogEntity> findAllByOldFlagDeleteIs(Boolean oldFlagDelete);

	public Page<OrderLogEntity> findAllByOldFlagDeleteIs(Boolean oldFlagDelete, Pageable pageable);
	
	public List<OrderLogEntity> findAllByOrderID(Long orderId);
	
	public Page<OrderLogEntity> findAllByOrderID(Long orderId, Pageable pageable);
	
	public List<OrderLogEntity> findAllByOldFlagDeleteIsAndOrderID(Boolean oldFlagDelete, Long orderId);
	
	public Page<OrderLogEntity> findAllByOldFlagDeleteIsAndOrderID(Boolean oldFlagDelete, Long orderId, Pageable pageable);
	
}
