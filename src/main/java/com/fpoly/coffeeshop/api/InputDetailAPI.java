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

import com.fpoly.coffeeshop.dto.inputDetailDTO;
import com.fpoly.coffeeshop.service.IinputDetailService;

@RestController
public class inputDetailAPI {

	@Autowired
	private IinputDetailService detailService;
	
	@GetMapping(value = "/api/inputdetail/list")
	public List<inputDetailDTO> findAll(){
		return detailService.findAll();
	}
	
	@GetMapping(value = "/api/inputdetail/list/flag_delete/{flag_delete}")
	public List<inputDetailDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return detailService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/list")
	public List<inputDetailDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete,
			@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return detailService.findAllByFlagDelete(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/list/search_or/{key}")
	public List<inputDetailDTO> findAllByinputCode(@PathVariable("key") String inputCode){
		return detailService.findAllByinputCode(inputCode);
	}
	
	@GetMapping(value = "/api/inputdetail/search_or/total_pages")
	public Integer getTotalPagesByinputCode(@RequestParam("key") String inputCode, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPagesByinputCode(inputCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/search_or/list")
	public List<inputDetailDTO> findAllByinputCode(@RequestParam("key") String inputCode, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.findAllByinputCode(inputCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/{flagDelete}/search_or/{key}")
	public List<inputDetailDTO> findAllByFlagDeleteAndinputCode(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String inputCode) {
		return detailService.findAllByFlagDeleteAndinputCode(flagDelete, inputCode);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/search_id/total_pages")
	public Integer getTotalPagesByFlagDeleteAndinputCode(@RequestParam("key") String inputCode,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.getTotalPagesByFlagDeleteAndinputCode(flagDelete, inputCode, page - 1, limit);
	}
	
	@GetMapping(value = "/api/inputdetail/flag_delete/search_id/list")
	public List<inputDetailDTO> findAllByFlagDeleteAndinputCode(@RequestParam("key") String inputCode,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return detailService.findAllByFlagDeleteAndinputCode(flagDelete, inputCode, page - 1, limit);
	}
	
	
	@GetMapping(value = "/api/inputdetail/id/{id}")
	public inputDetailDTO findOne(@PathVariable("id") Long id) {
		return detailService.findOne(id);
	}
	
	@GetMapping(value = "/api/inputdetail/input/{input}")
	public inputDetailDTO findOne(@PathVariable("input") String  input) {
		return detailService.findOne(input);
	}
	
	@PostMapping(value = "/api/inputdetail/insert")
	public Boolean insert(@RequestBody inputDetailDTO inputdetailDTO) {
		return detailService.insert(inputdetailDTO);
	}
	
	@PutMapping(value = "/api/inputdetail/update")
	public Boolean update(@RequestBody inputDetailDTO inputdetailDTO, @RequestParam("id") Long id) {
		inputdetailDTO.setId(id);
		return detailService.update(inputdetailDTO);
	}
	
	@DeleteMapping(value = "/api/inputdetail/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return detailService.delete(id);
	}
}
