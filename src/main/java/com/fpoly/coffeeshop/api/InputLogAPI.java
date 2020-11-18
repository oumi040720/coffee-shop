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

import com.fpoly.coffeeshop.dto.InputLogDTO;
import com.fpoly.coffeeshop.service.IInputLogService;

@RestController
public class InputLogAPI {

	@Autowired
	private IInputLogService inputLogService;
	
	@GetMapping(value = "api/input_log/list")
	public List<InputLogDTO> findAll() {
		return inputLogService.findAll();
	}
	
	@GetMapping(value = "/api/input_log/list/old_flag_delete/{old_flag_delete}")
	public List<InputLogDTO> findAllByOldFlagDelete(@PathVariable("old_flag_delete") Boolean oldFlagDelete) {
		return inputLogService.findAllByOldFlagDelete(oldFlagDelete);
	}
	
	@GetMapping(value = "/api/input_log/old_flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("page") Integer page, 
								 @RequestParam("limit") Integer limit) {
		return inputLogService.getTotalPages(oldFlagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/input_log/old_flag_delete/list")
	public List<InputLogDTO> findAllByFlagDelete(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("page") Integer page, 
													@RequestParam("limit") Integer limit) {
		return inputLogService.findAllByOldFlagDelete(oldFlagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/input_log/list/input_id/{input_id}")
	public List<InputLogDTO> findAllByInputID(@PathVariable("input_id") Long inputID) {
		return inputLogService.findAllByInputID(inputID);
	}
	
	@GetMapping(value = "/api/input_log/input_id/total_pages")
	public Integer getTotalPagesByInputID(@RequestParam("input_id") Long inputID, @RequestParam("page") Integer page, 
											@RequestParam("limit") Integer limit) {
		return inputLogService.getTotalPagesByInputID(inputID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/input_log/input_id/list")
	public List<InputLogDTO> findAllByInputID(@RequestParam("input_id") Long inputID, @RequestParam("page") Integer page, 
												@RequestParam("limit") Integer limit) {
		return inputLogService.findAllByInputID(inputID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/input_log/list/old_flag_delete/{old_flag_delete}/input_id/{input_id}")
	public List<InputLogDTO> findAllByOldFlagDeleteAndInputID(@PathVariable("old_flag_delete") Boolean oldFlagDelete, 
															@PathVariable("input_id") Long inputID) {
		return inputLogService.findAllByOldFlagDeleteAndInputID(oldFlagDelete, inputID);
	}
	
	@GetMapping(value = "/api/input_log/old_flag_delete/input_id/total_pages")
	public Integer getTotalPagesByOldFlagDeleteAndInputID(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("input_id") Long inputID, 
														@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return inputLogService.getTotalPagesByOldFlagDeleteAndInputID(oldFlagDelete, inputID, page - 1, limit);
	}
	
	@GetMapping(value = "/api/input_log/old_flag_delete/input_id/list")
	public List<InputLogDTO> findAllByOldFlagDeleteAndInputID(@RequestParam("old_flag_delete") Boolean oldFlagDelete, @RequestParam("input_id") Long inputID, 
															@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return inputLogService.findAllByOldFlagDeleteAndInputID(oldFlagDelete, inputID, page - 1, limit);
	}
	
	@PostMapping(value = "/api/input_log/insert")
	public Boolean insert(@RequestBody InputLogDTO inputLogDTO) {
		return inputLogService.insert(inputLogDTO);
	}
	
	@DeleteMapping(value = "/api/input_log/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		
		return inputLogService.delete(id);
	}
}

