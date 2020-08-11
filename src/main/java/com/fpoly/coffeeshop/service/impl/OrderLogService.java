package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.OrderLogConveter;
import com.fpoly.coffeeshop.dto.OrderLogDTO;
import com.fpoly.coffeeshop.entity.OrderLogEntity;
import com.fpoly.coffeeshop.repository.IOrderLogRepository;
import com.fpoly.coffeeshop.service.IOrderLogService;

@Service
public class OrderLogService implements IOrderLogService{

	@Autowired
	private IOrderLogRepository orderLogRepository;
	
	@Autowired
	private OrderLogConveter orderLogConveter;

	@Override
	public List<OrderLogDTO> findAll() {
		List<OrderLogEntity> list = orderLogRepository.findAll();
		List<OrderLogDTO> result = new ArrayList<>();
		
		for (OrderLogEntity orderlog : list) {
			result.add(orderLogConveter.convertToDTO(orderlog));
		}
		
		return result;
	}

	@Override
	public List<OrderLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete) {
		List<OrderLogEntity> list = orderLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete);
		List<OrderLogDTO> result = new ArrayList<>();
		
		for (OrderLogEntity orderlog : list) {
			result.add(orderLogConveter.convertToDTO(orderlog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit) {
		return orderLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<OrderLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete, Integer page, Integer limit) {
		List<OrderLogEntity> list = orderLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete,PageRequest.of(page, limit)).getContent();
		List<OrderLogDTO> result = new ArrayList<>();
		
		for (OrderLogEntity orderlog : list) {
			result.add(orderLogConveter.convertToDTO(orderlog));
		}
		
		return result;
	}

	@Override
	public List<OrderLogDTO> findAllByOrderID(Long orderID) {
		List<OrderLogEntity> list = orderLogRepository.findAllByOrderID(orderID);
		List<OrderLogDTO> result = new ArrayList<>();
		
		for (OrderLogEntity orderlog : list) {
			result.add(orderLogConveter.convertToDTO(orderlog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByOrderID(Long orderID, Integer page, Integer limit) {
		return orderLogRepository.findAllByOrderID(orderID, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<OrderLogDTO> findAllByOrderID(Long orderID, Integer page, Integer limit) {
		List<OrderLogEntity> list = orderLogRepository.findAllByOrderID(orderID, PageRequest.of(page, limit)).getContent();
		List<OrderLogDTO> result = new ArrayList<>();
		
		for (OrderLogEntity orderlog : list) {
			result.add(orderLogConveter.convertToDTO(orderlog));
		}
		
		return result;
	}

	@Override
	public List<OrderLogDTO> findAllByOldFlagDeleteAndOrderID(Boolean oldFlagDelete, Long orderID) {
		List<OrderLogEntity> list = orderLogRepository.findAllByOldFlagDeleteIsAndOrderID(oldFlagDelete, orderID);
		List<OrderLogDTO> result = new ArrayList<>();
		
		for (OrderLogEntity orderlog : list) {
			result.add(orderLogConveter.convertToDTO(orderlog));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByOldFlagDeleteAndOrderID(Boolean oldFlagDelete, Long orderID, Integer page,
			Integer limit) {
		return orderLogRepository.findAllByOldFlagDeleteIsAndOrderID(oldFlagDelete, orderID, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<OrderLogDTO> findAllByOldFlagDeleteAndOrderID(Boolean oldFlagDelete, Long orderID, Integer page,
			Integer limit) {
		List<OrderLogEntity> list = orderLogRepository.findAllByOldFlagDeleteIsAndOrderID(oldFlagDelete, orderID, PageRequest.of(page, limit)).getContent();
		List<OrderLogDTO> result = new ArrayList<>();
		
		for (OrderLogEntity orderlog : list) {
			result.add(orderLogConveter.convertToDTO(orderlog));
		}
		
		return result;
	}

	@Override
	public Boolean insert(OrderLogDTO orderLogDTO) {
		try {
			OrderLogEntity result = orderLogRepository.save(orderLogConveter.convertToEntity(orderLogDTO));
			
			if (result != null) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean delete(Long id) {
		try {
			orderLogRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
