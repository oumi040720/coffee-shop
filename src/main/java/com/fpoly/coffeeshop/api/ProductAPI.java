package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.ProductDTO;
import com.fpoly.coffeeshop.service.IProductService;

@RestController
public class ProductAPI {
	
	@Autowired
	private IProductService productService;
	
	@GetMapping(value = "/api/product/list")
	public List<ProductDTO> findAll(){
		return productService.findAll();
	}
	
	@GetMapping(value = "/api/product/list/category_code/{category_code}")
	public List<ProductDTO> findAllByCategory(@PathVariable("category_code") String categoryCode){
		return productService.findAllByCategoryCode(categoryCode);
	}
	
	@GetMapping(value = "/api/product/list/flag_delete/{flag_delete}")
	public List<ProductDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return productService.findAllByFlagDeleteIs(flagDelete);
	}
	
	@GetMapping(value = "/api/product/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
								 @RequestParam("limit") Integer limit) {
		return productService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/product/flag_delete/list")
	public List<ProductDTO> findAllByFlagDeleteIs(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
											   @RequestParam("limit") Integer limit){
		return productService.findAllByFlagDeleteIs(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/product/list/search/{key}")
	public List<ProductDTO> findAllByProductNameContaining(@PathVariable("key") String key){
		return productService.findAllByProductNameContaining(key);
	}
	
	@GetMapping(value = "/api/product/search/total_pages")
	public Integer getTotalPagesByProductNameContaining(@RequestParam("key") String key, @RequestParam("page") Integer page,
														@RequestParam("limit") Integer limit) {
		return productService.getTotalPagesByProductNameContaining(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/product/search/list")
	public List<ProductDTO> findAllByProductNameContaining(@RequestParam("key") String key, @RequestParam("page") Integer page,
														@RequestParam("limit") Integer limit){
		return productService.findAllByProductNameContaining(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/product/flag_delete/{flag_delete}/search/{key}")
	public List<ProductDTO> findAllByFlagDeleteAndProductNameContaining(@PathVariable("flag_delete") Boolean flagDelete, @PathVariable("key") String key){
		return productService.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key);
	}
	
	@GetMapping(value = "/api/prodct/flag_delete/search/total_pages")
	public Integer getTotalPagesByFlagDeleteAndProductNameContaining(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("key") String key,
																	 @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return productService.getTotalPagesByFlagDeleteIsAndProductNameContaining(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/product/flag_delete/search/list")
	public List<ProductDTO> findAllByFlagDeleteAndProductNameContaining(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("key") String key,
																	 @RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
		return productService.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/product/id/{id}")
	public ProductDTO findOne(@PathVariable("id") Integer id) {
		return productService.findOne(id);
	}
	
	@GetMapping(value = "/api/product/insert")
	public Boolean insert(@RequestBody ProductDTO menuDTO) {
		return productService.insert(menuDTO);
	}
	
	@GetMapping(value = "/api/product/update")
	public Boolean update(@RequestBody ProductDTO menuDTO, @RequestParam("id") Integer id) {
		menuDTO.setId(id);
		return productService.update(menuDTO);
	}
	
	@GetMapping(value = "/api/product/delete")
	public Boolean delete(@RequestParam("id") Integer id) {
		return productService.delete(id);
	}
}
