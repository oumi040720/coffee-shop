package com.fpoly.coffeeshop.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;


@Entity
@Table(name = "categories")
public class CategoryEntity {
	
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "category_name")
	private String categoryName;

	@Column(name = "category_code")
	private String categoryCode;

	@Column(name = "flag_delete")
	private Boolean flagDelete;
	

	@OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
	@JsonBackReference
	private List<MenuEntity> menu;

	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	public String getCategoryCode() {
		return categoryCode;
	}



	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}



	public Boolean getFlagDelete() {
		return flagDelete;
	}



	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}



	public List<MenuEntity> getMenu() {
		return menu;
	}



	public void setMenu(List<MenuEntity> menu) {
		this.menu = menu;
	}



}
