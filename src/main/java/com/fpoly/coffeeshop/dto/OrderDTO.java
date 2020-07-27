package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class OrderDTO {
	
	private Long id;
	
	private String fullname;
	
	private Date orderDate;
	
	private String orderCode;
	
	private Integer status;
	
	private Long customerCode;
	
	private Boolean flagDelete;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(Long customerCode) {
		this.customerCode = customerCode;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
	
	
}
