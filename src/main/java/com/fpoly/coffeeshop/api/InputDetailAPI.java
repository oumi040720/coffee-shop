package com.fpoly.coffeeshop.api;

import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.service.IInputDetailService;

@RestController
public class InputDetailAPI {

	@Autowired
	private IInputDetailService detailService;
	
	@GetMapping(value = "/api/inputdetail/list")
	public List<InputDetailDTO> findAll(){
		return detailService.findAll();
	}
	
	@GetMapping(value = "/api/inputdetail/list/flag_delete/{flag_delete}")
	public List<InputDetailDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return detailService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/list")
	public List<InputDetailDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete,
			@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return detailService.findAllByFlagDelete(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/list/search_or/{key}")
	public List<InputDetailDTO> findAllByInputDate(@PathVariable("key") Date inputDate){
		return detailService.findAllByInputDate(inputDate);
	}
	
	@GetMapping(value = "/api/inputdetail/search_or/total_pages")
	public Integer getTotalPagesByInputDate(@RequestParam("key") Date inputDate, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPagesByInputDate(inputDate, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/search_or/list")
	public List<InputDetailDTO> findAllByInputDate(@RequestParam("key") Date inputDate, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.findAllByInputDate(inputDate, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/{flagDelete}/search_or/{key}")
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") Date inputDate) {
		return detailService.findAllByFlagDeleteAndInputDate(flagDelete, inputDate);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/search_id/total_pages")
	public Integer getTotalPagesByFlagDeleteAndInputDate(@RequestParam("key") Date inputDate,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPagesByFlagDeleteAndInputDate(flagDelete, inputDate, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/search_id/list")
	public List<InputDetailDTO> findAllByFlagDeleteAndInputDate(@RequestParam("key") Date inputDate,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.findAllByFlagDeleteAndInputDate(flagDelete, inputDate, page - 1, limit);
	}
	
	
	@GetMapping(value = "/api/inputdetail/id/{id}")
	public InputDetailDTO findOne(@PathVariable("id") Long id) {
		return detailService.findOne(id);
	}
	
	@GetMapping(value = "/api/inputdetail/input/{input}")
	public InputDetailDTO findOne(@PathVariable("input") Date  input) {
		return detailService.findOne(input);
	}
	
	@PostMapping(value = "/api/inputdetail/insert")
	public Boolean insert(@RequestBody InputDetailDTO inputdetailDTO) {
		return detailService.insert(inputdetailDTO);
	}
	
	@PutMapping(value = "/api/inputdetail/update")
	public Boolean update(@RequestBody InputDetailDTO inputdetailDTO, @RequestParam("id") Long id) {
		inputdetailDTO.setId(id);
		return detailService.update(inputdetailDTO);
	}
	
	@DeleteMapping(value = "/api/inputdetail/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return detailService.delete(id);
	}
}
