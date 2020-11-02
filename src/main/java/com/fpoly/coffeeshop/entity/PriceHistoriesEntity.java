package com.fpoly.coffeeshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "price_histories")
public class PriceHistoriesEntity {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "start_date", columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDate;

	@Column(name = "end_date", columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endDate;

	@Column(name = "price")
	private Double price;

	@Column(name = "flag_delete")
	private Boolean flagDelete;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private ProductEntity product;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}

	public ProductEntity getproduct() {
		return product;
	}

	public void setproduct(ProductEntity product) {
		this.product = product;
	}

}
