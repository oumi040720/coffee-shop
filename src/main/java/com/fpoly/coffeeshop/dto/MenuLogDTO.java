package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class MenuLogDTO {
	
	private Integer id;
	
	private Date createdDate;
	
	private String createdBy;
	
	private Date modifiedDate;
	
	private String modifiedBy;
	
	private Long menuId;
	
	private String oldProductName;
	
	private String oldPhoto;
	
	private Double oldPrice;
	
	private Boolean oldFlagDelete;
	
	private Integer oldCategoryId;
	
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

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
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
