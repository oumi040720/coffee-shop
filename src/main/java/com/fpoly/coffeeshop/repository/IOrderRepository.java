package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.OrderEntity;


@Repository
public interface IOrderRepository extends JpaRepository<OrderEntity, Long> {
	
	public OrderEntity findOneByOrderCode(String orderCode);

	public List<OrderEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<OrderEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<OrderEntity> findAllByOrderCodeContaining(String orderCode);
	
	public Page<OrderEntity> findAllByOrderCodeContaining(String orderCode, Pageable pageable);
	
	public List<OrderEntity> findAllByFlagDeleteIsAndOrderCodeContaining(Boolean flagDelete, String orderCode);
	
	public Page<OrderEntity> findAllByFlagDeleteIsAndOrderCodeContaining(Boolean flagDelete, String orderCode, Pageable pageable);
}
