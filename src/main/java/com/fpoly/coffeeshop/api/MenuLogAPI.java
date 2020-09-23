package com.fpoly.coffeeshop.api;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.MenuLogDTO;
import com.fpoly.coffeeshop.service.IMenuLogService;

@RestController
public class MenuLogAPI {
	
	@Autowired
	private IMenuLogService menuLogService;
	
	@GetMapping(value = "api/menu_log/list")
	public List<MenuLogDTO> findAll(){
		return menuLogService.findAll();
	}
	
	@GetMapping(value = "api/menu_log/list/old_flag_delete/{old_flag_delete}")
	public List<MenuLogDTO> findAllByOldFlagDeleteIs(@PathVariable("old_flag_delete") Boolean oldFlagDelete){
		return menuLogService.findAllByOldFlagDeleteIs(oldFlagDelete);
	}
	
	@GetMapping(value = "api/menu_log/old_flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("page") Integer page,
								 @RequestParam("limit") Integer limit) {
		return menuLogService.getTotalPages(oldFlagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "api/menu_log/old_flag_delete/list")
	public List<MenuLogDTO> findAllByOldFlagDeleteIs(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("page") Integer page,
								 					 @RequestParam("limit") Integer limit){
		return menuLogService.findAllByOldFlagDeleteIs(oldFlagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "api/menu_log/list/menu_id/{menu_id}")
	public List<MenuLogDTO> findAllByMenuId(@PathVariable("menu_id") Integer menuId){
		return menuLogService.findAllByMenuId(menuId);
	}
	
	@GetMapping(value = "api/menu_log/menu_id/total_pages")
	public Integer getTotalPagesByMenuId(@RequestParam("menu_id") Integer menuId, @RequestParam("page") Integer page,
								 		 @RequestParam("limit") Integer limit) {
		return menuLogService.getTotalPagesByMenuId(menuId, page - 1, limit);
	}
	
	@GetMapping(value = "api/menu_log/menu_id/list")
	public List<MenuLogDTO> findAllByMenuId(@RequestParam("menu_id") Integer menuId, @RequestParam("page") Integer page,
								 		 	@RequestParam("limit") Integer limit){
		return menuLogService.findAllByMenuId(menuId, page - 1, limit);
	}
	
	@GetMapping(value = "api/menu_log/list/old_flag_delete/{old_flag_delete}/menu_id/{menu_id}")
	public List<MenuLogDTO> findAllByOldFlagDeleteIsAndMenuId(@PathVariable("old_flag_delete") Boolean oldFlagDelete,
															  @PathVariable("menu_id") Integer menuId){
		return menuLogService.findAllByOldFlagDeleteIsAndMenuId(oldFlagDelete, menuId);
	}
	
	@GetMapping(value = "api/menu_log/old_flag_delete/menu_id/total_pages")
	public Integer getTotalPagesByOldFlagDeleteIsAndMenuId(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("menu_id") Integer menuId,
														   @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return menuLogService.getTotalPagesByOldFlagDeleteIsAndMenuId(oldFlagDelete, menuId, page - 1, limit);
	}
	
	@GetMapping(value = "api/menu_log/old_flag_delete/menu_id/list")
	public List<MenuLogDTO> findAllByOldFlagDeleteIsAndMenuId(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("menu_id") Integer menuId,
														   	  @RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
		return menuLogService.findAllByOldFlagDeleteIsAndMenuId(oldFlagDelete, menuId, page - 1, limit);
	}
	
	@GetMapping(value = "api/menu_log/insert")
	public Boolean insert(@RequestBody MenuLogDTO menuLogDTO) {
		return menuLogService.insert(menuLogDTO);
	}
	
	@GetMapping(value = "api/menu_log/delete")
	public Boolean delete(@RequestParam("id") Integer id) {
		return menuLogService.delete(id);
	}
}
