package com.fpoly.coffeeshop.repository;

import org.springframework.data.domain.Pageable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.OrderDetailEntity;

@Repository
public interface IOrderDetailRepository extends JpaRepository<OrderDetailEntity, Long> {

	public List<OrderDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete);

	public Page<OrderDetailEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	
	public List<OrderDetailEntity> findAllByIdContaining(Long id);

	public Page<OrderDetailEntity> findAllByIdContaining(Long id, Pageable pageable);
	
	
	public List<OrderDetailEntity> findAllByFlagDeleteIsAndIdContaining(Boolean flagDelete, Long id);
	
	public Page<OrderDetailEntity> findAllByFlagDeleteIsAndIdContaining(Boolean flagDelete, Long id, Pageable pageable);
}
