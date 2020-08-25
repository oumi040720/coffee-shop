package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.PriceHistoriesDTO;
import com.fpoly.coffeeshop.service.IPriceHistoriesService;

@RestController
public class PriceHistoriesAPI {
	
	@Autowired
	private IPriceHistoriesService priceHistoriesService;
	
	@GetMapping(value = "/api/price_histories/list")
	public List<PriceHistoriesDTO> findAll(){
		return priceHistoriesService.findAll();
	}
	
	@GetMapping(value = "/api/price_histories/list/flag_delete/{flag_delete}")
	public List<PriceHistoriesDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return priceHistoriesService.findAllByFlagDeleteIs(flagDelete);
	}
	
	@GetMapping(value = "/api/price_histories/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
								 @RequestParam("limit") Integer limit) {
		return priceHistoriesService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/price_histories/flag_delete/list")
	public List<PriceHistoriesDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
														@RequestParam("limit") Integer limit){
		return priceHistoriesService.findAllByFlagDeleteIs(flagDelete, page - 1, limit);											
	}
	
	@GetMapping(value = "/api/price_histories/id/{id}")
	public PriceHistoriesDTO findOne(@PathVariable("id") Integer id) {
		return priceHistoriesService.findOne(id);
	}
	
	@GetMapping(value = "/api/price_histories/insert")
	public Boolean insert(@RequestBody PriceHistoriesDTO priceHistoriesDTO) {
		return priceHistoriesService.insert(priceHistoriesDTO);
	}
	
	@GetMapping(value = "/api/price_histories/update")
	public Boolean update(@RequestBody PriceHistoriesDTO priceHistoriesDTO, @RequestParam("id") Integer id) {
		priceHistoriesDTO.setId(id);
		return priceHistoriesService.update(priceHistoriesDTO);
	}
	
	@GetMapping(value = "/api/price_histories/delete")
	public Boolean delete(@RequestParam("id") Integer id) {
		return priceHistoriesService.delete(id);
	}
}
