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
	
	@Column(name="quantity")
	private Double quantity;
	
	@Column(name = "price")
	private Long price;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "unit_id")
	@JsonManagedReference
	private UnitEntity units;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ingredient_id")
	@JsonManagedReference
	private IngredientsEntity ingredients;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "input_id")
	@JsonManagedReference
	private InputEntity inputs;
	
	@Column(name = "flag_delete")
	private Boolean flagDelete;

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

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public UnitEntity getUnits() {
		return units;
	}

	public void setUnits(UnitEntity units) {
		this.units = units;
	}

	public IngredientsEntity getIngredients() {
		return ingredients;
	}

	public void setIngredients(IngredientsEntity ingredients) {
		this.ingredients = ingredients;
	}

	public InputEntity getInputs() {
		return inputs;
	}

	public void setInputs(InputEntity inputs) {
		this.inputs = inputs;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
}
