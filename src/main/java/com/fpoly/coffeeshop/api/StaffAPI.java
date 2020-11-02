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

import com.fpoly.coffeeshop.dto.StaffDTO;
import com.fpoly.coffeeshop.service.IStaffService;

@RestController
public class StaffAPI {

	@Autowired
	private IStaffService staffService;
	
	@GetMapping(value = "/api/staff/list")
	public List<StaffDTO> findAll() {
		return staffService.findAll();
	}
	
	@GetMapping(value = "/api/staff/list/flag_delete/{flag_delete}")
	public List<StaffDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete) {
		return staffService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/staff/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page, 
								 @RequestParam("limit") Integer limit) {
		return staffService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff/flag_delete/list")
	public List<StaffDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page, 
											@RequestParam("limit") Integer limit) {
		return staffService.findAllByFlagDelete(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff/list/search/{key}")
	public List<StaffDTO> findAllByKey(@PathVariable("key") String key) {
		return staffService.findAllByKey(key);
	}

	@GetMapping(value = "/api/staff/search/total_pages")
	public Integer getTotalPagesByKey(@RequestParam("key") String key, @RequestParam("page") Integer page, 
										@RequestParam("limit") Integer limit) {
		return staffService.getTotalPagesByKey(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff/search/list")
	public List<StaffDTO> findAllByKey(@RequestParam("key") String key, @RequestParam("page") Integer page, 
										@RequestParam("limit") Integer limit) {
		return staffService.findAllByKey(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff/flag_delete/search/total_pages")
	public Integer getTotalPagesByFlagDeleteAndKey(@RequestParam("key") String key, @RequestParam("flag_delete") Boolean flagDelete, 
													@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return staffService.getTotalPagesByKey(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff/flag_delete/search/list")
	public List<StaffDTO> findAllByFlagDeleteAndKey(@RequestParam("key") String key, @RequestParam("flag_delete") Boolean flagDelete,
													@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return staffService.search(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff/id/{id}")
	public StaffDTO findOne(@PathVariable("id") Long id) {
		return staffService.findOne(id);
	}

	@PostMapping(value = "/api/staff/insert")
	public StaffDTO insert(@RequestBody StaffDTO staffDTO) {
		return staffService.insert(staffDTO);
	}
	
	@PutMapping(value = "/api/staff/update")
	public Boolean update(@RequestBody StaffDTO staffDTO, @RequestParam("id") Long id) {
		staffDTO.setId(id);
		
		return staffService.update(staffDTO);
	}
	
	@DeleteMapping(value = "/api/staff/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return staffService.delete(id);
	}
	
}
