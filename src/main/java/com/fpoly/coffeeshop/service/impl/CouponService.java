package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.CouponConveter;
import com.fpoly.coffeeshop.dto.CouponDTO;
import com.fpoly.coffeeshop.entity.CouponEntity;
import com.fpoly.coffeeshop.repository.ICouponRepository;
import com.fpoly.coffeeshop.service.ICouponService;

@Service
public class CouponService implements ICouponService {

	@Autowired
	private ICouponRepository couponRepository;

	@Autowired
	private CouponConveter couponConveter;

	@Override
	public List<CouponDTO> findAll() {
		List<CouponEntity> list = couponRepository.findAll();
		List<CouponDTO> result = new ArrayList<>();

		for (CouponEntity coupon : list) {
			result.add(couponConveter.convertToDTO(coupon));
		}

		return result;
	}

	@Override
	public List<CouponDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<CouponEntity> list = couponRepository.findAllByFlagDelete(flagDelete);
		List<CouponDTO> result = new ArrayList<>();

		for (CouponEntity coupon : list) {
			result.add(couponConveter.convertToDTO(coupon));
		}

		return result;
	}

	@Override
	public Integer getTotalPageByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		return couponRepository.findAllByFlagDelete(flagDelete, PageRequest.of(page - 1, limit)).getTotalPages();
	}

	@Override
	public List<CouponDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<CouponEntity> list = couponRepository.findAllByFlagDelete(flagDelete, PageRequest.of(page - 1, limit))
				.getContent();
		List<CouponDTO> result = new ArrayList<>();

		for (CouponEntity coupon : list) {
			result.add(couponConveter.convertToDTO(coupon));
		}

		return result;
	}

	@Override
	public Integer getTotalPageByFlagDeleteAndType(Boolean flagDelete, String type, Integer page, Integer limit) {
		return couponRepository.findAllByFlagDeleteAndType(flagDelete, type, PageRequest.of(page - 1, limit))
				.getTotalPages();
	}

	@Override
	public List<CouponDTO> findAllByFlagDeleteAndType(Boolean flagDelete, String type, Integer page, Integer limit) {
		List<CouponEntity> list = couponRepository
				.findAllByFlagDeleteAndType(flagDelete, type, PageRequest.of(page - 1, limit)).getContent();
		List<CouponDTO> result = new ArrayList<>();

		for (CouponEntity coupon : list) {
			result.add(couponConveter.convertToDTO(coupon));
		}

		return result;
	}

	@Override
	public CouponDTO findOne(Long id) {
		try {
			return couponConveter.convertToDTO(couponRepository.getOne(id));
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public CouponDTO findOne(String couponCode) {
		try {
			return couponConveter.convertToDTO(couponRepository.findOneByCouponCode(couponCode));
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Boolean insert(CouponDTO couponDTO) {
		try {
			CouponEntity result = couponRepository.save(couponConveter.convertToEntity(couponDTO));

			if (result != null) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean update(CouponDTO couponDTO) {
		try {
			CouponEntity oldCoupon = couponRepository.getOne(couponDTO.getId());
			CouponEntity newCoupon = couponConveter.convertToEntity(couponDTO, oldCoupon);

			CouponEntity result = couponRepository.save(newCoupon);

			if (result != null) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean delete(Long id) {
		try {
			couponRepository.deleteById(id);

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public CouponDTO findOne1(String discount) {
		try {
			return couponConveter.convertToDTO(couponRepository.findOneByDiscount(discount));
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<CouponDTO> findAllDate(Date datenow, Boolean flagDelete) {
		List<CouponEntity> list = couponRepository.find(datenow, flagDelete);
				
		List<CouponDTO> result = new ArrayList<>();

		for (CouponEntity coupon : list) {
			result.add(couponConveter.convertToDTO(coupon));
		}

		return result;
	}

}
