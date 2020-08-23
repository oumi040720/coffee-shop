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

import com.fpoly.coffeeshop.dto.UnitDTO;
import com.fpoly.coffeeshop.service.IUnitService;

@RestController
public class UnitsAPI {
	@Autowired
	private IUnitService unitService;
	@GetMapping(value = "/api/unit/list")
	public List<UnitDTO> findAll(){
		return unitService.findAll();
	}
	@GetMapping(value = "/api/unit/flag_delete/{flag_delete}")
	public List<UnitDTO> findAll(@PathVariable("flag_delete") Boolean flagDelete){
		return unitService.findAllbyFlagDelete(flagDelete);
		
	}
	@GetMapping(value = "api/unit/id{id}")
	public UnitDTO findOne(@PathVariable("id") Integer id) {
		return unitService.findOne(id);
	}
	@PostMapping(value = "api/unit/insert")
	public Boolean insert(@RequestBody UnitDTO unitDTO) {
		return unitService.insert(unitDTO);
	}
	@PutMapping(value = "api/unit/update")
	public Boolean update(@RequestBody UnitDTO unitDTO, @RequestParam("id") Integer id) {
		unitDTO.setId(id);
		return unitService.update(unitDTO);
	}
	@DeleteMapping(value = "api/unit/delete")
	public Boolean delete(@RequestParam("id") Integer id) {
		return unitService.delete(id);
	}
	
}
