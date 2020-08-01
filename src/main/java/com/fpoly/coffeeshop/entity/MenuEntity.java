package com.fpoly.coffeeshop.entity;

import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import javax.persistence.Table;

@Entity
@Table(name = "menu")
public class MenuEntity {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "product_name")
	private String productName;
	
	@Column(name = "photo")
	private String photo;

	@Column(name = "price")
	private Double price;

	@Column(name = "flag_delete")
	private Boolean flagDelete;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private List<CategoryEntity> categoryEntity;
	
	@OneToMany(mappedBy = "menu_id",fetch = FetchType.LAZY)
	private List<PriceHistoriesEntity> priceHistoriesEntity;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}

	public List<CategoryEntity> getCategoryEntity() {
		return categoryEntity;
	}

	public void setCategoryEntity(List<CategoryEntity> categoryEntity) {
		this.categoryEntity = categoryEntity;
	}

	public List<PriceHistoriesEntity> getPriceHistoriesEntity() {
		return priceHistoriesEntity;
	}

	public void setPriceHistoriesEntity(List<PriceHistoriesEntity> priceHistoriesEntity) {
		this.priceHistoriesEntity = priceHistoriesEntity;
	}

	

}
