package com.fpoly.coffeeshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "input_details")
public class InputDetailEntity {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "quantity")
	private Integer quantity;

	@Column(name = "price")
	private Long price;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "unit_id")
	@JsonManagedReference
	private UnitEntity unit;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ingredient_id")
	@JsonManagedReference
	private IngredientsEntity ingredient;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "input_id")
	@JsonManagedReference
	private InputEntity input;

	@Column(name = "flag_delete")
	private Boolean flagDelete;

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

	public UnitEntity getUnit() {
		return unit;
	}

	public void setUnit(UnitEntity unit) {
		this.unit = unit;
	}
	
	public IngredientsEntity getIngredient() {
		return ingredient;
	}

	public void setIngredient(IngredientsEntity ingredient) {
		this.ingredient = ingredient;
	}
	
	public InputEntity getInput() {
		return input;
	}

	public void setInput(InputEntity input) {
		this.input = input;
	}


	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
}
