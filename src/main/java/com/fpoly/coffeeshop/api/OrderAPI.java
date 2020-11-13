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

import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.service.IOrderService;

@RestController
public class OrderAPI {

	@Autowired
	private IOrderService orderService;
	
	@GetMapping(value = "/api/order/list")
	public List<OrderDTO> findAll(){
		return orderService.findAll();
	}
	
	@GetMapping(value = "/api/order/list/flag_delete/{flag_delete}")
	public List<OrderDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return orderService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/order/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return orderService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order/flag_delete/list")
	public List<OrderDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete,
			@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return orderService.findAllByFlagDelete(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "api/order/list/search_o/{key}")
	public List<OrderDTO> findAllByOrderCode(@PathVariable("key") String key){
		return orderService.findAllByOrderCode(key);
	}
	
	@GetMapping(value = "/api/order/search_o/total_pages")
	public Integer getTotalPagesByOrderCode(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return orderService.getTotalPagesByOrderCode(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order/search_o/list")
	public List<OrderDTO> findAllByOrderCode(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return orderService.findAllByOrderCode(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order/flag_delete/{flagDelete}/search_o/{key}")
	public List<OrderDTO> findAllByFlagDeleteAndOrderCode(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String key) {
		return orderService.findAllByFlagDeleteAndOrderCode(flagDelete, key);
	}
	
	@GetMapping(value = "/api/order/flag_delete/search_o/total_pages")
	public Integer getTotalPagesByFlagDeleteAndOrderCode(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return orderService.getTotalPagesByFlagDeleteAndOrderCode(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order/flag_delete/search_o/list")
	public List<OrderDTO> findAllByFlagDeleteAndOrderCode(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return orderService.findAllByFlagDeleteAndOrderCode(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/order/id/{id}")
	public OrderDTO findOne(@PathVariable("id") Long id) {
		return orderService.findOne(id);
	}
	
//	@PostMapping(value = "/api/order/insert")
//	public Boolean insert(@RequestBody OrderDTO orderDTO) {
//		return orderService.insert(orderDTO);
//	}
	
	@PutMapping(value = "/api/order/update")
	public Boolean update(@RequestBody OrderDTO orderDTO, @RequestParam("id") Long id) {
		orderDTO.setId(id);
		return orderService.update(orderDTO);
	}
	
	@DeleteMapping(value = "/api/order/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return orderService.delete(id);
	}
	
}
