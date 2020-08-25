package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.PriceHistoriesConverter;
import com.fpoly.coffeeshop.dto.PriceHistoriesDTO;
import com.fpoly.coffeeshop.entity.PriceHistoriesEntity;
import com.fpoly.coffeeshop.repository.IPriceHistoriesRepository;
import com.fpoly.coffeeshop.service.IPriceHistoriesService;

@Service
public class PriceHistoriesService implements IPriceHistoriesService {
	
	@Autowired
	private IPriceHistoriesRepository priceHistoriesRepository;
	
	@Autowired
	private PriceHistoriesConverter priceHistoriesConverter;
	
	@Override
	public List<PriceHistoriesDTO> findAll() {
		List<PriceHistoriesEntity> list = priceHistoriesRepository.findAll();
		List<PriceHistoriesDTO> result = new ArrayList<>();
		
		for(PriceHistoriesEntity priceHistories : list) {
			result.add(priceHistoriesConverter.converToDTO(priceHistories));
		}
		return result;
	}
	
	@Override
	public List<PriceHistoriesDTO> findAllByFlagDeleteIs(Boolean flagDelete) {
		List<PriceHistoriesEntity> list = priceHistoriesRepository.findAllByFlagDeleteIs(flagDelete);
		List<PriceHistoriesDTO> result = new ArrayList<>();
		
		for(PriceHistoriesEntity priceHistories : list) {
			result.add(priceHistoriesConverter.converToDTO(priceHistories));
		}
		return result;
	}
	
	@Override
	public List<PriceHistoriesDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit) {
		List<PriceHistoriesEntity> list = priceHistoriesRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getContent();
		List<PriceHistoriesDTO> result = new ArrayList<>();
		
		for(PriceHistoriesEntity priceHistories : list) {
			result.add(priceHistoriesConverter.converToDTO(priceHistories));
		}
		return result;
	}
	
	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return priceHistoriesRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public PriceHistoriesDTO findOne(Integer id) {
		return priceHistoriesConverter.converToDTO(priceHistoriesRepository.getOne(id));
	}
	
	@Override
	public Boolean insert(PriceHistoriesDTO priceHistoriesDTO) {
		try {
			PriceHistoriesEntity result = priceHistoriesRepository.save(priceHistoriesConverter.convertToEntity(priceHistoriesDTO));
			if(result != null) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public Boolean update(PriceHistoriesDTO priceHistoriesDTO) {
		try {
			PriceHistoriesEntity oldPriceHistories = priceHistoriesRepository.getOne(priceHistoriesDTO.getId());
			PriceHistoriesEntity newPriceHistories = priceHistoriesConverter.convertToEntity(priceHistoriesDTO, oldPriceHistories);
			PriceHistoriesEntity result = priceHistoriesRepository.save(newPriceHistories);
			
			if(result != null) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public Boolean delete(Integer id) {
		try {
			priceHistoriesRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
