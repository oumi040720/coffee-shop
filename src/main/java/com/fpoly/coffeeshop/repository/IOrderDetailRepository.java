package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.OrderDetailEntity;
import com.fpoly.coffeeshop.entity.OrderEntity;

@Repository
public interface IOrderDetailRepository extends JpaRepository<OrderDetailEntity, Long> {
	
	public OrderDetailEntity findOneByOrder(String order);

	public List<OrderDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete);

	public Page<OrderDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	
	public List<OrderDetailEntity> findAllByOrder(OrderEntity order); 
	
	public Page<OrderDetailEntity> findAllByOrder(OrderEntity order, Pageable pageable);
	
	
	public List<OrderDetailEntity> findAllByFlagDeleteIsAndOrder(Boolean flagDelete, OrderEntity order);
	
	public Page<OrderDetailEntity> findAllByFlagDeleteIsAndOrder(Boolean flagDelete, OrderEntity order, Pageable pageable);
}
