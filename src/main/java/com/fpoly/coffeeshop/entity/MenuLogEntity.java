package com.fpoly.coffeeshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "menu_logs")
public class MenuLogEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private Integer id;
	
	@Column(name = "created_date")
	private Date createdDate;
	
	@Column(name = "created_by")
	private String createdBy;
	
	@Column(name = "modified_date")
	private Date modifiedDate;
	
	@Column(name = "modified_by")
	private String modifiedBy;
	
	@Column(name = "menu_Id")
	private Integer menuID;
	
	@Column(name = "old_product_name")
	private String oldProductName;
	
	@Column(name = "old_photo")
	private String oldPhoto;
	
	@Column(name = "old_price")
	private Double oldPrice;
	
	@Column(name = "old_flag_delete")
	private Boolean oldFlagDelete;
	
	@Column(name = "old_category_id")
	private Integer oldCategoryId;
	
	@Column(name = "old_category_name")
	private String oldCategoryName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public Integer getMenuID() {
		return menuID;
	}

	public void setMenuID(Integer menuID) {
		this.menuID = menuID;
	}

	public String getOldProductName() {
		return oldProductName;
	}

	public void setOldProductName(String oldProductName) {
		this.oldProductName = oldProductName;
	}

	public String getOldPhoto() {
		return oldPhoto;
	}

	public void setOldPhoto(String oldPhoto) {
		this.oldPhoto = oldPhoto;
	}

	public Double getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(Double oldPrice) {
		this.oldPrice = oldPrice;
	}

	public Boolean getOldFlagDelete() {
		return oldFlagDelete;
	}

	public void setOldFlagDelete(Boolean oldFlagDelete) {
		this.oldFlagDelete = oldFlagDelete;
	}

	public Integer getOldCategoryId() {
		return oldCategoryId;
	}

	public void setOldCategoryId(Integer oldCategoryId) {
		this.oldCategoryId = oldCategoryId;
	}

	public String getOldCategoryName() {
		return oldCategoryName;
	}

	public void setOldCategoryName(String oldCategoryName) {
		this.oldCategoryName = oldCategoryName;
	}

}
