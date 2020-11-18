package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CustomersEntity;
import com.fpoly.coffeeshop.entity.InputEntity;

@Repository
public interface IInputRepository extends JpaRepository<InputEntity, Long> {
	
	public InputEntity findOneByInputCode(String inputCode);

	public List<InputEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<InputEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<InputEntity> findAllByInputCodeContaining(String inputCode);
	
	public Page<InputEntity> findAllByInputCodeContaining(String inputCode, Pageable pageable);
	
	public List<InputEntity> findAllByFlagDeleteIsAndInputCodeContaining(Boolean flagDelete, String inputCode);
	
	public Page<InputEntity> findAllByFlagDeleteIsAndInputCodeContaining(Boolean flagDelete, String inputCode, Pageable pageable);
	
	
	public Page<InputEntity> findAllByFlagDeleteIsAndCustomer(Boolean flagDelete, CustomersEntity customer, Pageable pageable);
	
	
	
	@Query(value = "sp_inputDetailStatistic @year = ?1, @month = ?2", nativeQuery = true)
	public List<Long[]> getInputDetailStatistic(Integer year, Integer month);
	
	
	@Query(value = "sp_getTop4BestSeller", nativeQuery = true)
	public List<Object[]> getTop4BestSeller();
	
	
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
