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
	public List<InputDetailDTO> findAllByInputId(@PathVariable("key") String inputCode){
		return detailService.findAllByInputId(inputCode);
	}
	
	@GetMapping(value = "/api/inputdetail/search_or/total_pages")
	public Integer getTotalPagesByInputId(@RequestParam("key") String inputCode, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPagesByInputId(inputCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/search_or/list")
	public List<InputDetailDTO> findAllByInputId(@RequestParam("key") String inputCode, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.findAllByInputId(inputCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/{flagDelete}/search_or/{key}")
	public List<InputDetailDTO> findAllByFlagDeleteAndInputId(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String inputCode) {
		return detailService.findAllByFlagDeleteAndInputId(flagDelete, inputCode);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/search_id/total_pages")
	public Integer getTotalPagesByFlagDeleteAndInputId(@RequestParam("key") String inputCode,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPagesByFlagDeleteAndInputId(flagDelete, inputCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/search_id/list")
	public List<InputDetailDTO> findAllByFlagDeleteAndInputId(@RequestParam("key") String inputCode,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.findAllByFlagDeleteAndInputId(flagDelete, inputCode, page - 1, limit);
	}
	
	
	@GetMapping(value = "/api/inputdetail/id/{id}")
	public InputDetailDTO findOne(@PathVariable("id") Long id) {
		return detailService.findOne(id);
	}
	
	@GetMapping(value = "/api/inputdetail/input/{input}")
	public InputDetailDTO findOne(@PathVariable("input") String  input) {
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
