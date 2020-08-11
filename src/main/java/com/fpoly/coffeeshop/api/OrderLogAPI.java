package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.OrderLogDTO;
import com.fpoly.coffeeshop.service.IOrderLogService;

@RestController
public class OrderLogAPI {

	@Autowired
	private IOrderLogService orderLogService;
	
	@GetMapping(value = "api/order_log/list")
	public List<OrderLogDTO> findAll() {
		return orderLogService.findAll();
	}
	
	@GetMapping(value = "/api/order_log/list/old_flag_delete/{old_flag_delete}")
	public List<OrderLogDTO> findAllByOldFlagDelete(@PathVariable("old_flag_delete") Boolean oldFlagDelete) {
		return orderLogService.findAllByOldFlagDelete(oldFlagDelete);
	}
	
	@GetMapping(value = "/api/order_log/old_flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("page") Integer page, 
								 @RequestParam("limit") Integer limit) {
		return orderLogService.getTotalPages(oldFlagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order_log/old_flag_delete/list")
	public List<OrderLogDTO> findAllByFlagDelete(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("page") Integer page, 
													@RequestParam("limit") Integer limit) {
		return orderLogService.findAllByOldFlagDelete(oldFlagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order_log/list/order_id/{order_id}")
	public List<OrderLogDTO> findAllByOrderID(@PathVariable("order_id") Long orderID) {
		return orderLogService.findAllByOrderID(orderID);
	}
	
	@GetMapping(value = "/api/order_log/order_id/total_pages")
	public Integer getTotalPagesByOrderID(@RequestParam("order_id") Long orderID, @RequestParam("page") Integer page, 
											@RequestParam("limit") Integer limit) {
		return orderLogService.getTotalPagesByOrderID(orderID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order_log/order_id/list")
	public List<OrderLogDTO> findAllByOrderID(@RequestParam("order_id") Long orderID, @RequestParam("page") Integer page, 
												@RequestParam("limit") Integer limit) {
		return orderLogService.findAllByOrderID(orderID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order_log/list/old_flag_delete/{old_flag_delete}/order_id/{order_id}")
	public List<OrderLogDTO> findAllByOldFlagDeleteAndOrderID(@PathVariable("old_flag_delete") Boolean oldFlagDelete, 
															@PathVariable("order_id") Long orderID) {
		return orderLogService.findAllByOldFlagDeleteAndOrderID(oldFlagDelete, orderID);
	}
	
	@GetMapping(value = "/api/order_log/old_flag_delete/order_id/total_pages")
	public Integer getTotalPagesByOldFlagDeleteAndOrderID(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("order_id") Long orderID, 
														@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return orderLogService.getTotalPagesByOldFlagDeleteAndOrderID(oldFlagDelete, orderID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order_log/old_flag_delete/order_id/list")
	public List<OrderLogDTO> findAllByOldFlagDeleteAndOrderID(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("order_id") Long orderID, 
															@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return orderLogService.findAllByOldFlagDeleteAndOrderID(oldFlagDelete, orderID, page - 1, limit);
	}
	
	@PostMapping(value = "/api/order_log/insert")
	public Boolean insert(@RequestBody OrderLogDTO orderLogDTO) {
		return orderLogService.insert(orderLogDTO);
	}
	
	@DeleteMapping(value = "/api/order_log/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		
		return orderLogService.delete(id);
	}
}

