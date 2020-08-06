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

import com.fpoly.coffeeshop.dto.StaffLogDTO;
import com.fpoly.coffeeshop.service.IStaffLogService;

@RestController
public class StaffLogAPI {

	@Autowired
	private IStaffLogService staffLogService;
	
	@GetMapping(value = "/api/staff_log/list")
	public List<StaffLogDTO> findAll() {
		return staffLogService.findAll();
	}
	
	@GetMapping(value = "/api/staff_log/list/old_flag_delete/{old_flag_delete}")
	public List<StaffLogDTO> findAllByOldFlagDelete(@PathVariable("old_flag_delete") Boolean oldFlagDelete) {
		return staffLogService.findAllByOldFlagDelete(oldFlagDelete);
	}
	
	@GetMapping(value = "/api/staff_log/old_flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("page") Integer page, 
								 @RequestParam("limit") Integer limit) {
		return staffLogService.getTotalPages(oldFlagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff_log/old_flag_delete/list")
	public List<StaffLogDTO> findAllByFlagDelete(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("page") Integer page, 
													@RequestParam("limit") Integer limit) {
		return staffLogService.findAllByOldFlagDelete(oldFlagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff_log/list/staff_id/{staff_id}")
	public List<StaffLogDTO> findAllByStaffID(@PathVariable("staff_id") Long staffID) {
		return staffLogService.findAllByStaffID(staffID);
	}
	
	@GetMapping(value = "/api/staff_log/staff_id/total_pages")
	public Integer getTotalPagesByStaffID(@RequestParam("staff_id") Long staffID, @RequestParam("page") Integer page, 
											@RequestParam("limit") Integer limit) {
		return staffLogService.getTotalPagesByStaffID(staffID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff_log/staff_id/list")
	public List<StaffLogDTO> findAllByStaffID(@RequestParam("staff_id") Long staffID, @RequestParam("page") Integer page, 
												@RequestParam("limit") Integer limit) {
		return staffLogService.findAllByStaffID(staffID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff_log/list/old_flag_delete/{old_flag_delete}/staff_id/{staff_id}")
	public List<StaffLogDTO> findAllByFlagDeleteAndStaffID(@PathVariable("old_flag_delete") Boolean oldFlagDelete, 
															@PathVariable("staff_id") Long staffID) {
		return staffLogService.findAllByOldFlagDeleteAndStaffID(oldFlagDelete, staffID);
	}
	
	@GetMapping(value = "/api/staff_log/old_flag_delete/staff_id/total_pages")
	public Integer getTotalPagesByFlagDeleteAndStaffID(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("staff_id") Long staffID, 
														@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return staffLogService.getTotalPagesByOldFlagDeleteAndStaffID(oldFlagDelete, staffID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/staff_log/old_flag_delete/staff_id/list")
	public List<StaffLogDTO> findAllByFlagDeleteAndStaffID(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("staff_id") Long staffID, 
															@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return staffLogService.findAllByOldFlagDeleteAndStaffID(oldFlagDelete, staffID, page - 1, limit);
	}
	
	@PostMapping(value = "/api/staff_log/insert")
	public Boolean insert(@RequestBody StaffLogDTO staffLogDTO) {
		return staffLogService.insert(staffLogDTO);
	}
	
	@DeleteMapping(value = "/api/staff_log/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return staffLogService.delete(id);
	}
	
}
