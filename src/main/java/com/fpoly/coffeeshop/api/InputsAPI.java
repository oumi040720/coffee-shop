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

import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.service.IInputService;

@RestController
public class InputsAPI {
	@Autowired
	private IInputService inputService;
	@GetMapping(value = "/api/input/list")
	public List<InputDTO> findAll(){
		return inputService.findAll();
	}
	@GetMapping(value = "/api/input/flag_delete/{flag_delete}")
	public List<InputDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return inputService.findAllbyFlagDelete(flagDelete);
		
	}
	@GetMapping(value = "api/input/id{id}")
	public InputDTO findOne(@PathVariable("id") Integer id) {
		return inputService.findOne(id);
	}
	@PostMapping(value = "api/input/insert")
	public Boolean insert(@RequestBody InputDTO inputDTO) {
		return inputService.insert(inputDTO);
	}
	@PutMapping(value = "api/input/update")
	public Boolean update(@RequestBody InputDTO inputDTO, @RequestParam("id") Integer id) {
		inputDTO.setId(id);
		return inputService.update(inputDTO);
	}
	@DeleteMapping(value = "api/input/delete")
	public Boolean delete(@RequestParam("id") Integer id) {
		return inputService.delete(id);
	}
	
}
