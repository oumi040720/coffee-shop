package com.fpoly.coffeeshop.api;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.CouponDTO;
import com.fpoly.coffeeshop.service.ICouponService;

@RestController
public class CouponAPI {

	@Autowired
	private ICouponService couponService;
	
	@GetMapping(value = "/api/coupon/list")
	public List<CouponDTO> findAll() {
		return couponService.findAll();
	}
	
	@GetMapping(value = "/api/coupon/list/flag_delete/{flag_delete}")
	public List<CouponDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete) {
		return couponService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/coupon/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page, 
								 @RequestParam("limit") Integer limit) {
		return couponService.getTotalPageByFlagDelete(flagDelete, page, limit);
	}
	
	@GetMapping(value = "/api/coupon/flag_delete/list")
	public List<CouponDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page, 
												@RequestParam("limit") Integer limit) {
		return couponService.findAllByFlagDelete(flagDelete, page, limit);
	}
	
	@GetMapping(value = "/api/coupon/type/total_pages")
	public Integer getTotalPagesByType(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("type") String type, 
								@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return couponService.getTotalPageByFlagDeleteAndType(flagDelete, type, page, limit);
	}
	
	@GetMapping(value = "/api/coupon/type/list")
	public List<CouponDTO> findAllByType(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("type") String type, 
									@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return couponService.findAllByFlagDeleteAndType(flagDelete, type, page, limit);
	}
	
	@GetMapping(value = "/api/coupon/id/{id}")
	public CouponDTO findOne(@PathVariable("id") Long id) {
		return couponService.findOne(id);
	}
	
	@GetMapping(value = "/api/coupon/coupon_code/{coupon_code}")
	public CouponDTO findOne(@PathVariable("coupon_code") String couponCode) {
		return couponService.findOne(couponCode);
	}
	
	@GetMapping(value = "/api/coupon/discount/{discount}")
	public CouponDTO findOne1(@PathVariable("discount") String discount) {
		return couponService.findOne1(discount);
	}
	
	@PostMapping(value = "/api/coupon/insert")
	public Boolean insert(@RequestBody CouponDTO couponDTO) {
		return couponService.insert(couponDTO);
	}
	
	@PutMapping(value = "/api/coupon/update")
	public Boolean update(@RequestBody CouponDTO couponDTO, @RequestParam("id") Long id) {
		couponDTO.setId(id);
		
		return couponService.update(couponDTO);
	}
	
	@DeleteMapping(value = "/api/coupon/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return couponService.delete(id);
	}
	
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/api/coupon/{datenow}/{flagDelete}")
	public List<CouponDTO> findAllDate(@PathVariable("datenow") String datenow, @PathVariable("flagDelete") Boolean flagDelete) {
		return couponService.findAllDate(new Date(System.currentTimeMillis()), flagDelete);
	}
	
}
