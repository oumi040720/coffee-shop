package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class OrderLogDTO {
	
	private Long id;
	
	private Date createdDate;
	
	private String createdBy;
	
	private Date modifiedDate;
	
	private String modifiedBy;
	
	private Integer oldQuantity;
	
	private Integer oldMenuID;
	
	private Long orderID;
	
	private Long orderDetailID;
	
	private Date oldOrderDate;
	
	private String oldOrderCode;
	
	private Integer oldStatus;
	
	private Long oldCustomerID;
	
	private Boolean oldFlagDelete;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Integer getOldQuantity() {
		return oldQuantity;
	}

	public void setOldQuantity(Integer oldQuantity) {
		this.oldQuantity = oldQuantity;
	}

	public Integer getOldMenuID() {
		return oldMenuID;
	}

	public void setOldMenuID(Integer oldMenuID) {
		this.oldMenuID = oldMenuID;
	}

	public Long getOrderID() {
		return orderID;
	}

	public void setOrderID(Long orderID) {
		this.orderID = orderID;
	}

	public Long getOrderDetailID() {
		return orderDetailID;
	}

	public void setOrderDetailID(Long orderDetailID) {
		this.orderDetailID = orderDetailID;
	}

	public Date getOldOrderDate() {
		return oldOrderDate;
	}

	public void setOldOrderDate(Date oldOrderDate) {
		this.oldOrderDate = oldOrderDate;
	}

	public String getOldOrderCode() {
		return oldOrderCode;
	}

	public void setOldOrderCode(String oldOrderCode) {
		this.oldOrderCode = oldOrderCode;
	}

	public Integer getOldStatus() {
		return oldStatus;
	}

	public void setOldStatus(Integer oldStatus) {
		this.oldStatus = oldStatus;
	}

	public Long getOldCustomerID() {
		return oldCustomerID;
	}

	public void setOldCustomerID(Long oldCustomerID) {
		this.oldCustomerID = oldCustomerID;
	}

	public Boolean getOldFlagDelete() {
		return oldFlagDelete;
	}

	public void setOldFlagDelete(Boolean oldFlagDelete) {
		this.oldFlagDelete = oldFlagDelete;
	}

}
