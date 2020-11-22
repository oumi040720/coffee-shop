package com.fpoly.coffeeshop.dto;

public class InputDTO {
   

	
	private Long id;
	
	private String InputName;
 
	private Boolean flagDelete;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getInputName() {
		return InputName;
	}
	public void setInputName(String inputName) {
		InputName = inputName;
	}
	public Boolean getFlagDelete() {
		return flagDelete;
	}
	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
	
	


}
