package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class InputDTO {
 
	private Long id;
	private Date inputDate;
	private Boolean flagDelete;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	public Boolean getFlagDelete() {
		return flagDelete;
	}
	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}
	
	
}
