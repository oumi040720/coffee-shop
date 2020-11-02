package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.CouponDTO;

public interface ICouponService {
	
	public List<CouponDTO> findAll();

	public List<CouponDTO> findAllByFlagDelete(Boolean flagDelete);
	

	public Integer getTotalPageByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	public List<CouponDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	
	public Integer getTotalPageByFlagDeleteAndType(Boolean flagDelete, String type, Integer page, Integer limit);
	
	public List<CouponDTO> findAllByFlagDeleteAndType(Boolean flagDelete, String type, Integer page, Integer limit);
	
	
	public CouponDTO findOne(Long id);

	public CouponDTO findOne(String couponCode);

	public Boolean insert(CouponDTO couponDTO);

	public Boolean update(CouponDTO couponDTO);

	public Boolean delete(Long id);
}
