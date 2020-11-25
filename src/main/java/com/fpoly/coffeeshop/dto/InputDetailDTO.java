package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class InputDetailDTO {
	
	private Long id;
	
	private Double quantity;
	
	private Long price;
	
	private String unitName;
	
	private String ingredientName;
	
	private Long inputID;
	
	private Boolean flagDelete;
	

	public Long getInputID() {
		return inputID;
	}
	public void setInputID(Long inputID) {
		this.inputID = inputID;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Boolean getFlagDelete() {
		return flagDelete;
	}
	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getIngredientName() {
		return ingredientName;
	}
	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}
}
