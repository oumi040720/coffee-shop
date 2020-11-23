package com.fpoly.coffeeshop.dto;

public class IngredientsDTO {

	
	private Integer id;
	
	private String name;
	 
	private Integer quantity;
	
	private Integer unitCode;
	
	private Boolean flagDelete;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public Integer getUnitCode() {
		return unitCode;
	}
	public void setUnitCode(Integer unitCode) {
		this.unitCode = unitCode;
	}
	public Boolean getFlagDelete() {
		return flagDelete;
	}
	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
	
	

}
