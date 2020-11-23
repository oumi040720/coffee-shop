package com.fpoly.coffeeshop.dto;

public class InputDetailDTO {
	
	private Long id;
	
	private Integer quantity;
	
	private Long price;
	
	private Integer unit_id;
	
	private Integer ingredient_id;
	
	private Integer input_id;

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
	
	public Integer getUnitId() {
		return unit_id;
	}

	public void setUnit(Integer unit_id) {
		this.unit_id = unit_id;
	}
	
	public Integer getIngredientId() {
		return ingredient_id;
	}

	public void setIngredient(Integer ingredient_id) {
		this.ingredient_id = ingredient_id;
	}
	
	public Integer getInputId() {
		return input_id;
	}

	public void setInputId(Integer input_id) {
		this.input_id = input_id;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
}
