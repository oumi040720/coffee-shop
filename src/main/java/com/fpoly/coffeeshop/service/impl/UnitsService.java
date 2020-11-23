package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.UnitConveter;
import com.fpoly.coffeeshop.dto.UnitDTO;
import com.fpoly.coffeeshop.entity.UnitEntity;
import com.fpoly.coffeeshop.repository.IUnitRepository;
import com.fpoly.coffeeshop.service.IUnitService;

@Service
public class UnitsService implements IUnitService {

	
	@Autowired
	private IUnitRepository unitRepository;
	@Autowired
	private UnitConveter unitConveter;
	@Override
	public List<UnitDTO> findAll() {
		List<UnitEntity> list = unitRepository.findAll();
		List<UnitDTO> result = new ArrayList<>();
		for(UnitEntity unit : list) {
			result.add(unitConveter.ConvertToDTO(unit));
		}
		return result;
	}
	@Override
	public List<UnitDTO> findAllbyFlagDelete(Boolean flagDelete) {
		// TODO Auto-generated method stub
		List<UnitEntity> list = unitRepository.findByFlagDeleteIs(flagDelete);
		List<UnitDTO> result = new ArrayList<>();
		for(UnitEntity unit : list ) {
			result.add(unitConveter.ConvertToDTO(unit));
		}
		return result;
	}
	@Override
	public UnitDTO findOne(Integer id) {
		
		return unitConveter.ConvertToDTO(unitRepository.getOne(id));
	}
	
	@Override
	public Boolean insert(UnitDTO unitDTO) {
		try {
			UnitEntity result = unitRepository.save(unitConveter.convertToEntity(unitDTO));
			if (result != null) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public Boolean update(UnitDTO unitDTO) {
		try {
			UnitEntity oldUnit = unitRepository.getOne(unitDTO.getId());
			UnitEntity newUnit = unitConveter.convertToEntity(unitDTO,oldUnit);
			
			UnitEntity result = unitRepository.save(newUnit);
			if (result != null) {
				return true;  
				
			}else {
				return false;
			}
		} catch (Exception e) {
		return false;
		}
	}
	@Override
	public Boolean delete(Integer id) {
		try {
			unitRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public UnitDTO findOne(String unitName) {
		
		return unitConveter.ConvertToDTO(unitRepository.findOneByUnitName(unitName));
	}
	
	
	
	
	
	
}
