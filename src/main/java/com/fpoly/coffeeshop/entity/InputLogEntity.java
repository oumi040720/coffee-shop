package com.fpoly.coffeeshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "input_logs")
public class InputLogEntity {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "created_date")
	private Date createdDate;
	
	@Column(name = "created_by")
	private String createdBy;
	
	@Column(name = "modified_date")
	private Date modifiedDate;
	
	@Column(name = "modified_by")
	private String modifiedBy;
	
	@Column(name = "old_quantity")
	private Integer oldQuantity;
	
	@Column(name = "old_menu_id")
	private String oldMenuId;
	
	@Column(name = "input_id")
	private Long inputID;
	
	
	@Column(name = "input_detail_id")
	private Long inputDetailId;
	
	
	@Column(name = "old_input_date")
	private Date oldInputDate;
	
	@Column(name = "old_input_code")
	private String oldInputCode;
	
	@Column(name = "old_status")
	private Integer oldStatus;
	
	@Column(name = "old_customer_id")
	private String oldCustomerId;
	
	@Column(name = "old_flag_delete")
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

	public String getOldMenuId() {
		return oldMenuId;
	}

	public void setOldMenuId(String oldMenuId) {
		this.oldMenuId = oldMenuId;
	}

	public Long getInputID() {
		return inputID;
	}

	public void setInputId(Long inputId) {
		this.inputID = inputId;
	}

	public Long getInputDetailId() {
		return inputDetailId;
	}

	public void setInputDetailId(Long inputDetailId) {
		this.inputDetailId = inputDetailId;
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

	public void setOldINputCode(String oldInputCode) {
		this.oldInputCode = oldInputCode;
	}

	public Integer getOldStatus() {
		return oldStatus;
	}

	public void setOldStatus(Integer oldStatus) {
		this.oldStatus = oldStatus;
	}

	public String getOldCustomerId() {
		return oldCustomerId;
	}

	public void setOldCustomerId(String oldCustomerId) {
		this.oldCustomerId = oldCustomerId;
	}

	public Boolean getOldFlagDelete() {
		return oldFlagDelete;
	}

	public void setOldFlagDelete(Boolean oldFlagDelete) {
		this.oldFlagDelete = oldFlagDelete;
	}

}
