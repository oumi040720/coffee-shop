package com.fpoly.coffeeshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_logs")
public class OrderLogEntity {
	
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
	
	@Column(name = "order_id")
	private Long orderID;
	
	
	@Column(name = "order_detail_id")
	private Long orderDetailId;
	
	
	@Column(name = "old_order_date")
	private Date oldOrderDate;
	
	@Column(name = "old_order_code")
	private String oldOrderCode;
	
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

	public Long getOrderID() {
		return orderID;
	}

	public void setOrderId(Long orderId) {
		this.orderID = orderId;
	}

	public Long getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(Long orderDetailId) {
		this.orderDetailId = orderDetailId;
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
