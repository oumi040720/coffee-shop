package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.MenuDTO;
import com.fpoly.coffeeshop.service.IMenuService;

@RestController
public class MenuAPI {
	
	@Autowired
	private IMenuService menuService;
	
	@GetMapping(value = "/api/menu/list")
	public List<MenuDTO> findAll(){
		return menuService.findAll();
	}
	
	@GetMapping(value = "/api/menu/List/flag_delete/{flag_delete}")
	public List<MenuDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return menuService.findAllByFlagDeleteIs(flagDelete);
	}
	
	@GetMapping(value = "/api/menu/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
								 @RequestParam("limit") Integer limit) {
		return menuService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/menu/flag_delete/list")
	public List<MenuDTO> findAllByFlagDeleteIs(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
											   @RequestParam("limit") Integer limit){
		return menuService.findAllByFlagDeleteIs(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/menu/list/search/{key}")
	public List<MenuDTO> findAllByProductNameContaining(@PathVariable("key") String key){
		return menuService.findAllByProductNameContaining(key);
	}
	
	@GetMapping(value = "/api/menu/search/total_pages")
	public Integer getTotalPagesByProductNameContaining(@RequestParam("key") String key, @RequestParam("page") Integer page,
														@RequestParam("limit") Integer limit) {
		return menuService.getTotalPagesByProductNameContaining(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/menu/search/list")
	public List<MenuDTO> findAllByProductNameContaining(@RequestParam("key") String key, @RequestParam("page") Integer page,
														@RequestParam("limit") Integer limit){
		return menuService.findAllByProductNameContaining(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/menu/flag_delete/{flag_delete}/search/{key}")
	public List<MenuDTO> findAllByFlagDeleteAndProductNameContaining(@PathVariable("flag_delete") Boolean flagDelete, @PathVariable("key") String key){
		return menuService.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key);
	}
	
	@GetMapping(value = "/api/menu/flag_delete/search/total_pages")
	public Integer getTotalPagesByFlagDeleteAndProductNameContaining(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("key") String key,
																	 @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return menuService.getTotalPagesByFlagDeleteIsAndProductNameContaining(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/menu/flag_delete/search/list")
	public List<MenuDTO> findAllByFlagDeleteAndProductNameContaining(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("key") String key,
																	 @RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
		return menuService.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/menu/id/{id}")
	public MenuDTO findOne(@PathVariable("id") Integer id) {
		return menuService.findOne(id);
	}
	
	@GetMapping(value = "/api/menu/insert")
	public Boolean insert(@RequestBody MenuDTO menuDTO) {
		return menuService.insert(menuDTO);
	}
	
	@GetMapping(value = "/api/menu/update")
	public Boolean update(@RequestBody MenuDTO menuDTO, @RequestParam("id") Integer id) {
		menuDTO.setId(id);
		return menuService.update(menuDTO);
	}
	
	@GetMapping(value = "/api/menu/delete")
	public Boolean delete(@RequestParam("id") Integer id) {
		return menuService.delete(id);
	}
}
