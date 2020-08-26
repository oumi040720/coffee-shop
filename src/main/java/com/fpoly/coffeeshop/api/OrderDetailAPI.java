package com.fpoly.coffeeshop.api;

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

import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.service.IOrderDetailService;

@RestController
public class OrderDetailAPI {

	@Autowired
	private IOrderDetailService detailService;
	
	@GetMapping(value = "/api/orderdetail/list")
	public List<OrderDetailDTO> findAll(){
		return detailService.findAll();
	}
	
	@GetMapping(value = "/api/orderdetail/list/flag_delete/{flag_delete}")
	public List<OrderDetailDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return detailService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/orderdetail/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/orderdetail/flag_delete/list")
	public List<OrderDetailDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete,
			@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return detailService.findAllByFlagDelete(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/orderdetail/list/search_or/{key}")
	public List<OrderDetailDTO> findAllByOrderCode(@PathVariable("key") String orderCode){
		return detailService.findAllByOrderCode(orderCode);
	}
	
	@GetMapping(value = "/api/orderdetail/search_or/total_pages")
	public Integer getTotalPagesByOrderCode(@RequestParam("key") String orderCode, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPagesByOrderCode(orderCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/orderdetail/search_or/list")
	public List<OrderDetailDTO> findAllByOrderCode(@RequestParam("key") String orderCode, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.findAllByOrderCode(orderCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/orderdetail/flag_delete/{flagDelete}/search_or/{key}")
	public List<OrderDetailDTO> findAllByFlagDeleteAndOrderCode(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String orderCode) {
		return detailService.findAllByFlagDeleteAndOrderCode(flagDelete, orderCode);
	}
	
	@GetMapping(value = "/api/orderdetail/flag_delete/search_id/total_pages")
	public Integer getTotalPagesByFlagDeleteAndOrderCode(@RequestParam("key") String orderCode,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPagesByFlagDeleteAndOrderCode(flagDelete, orderCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/orderdetail/flag_delete/search_id/list")
	public List<OrderDetailDTO> findAllByFlagDeleteAndOrderCode(@RequestParam("key") String orderCode,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.findAllByFlagDeleteAndOrderCode(flagDelete, orderCode, page - 1, limit);
	}
	
	
	@GetMapping(value = "/api/orderdetail/id/{id}")
	public OrderDetailDTO findOne(@PathVariable("id") Long id) {
		return detailService.findOne(id);
	}
	
	@PostMapping(value = "/api/orderdetail/insert")
	public Boolean insert(@RequestBody OrderDetailDTO orderdetailDTO) {
		return detailService.insert(orderdetailDTO);
	}
	
	@PutMapping(value = "/api/orderdetail/update")
	public Boolean update(@RequestBody OrderDetailDTO orderdetailDTO, @RequestParam("id") Long id) {
		orderdetailDTO.setId(id);
		return detailService.update(orderdetailDTO);
	}
	
	@DeleteMapping(value = "/api/orderdetail/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return detailService.delete(id);
	}
}
