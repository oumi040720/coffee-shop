package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.service.IInputService;

@RestController
public class InputAPI {

	@Autowired
	private IInputService InputService;
	
	@GetMapping(value = "/api/Input/list")
	public List<InputDTO> findAll(){
		return InputService.findAll();
	}
	
	@GetMapping(value = "/api/Input/list/flag_delete/{flag_delete}")
	public List<InputDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return InputService.findAllByFlagDelete(flagDelete);
	}
	
	@GetMapping(value = "/api/Input/flag_delete/total_pages")
	public Integer getTotalPages(@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return InputService.getTotalPages(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "/api/Input/flag_delete/list")
	public List<InputDTO> findAllByFlagDelete(@RequestParam("flag_delete") Boolean flagDelete,
			@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
		return InputService.findAllByFlagDelete(flagDelete, page - 1, limit);
	}
	
	@GetMapping(value = "api/Input/list/search_o/{key}")
	public List<InputDTO> findAllByInputCode(@PathVariable("key") String key){
		return InputService.findAllByInputCode(key);
	}
	
	@GetMapping(value = "/api/Input/search_o/total_pages")
	public Integer getTotalPagesByInputCode(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return InputService.getTotalPagesByInputCode(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/Input/search_o/list")
	public List<InputDTO> findAllByInputCode(@RequestParam("key") String key, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return InputService.findAllByInputCode(key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/Input/flag_delete/{flagDelete}/search_o/{key}")
	public List<InputDTO> findAllByFlagDeleteAndInputCode(@PathVariable("flagDelete") Boolean flagDelete,
			@PathVariable("key") String key) {
		return InputService.findAllByFlagDeleteAndInputCode(flagDelete, key);
	}
	
	@GetMapping(value = "/api/Input/flag_delete/search_o/total_pages")
	public Integer getTotalPagesByFlagDeleteAndInputCode(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return InputService.getTotalPagesByFlagDeleteAndInputCode(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/Input/flag_delete/search_o/list")
	public List<InputDTO> findAllByFlagDeleteAndInputCode(@RequestParam("key") String key,
			@RequestParam("flag_delete") Boolean flagDelete, @RequestParam("page") Integer page,
			@RequestParam("limit") Integer limit) {
		return InputService.findAllByFlagDeleteAndInputCode(flagDelete, key, page - 1, limit);
	}
	
	@GetMapping(value = "/api/Input/id/{id}")
	public InputDTO findOne(@PathVariable("id") Long id) {
		return InputService.findOne(id);
	}
	
//	@PostMapping(value = "/api/Input/insert")
//	public Boolean insert(@RequestBody InputDTO InputDTO) {
//		return InputService.insert(InputDTO);
//	}
	
	@PutMapping(value = "/api/Input/update")
	public Boolean update(@RequestBody InputDTO InputDTO, @RequestParam("id") Long id) {
		InputDTO.setId(id);
		return InputService.update(InputDTO);
	}
	
	@DeleteMapping(value = "/api/Input/delete")
	public Boolean delete(@RequestParam("id") Long id) {
		return InputService.delete(id);
	}
	
}
