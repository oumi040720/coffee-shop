package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CouponEntity;

@Repository
public interface ICouponRepository extends JpaRepository<CouponEntity, Long> {

	public CouponEntity findOneByCouponCode(String couponCode);
	
	public List<CouponEntity> findAllByFlagDelete(Boolean flagDelete);
	
	public Page<CouponEntity> findAllByFlagDelete(Boolean flagDelete, Pageable pageable);
	
	public Page<CouponEntity> findAllByFlagDeleteAndType(Boolean flagDelete, String type, Pageable pageable);
	
}
