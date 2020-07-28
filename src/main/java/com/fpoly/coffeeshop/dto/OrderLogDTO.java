package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class OrderLogDTO {
	
	private Long id;
	
	private Date createdDate;
	
	private String createdBy;
	
	private Date modifiedDate;
	
	private String modifiedBy;
	
	private Integer oldQuantity;
	
	private Integer oldMenuId;
	
	private Long oldOrderId;
	
	private Date oldOrderDate;
	
	private String oldOrderCode;
	
	private Integer oldStatus;
	
	private Long oldCustomerId;
	
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

	public Integer getOldMenuId() {
		return oldMenuId;
	}

	public void setOldMenuId(Integer oldMenuId) {
		this.oldMenuId = oldMenuId;
	}

	public Long getOldOrderId() {
		return oldOrderId;
	}

	public void setOldOrderId(Long oldOrderId) {
		this.oldOrderId = oldOrderId;
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

	public Long getOldCustomerId() {
		return oldCustomerId;
	}

	public void setOldCustomerId(Long oldCustomerId) {
		this.oldCustomerId = oldCustomerId;
	}

	public Boolean getOldFlagDelete() {
		return oldFlagDelete;
	}

	public void setOldFlagDelete(Boolean oldFlagDelete) {
		this.oldFlagDelete = oldFlagDelete;
	}
}
