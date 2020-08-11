package com.fpoly.coffeeshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.OrderDetailEntity;

@Repository
public interface IOrderDetailRepository extends JpaRepository<OrderDetailEntity, Long> {

//	public List<OrderDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete);
//
//	public Page<OrderDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
//	
//	
//	public List<OrderDetailEntity> findAllByCodeContaining(Long orderCode);
//
//	public Page<OrderDetailEntity> findAllByCodeContaining(Boolean flagDelete, Pageable pageable);
//	
//	
//	public List<OrderDetailEntity> findAllByFlagDeleteIsAndCodeContaining(Boolean flagDelete, Long orderCode);
//	
//	public Page<OrderDetailEntity> findAllByFlagDeleteIsAndCodeContaining(Boolean flagDelete, Long orderCode, Pageable pageable);
}
