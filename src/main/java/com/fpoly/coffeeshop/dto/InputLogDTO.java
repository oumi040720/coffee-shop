package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class InputLogDTO {
	
	private Long id;
	
	private Date createdDate;
	
	private String createdBy;
	
	private Date modifiedDate;
	
	private String modifiedBy;
	
	private Integer oldQuantity;
	
	private String oldProductID;
	
	private Long inputID;
	
	private Long inputDetailID;
	
	private Date oldInputDate;
	
	private String oldInputCode;
	
	private Integer oldStatus;
	
	private String oldCustomerID;
	
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

	public String getOldProductID() {
		return oldProductID;
	}

	public void setOldProductID(String oldProductID) {
		this.oldProductID = oldProductID;
	}

	public Long getInputID() {
		return inputID;
	}

	public void setInputID(Long inputID) {
		this.inputID = inputID;
	}

	public Long getInputDetailID() {
		return inputDetailID;
	}

	public void setInputDetailID(Long inputDetailID) {
		this.inputDetailID = inputDetailID;
	}

	public Date getOldInputDate() {
		return oldInputDate;
	}

	public void setOldInputDate(Date oldInputDate) {
		this.oldInputDate = oldInputDate;
	}

	public String getOldInputCode() {
		return oldInputCode;
	}

	public void setOldInputCode(String oldInputCode) {
		this.oldInputCode = oldInputCode;
	}

	public Integer getOldStatus() {
		return oldStatus;
	}

	public void setOldStatus(Integer oldStatus) {
		this.oldStatus = oldStatus;
	}

	public String getOldCustomerID() {
		return oldCustomerID;
	}

	public void setOldCustomerID(String oldCustomerID) {
		this.oldCustomerID = oldCustomerID;
	}

	public Boolean getOldFlagDelete() {
		return oldFlagDelete;
	}

	public void setOldFlagDelete(Boolean oldFlagDelete) {
		this.oldFlagDelete = oldFlagDelete;
	}

}
