package com.fpoly.coffeeshop.dto;

public class InputDetailDTO {
	
	private Integer id;
	
	private Integer quantity;
	
	private Integer price;
	
	private Integer unit_id;
	
	private Integer ingredient_id;
	
	private Integer input_id;

	private Boolean flagDelete = false;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public Integer getUnit() {
		return unit_id;
	}

	public void setUnit(Integer unit_id) {
		this.unit_id = unit_id;
	}
	
	public Integer getIngredient() {
		return ingredient_id;
	}

	public void setIngredient(Integer ingredient_id) {
		this.ingredient_id = ingredient_id;
	}
	
	public Integer getInput() {
		return input_id;
	}

	public void setInput(Integer input_id) {
		this.input_id = input_id;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
}
