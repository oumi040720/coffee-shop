package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class InputDetailDTO {
	
	private Long id;
	
	private Integer quantity;
	
	private Long price;
	
	private String unit;
	
	private String ingredient;
	
	private Date input;
	
	private Boolean flagDelete = false;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}
	
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public Date getInput() {
		return input;
	}

	public void setInput(Date input) {
		this.input = input;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
}
