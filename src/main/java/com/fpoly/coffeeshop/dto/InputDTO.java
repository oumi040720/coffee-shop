package com.fpoly.coffeeshop.dto;

public class InputDTO {
   

	
	private Long id;
	
	private String InputDate;
 
	private Boolean flagDelete;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getInputDate() {
		return InputDate;
	}
	public void setInputDate(String inputDate) {
		InputDate = inputDate;
	}
	public Boolean getFlagDelete() {
		return flagDelete;
	}
	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
	
	


}
