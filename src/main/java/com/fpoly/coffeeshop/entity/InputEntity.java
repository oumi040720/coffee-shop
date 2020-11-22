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
@Table(name = "inputs")
public class InputEntity {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "input_name")
	private String inputName;

	@Column(name = "flag_delete")
	private Boolean flagDelete;

	@OneToMany(mappedBy = "inputs", fetch = FetchType.LAZY)
	@JsonBackReference
	private List<IngredientsEntity> ingredients;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}

	public List<IngredientsEntity> getIngredients() {
		return ingredients;
	}

	public void setIngredients(List<IngredientsEntity> ingredients) {
		this.ingredients = ingredients;
	}

}
