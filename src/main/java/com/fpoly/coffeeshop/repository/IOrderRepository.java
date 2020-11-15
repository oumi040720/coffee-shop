package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CustomersEntity;
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
	
	
	public Page<OrderEntity> findAllByFlagDeleteIsAndCustomer(Boolean flagDelete, CustomersEntity customer, Pageable pageable);
	
	
	
	@Query(value = "sp_orderDetailStatistic @year = ?1, @month = ?2", nativeQuery = true)
	public List<Long[]> getOrderDetailStatistic(Integer year, Integer month);
	
	@Query(value = "sp_getSalesEveryYear", nativeQuery = true)
	public List<Object[]> getSalesEveryYear();
	
	@Query(value = "sp_getSalesEveryMonthByYear @year = ?1", nativeQuery = true)
	public List<Object[]> getSalesEveryMonthByYear(Integer year);
	
	@Query(value = "sp_getSalesEveryDayByYearAndMonth @year = ?1, @month = ?2", nativeQuery = true)
	public List<Object[]> getSalesEveryDayByYearAndMonth(Integer year, Integer month);
	
	
	@Query(value = "sp_getSalesRateEveryMotnhInYear @year = ?1", nativeQuery = true)
	public List<Object[]> getSalesRateEveryMotnhInYear(Integer year);
	
	@Query(value = "sp_getSalesRateEveryDayInMonthOfYear @year = ?1, @month = ?2", nativeQuery = true)
	public List<Object[]> getSalesRateEveryDayInMonthOfYear(Integer year, Integer month);
	
}
