package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.OrderConveter;
import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.entity.CustomersEntity;
import com.fpoly.coffeeshop.entity.OrderEntity;
import com.fpoly.coffeeshop.repository.ICustomersRepository;
import com.fpoly.coffeeshop.repository.IOrderRepository;
import com.fpoly.coffeeshop.service.IOrderService;

@Service
public class OrderSevice implements IOrderService {

	@Autowired
	private IOrderRepository orderRepository;

	@Autowired
	private OrderConveter orderConveter;

	@Autowired
	private ICustomersRepository cusctomersRepository;

	@Override
	public List<OrderDTO> findAll() {
		List<OrderEntity> list = orderRepository.findAll();
		List<OrderDTO> result = new ArrayList<>();

		for (OrderEntity order : list) {
			result.add(orderConveter.convertToDTO(order));
		}
		return result;
	}

	@Override
	public List<OrderDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<OrderEntity> list = orderRepository.findAllByFlagDeleteIs(flagDelete);
		List<OrderDTO> result = new ArrayList<>();

		for (OrderEntity order : list) {
			result.add(orderConveter.convertToDTO(order));
		}
		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return orderRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<OrderDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<OrderEntity> list = orderRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit))
				.getContent();
		List<OrderDTO> result = new ArrayList<>();

		for (OrderEntity order : list) {
			result.add(orderConveter.convertToDTO(order));
		}
		return result;
	}

	@Override
	public List<OrderDTO> findAllByOrderCode(String key) {
		List<OrderEntity> list = orderRepository.findAllByOrderCodeContaining(key);
		List<OrderDTO> result = new ArrayList<>();

		for (OrderEntity order : list) {
			result.add(orderConveter.convertToDTO(order));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByOrderCode(String key, Integer page, Integer limit) {
		return orderRepository.findAllByOrderCodeContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<OrderDTO> findAllByOrderCode(String key, Integer page, Integer limit) {
		List<OrderEntity> list = orderRepository.findAllByOrderCodeContaining(key, PageRequest.of(page, limit))
				.getContent();
		List<OrderDTO> result = new ArrayList<>();

		for (OrderEntity order : list) {
			result.add(orderConveter.convertToDTO(order));
		}
		return result;
	}

	@Override
	public OrderDTO findOne(Long id) {
		return orderConveter.convertToDTO(orderRepository.getOne(id));
	}

	@Override
	public Boolean insert(OrderDTO customerDTO) {
		try {
			CustomersEntity customersEntity = cusctomersRepository.findOneByFullname(customerDTO.getFullname());
			OrderEntity orderEntity = orderConveter.convertToEntity(customerDTO);
			orderEntity.setCustomer(customersEntity);

			OrderEntity result = orderRepository.save(orderEntity);

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
	public Boolean update(OrderDTO orderDTO) {
		try {
			CustomersEntity customersEntity = cusctomersRepository.findOneByFullname(orderDTO.getFullname());
			OrderEntity oldOrder = orderRepository.getOne(orderDTO.getId());
			OrderEntity newOrder = orderConveter.convertToEntity(orderDTO, oldOrder);
			newOrder.setCustomer(customersEntity);

			OrderEntity result = orderRepository.save(newOrder);

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
			orderRepository.deleteById(id);

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<OrderDTO> findAllByFlagDeleteAndOrderCode(Boolean flagDelete, String key) {
		List<OrderEntity> list = orderRepository.findAllByFlagDeleteIsAndOrderCodeContaining(flagDelete, key);
		List<OrderDTO> result = new ArrayList<>();

		for (OrderEntity order : list) {
			result.add(orderConveter.convertToDTO(order));
		}
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndOrderCode(Boolean flagDelete, String key, Integer page, Integer limit) {
		return orderRepository.findAllByFlagDeleteIsAndOrderCodeContaining(flagDelete, key, PageRequest.of(page, limit))
				 .getTotalPages();
	}

	@Override
	public List<OrderDTO> findAllByFlagDeleteAndOrderCode(Boolean flagDelete, String key, Integer page, Integer limit) {
		List<OrderEntity> list  = orderRepository.findAllByFlagDeleteIsAndOrderCodeContaining(flagDelete, key, PageRequest.of(page, limit))
				.getContent();
		List<OrderDTO> result = new ArrayList<>();
		
		for(OrderEntity order : list) {
			result.add(orderConveter.convertToDTO(order));
		}
		return result;
	}

}
