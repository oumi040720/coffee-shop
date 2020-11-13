package com.fpoly.coffeeshop.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CouponEntity;

@Repository
public interface ICouponRepository extends JpaRepository<CouponEntity, Long> {

	public CouponEntity findOneByCouponCode(String couponCode);
	
	public CouponEntity findOneByDiscount(String discount);
	
	public List<CouponEntity> findAllByFlagDelete(Boolean flagDelete);
	
	public Page<CouponEntity> findAllByFlagDelete(Boolean flagDelete, Pageable pageable);
	
	public Page<CouponEntity> findAllByFlagDeleteAndType(Boolean flagDelete, String type, Pageable pageable);
	
	@Query(value = "select * from coupons where start_time <= ?1 and end_time >= ?1 and flag_delete = ?2", nativeQuery = true)
	public List<CouponEntity> find(Date datenow, Boolean flagDelete);
	
}
