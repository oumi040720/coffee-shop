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
@Table(name = "ingredients")
public class IngredientsEntity {
	
	

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name= "quantity")
	private Integer quantity;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "unit_id")
	@JsonManagedReference
	private UnitEntity units;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "input_id")
	@JsonManagedReference
	private InputEntity inputs;

	@Column(name = "flag_delete")
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

	public UnitEntity getUnit() {
		return units;
	}

	public void setUnit(UnitEntity unit) {
		this.units = unit;
	}
	
	public InputEntity getInput() {
		return inputs;
	}

	public void setInput(InputEntity inputs) {
		this.inputs = inputs;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
	
	
}
