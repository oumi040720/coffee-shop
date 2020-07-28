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
public class PriceEntity {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "start_date", columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startdate;
	
	@Column(name = "end_date", columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date enddate;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "flag_delete")
	private Boolean flagdelete;
	
	@ManyToOne
	@JoinColumn(name = "menu_id")
	private MenuEntity MenuEntity;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Boolean getFlagdelete() {
		return flagdelete;
	}

	public void setFlagdelete(Boolean flagdelete) {
		this.flagdelete = flagdelete;
	}

	public MenuEntity getMenuEntity() {
		return MenuEntity;
	}

	public void setMenuEntity(MenuEntity menuEntity) {
		MenuEntity = menuEntity;
	}
	
	
}
