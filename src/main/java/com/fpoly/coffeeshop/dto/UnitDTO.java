package com.fpoly.coffeeshop.dto;

public class UnitDTO {
   

	
	private Integer id;
	
	private String UnitName;
 
	private Boolean flagDelete;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUnitName() {
		return UnitName;
	}
	public void setUnitName(String unitName) {
		UnitName = unitName;
	}
	public Boolean getFlagDelete() {
		return flagDelete;
	}
	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
	
	


}
