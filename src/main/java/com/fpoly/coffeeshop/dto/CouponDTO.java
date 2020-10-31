package com.fpoly.coffeeshop.dto;

import java.util.Date;

public class CouponDTO {

	private Long id;

	private String couponCode;

	private String discount;

	private double minTotalBill;

	private String maxDiscount;

	private Date startTime;

	private Date endTime;

	private String type;

	private Boolean flagDelete;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public double getMinTotalBill() {
		return minTotalBill;
	}

	public void setMinTotalBill(double minTotalBill) {
		this.minTotalBill = minTotalBill;
	}

	public String getMaxDiscount() {
		return maxDiscount;
	}

	public void setMaxDiscount(String maxDiscount) {
		this.maxDiscount = maxDiscount;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}

}
