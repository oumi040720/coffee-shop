package com.fpoly.coffeeshop.entity;


import java.util.Collection;

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
	private String productname;
	
	@Column(name = "photo")
	private String photo;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "flag_delete")
	private Boolean flagdelete;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Collection<CategoryEntity> CategoryEntity;
	
	@OneToMany(mappedBy = "PriceEntity", fetch = FetchType.EAGER )
	private Collection<MenuEntity> MenuEntity;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
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

	public Boolean getFlagdelete() {
		return flagdelete;
	}

	public void setFlagdelete(Boolean flagdelete) {
		this.flagdelete = flagdelete;
	}

	public Collection<CategoryEntity> getCategoryEntity() {
		return CategoryEntity;
	}

	public void setCategoryEntity(Collection<CategoryEntity> categoryEntity) {
		CategoryEntity = categoryEntity;
	}

	public Collection<MenuEntity> getMenuEntity() {
		return MenuEntity;
	}

	public void setMenuEntity(Collection<MenuEntity> menuEntity) {
		MenuEntity = menuEntity;
	}
	
	
}
	
	
	

