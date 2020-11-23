package com.fpoly.coffeeshop.dto;

public class InputDetailDTO {
	
	private Long id;
	
	private Integer quantity;
	
	private Long price;
	
	private String unit;
	
	private String ingredient;
	
	private String input_id;

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
	
	public String getInput_Id() {
		return input_id;
	}

	public void setInput_Id(String input_id) {
		this.input_id = input_id;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
}
