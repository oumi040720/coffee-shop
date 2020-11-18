package com.fpoly.coffeeshop.entity;

import java.util.Date;
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
@Table(name = "coupons")
public class CouponEntity {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "coupon_code")
	private String couponCode;

	@Column(name = "discount")
	private String discount;

	@Column(name = "min_total_bill")
	private long minTotalBill;

	@Column(name = "max_discount")
	private String maxDiscount;

	@Column(name = "start_time")
	private Date startTime;

	@Column(name = "end_time")
	private Date endTime;

	@Column(name = "type")
	private String type;

	@Column(name = "flag_delete")
	private Boolean flagDelete;

	@OneToMany(mappedBy = "coupon", fetch = FetchType.LAZY)
	@JsonBackReference
	private List<OrderEntity> orders;

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

	public long getMinTotalBill() {
		return minTotalBill;
	}

	public void setMinTotalBill(long minTotalBill) {
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

	public List<OrderEntity> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderEntity> orders) {
		this.orders = orders;
	}

}
