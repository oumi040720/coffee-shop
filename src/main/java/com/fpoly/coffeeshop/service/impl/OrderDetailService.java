package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.OrderDetailConveter;
import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.entity.MenuEntity;
import com.fpoly.coffeeshop.entity.OrderDetailEntity;
import com.fpoly.coffeeshop.entity.OrderEntity;
import com.fpoly.coffeeshop.repository.IMenuRepository;
import com.fpoly.coffeeshop.repository.IOrderDetailRepository;
import com.fpoly.coffeeshop.repository.IOrderRepository;
import com.fpoly.coffeeshop.service.IOrderDetailService;

@Service
public class OrderDetailService implements IOrderDetailService {

	@Autowired
	private IOrderDetailRepository orderDetailRepository;

	@Autowired
	private OrderDetailConveter orderDetailConveter;

	@Autowired
	private IOrderRepository orderRepository;
	
	@Autowired
	private IMenuRepository menuRepository;

	@Override
	public List<OrderDetailDTO> findAll() {
		List<OrderDetailEntity> list = orderDetailRepository.findAll();
		List<OrderDetailDTO> result = new ArrayList<>();

		for (OrderDetailEntity orderdetail : list) {
			result.add(orderDetailConveter.convertToDTO(orderdetail));
		}

		return result;
	}

	@Override
	public List<OrderDetailDTO> findAllByFlagDelete(Boolean flagDelete) {
		List<OrderDetailEntity> list = orderDetailRepository.findAllByFlagDeleteIs(flagDelete);
		List<OrderDetailDTO> result = new ArrayList<>();

		for (OrderDetailEntity orderdetail : list) {
			result.add(orderDetailConveter.convertToDTO(orderdetail));
		}

		return result;
	}

	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		return orderDetailRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<OrderDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit) {
		List<OrderDetailEntity> list = orderDetailRepository
				.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getContent();
		List<OrderDetailDTO> result = new ArrayList<>();

		for (OrderDetailEntity orderdetail : list) {
			result.add(orderDetailConveter.convertToDTO(orderdetail));
		}

		return result;
	}
	
	@Override
	public OrderDetailDTO findOne(Long id) {
		return orderDetailConveter.convertToDTO(orderDetailRepository.getOne(id));
	}

	@Override
	public Boolean insert(OrderDetailDTO orderDTO) {
		try {
			MenuEntity menuEntity = menuRepository.findOneByProductName(orderDTO.getProduct());
			OrderEntity orderEntity = orderRepository.findOneByOrderCode(orderDTO.getOrder());
			OrderDetailEntity orderDetailEntity = orderDetailConveter.convertToEntity(orderDTO);
			orderDetailEntity.setMenu(menuEntity);
			orderDetailEntity.setOrder(orderEntity);
			
			OrderDetailEntity result = orderDetailRepository.save(orderDetailEntity);

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
	public Boolean update(OrderDetailDTO orderdetailDTO) {
		try {
			MenuEntity menuEntity = menuRepository.findOneByProductName(orderdetailDTO.getProduct());
			OrderEntity orderEntity = orderRepository.findOneByOrderCode(orderdetailDTO.getOrder());
			OrderDetailEntity oldOrderDetailEntity = orderDetailRepository.getOne(orderdetailDTO.getId());
			OrderDetailEntity newOrderDetailEntity = orderDetailConveter.convertToEntity(orderdetailDTO,oldOrderDetailEntity);
			newOrderDetailEntity.setMenu(menuEntity);
			newOrderDetailEntity.setOrder(orderEntity);
			
			OrderDetailEntity result = orderDetailRepository.save(newOrderDetailEntity);

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
			orderDetailRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public List<OrderDetailDTO> findAllByOrderCode(String orderCode) {
		OrderEntity order = orderRepository.findOneByOrderCode(orderCode);
		System.out.println(order);
		List<OrderDetailDTO> result = new ArrayList<>();
		List<OrderDetailEntity> list = orderDetailRepository.findAllByOrder(order);
		
		for (OrderDetailEntity orderDetail : list) {
			result.add(orderDetailConveter.convertToDTO(orderDetail));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByOrderCode(String orderCode, Integer page, Integer limit) {
		OrderEntity order = orderRepository.findOneByOrderCode(orderCode);
		return orderDetailRepository.findAllByOrder(order,  PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<OrderDetailDTO> findAllByOrderCode(String orderCode, Integer page, Integer limit) {
		OrderEntity order = orderRepository.findOneByOrderCode(orderCode);
		List<OrderDetailDTO> result = new ArrayList<>();
		List<OrderDetailEntity> list = orderDetailRepository.findAllByOrder(order,PageRequest.of(page, limit)).getContent();
		
		for (OrderDetailEntity orderDetail : list) {
			result.add(orderDetailConveter.convertToDTO(orderDetail));
		}
		
		return result;
	}

	@Override
	public List<OrderDetailDTO> findAllByFlagDeleteAndOrderCode(Boolean flagDelete, String orderCode) {
		OrderEntity order = orderRepository.findOneByOrderCode(orderCode);
		
		List<OrderDetailDTO> result = new ArrayList<>();
		List<OrderDetailEntity> list = orderDetailRepository.findAllByFlagDeleteIsAndOrder(flagDelete, order);
		
		for (OrderDetailEntity orderDetail : list) {
			result.add(orderDetailConveter.convertToDTO(orderDetail));
		}
		
		return result;
	}

	@Override
	public Integer getTotalPagesByFlagDeleteAndOrderCode(Boolean flagDelete, String orderCode, Integer page,
			Integer limit) {
		OrderEntity order = orderRepository.findOneByOrderCode(orderCode);
		return orderDetailRepository
				.findAllByFlagDeleteIsAndOrder(flagDelete, order, PageRequest.of(page, limit)).getTotalPages();
	}

	@Override
	public List<OrderDetailDTO> findAllByFlagDeleteAndOrderCode(Boolean flagDelete, String orderCode, Integer page,
			Integer limit) {
		OrderEntity order = orderRepository.findOneByOrderCode(orderCode);
		
		List<OrderDetailDTO> result = new ArrayList<>();
		List<OrderDetailEntity> list = orderDetailRepository.findAllByFlagDeleteIsAndOrder(flagDelete, order, PageRequest.of(page, limit)).getContent();
		
		for (OrderDetailEntity orderDetail : list) {
			result.add(orderDetailConveter.convertToDTO(orderDetail));
		}
		
		return result;
	}

	@Override
	public OrderDetailDTO findOne(String order) {
		return orderDetailConveter.convertToDTO(orderDetailRepository.findOneByOrder(order));
	}
	
}
