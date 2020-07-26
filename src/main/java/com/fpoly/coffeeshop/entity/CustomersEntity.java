package com.fpoly.coffeeshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "customers")
public class CustomersEntity {
	@Id
	@Column(name = "id")
	private long id;

	@Column(name = "fullname")
	private String fullname;

	@Column(name = "email")
	private String email;
	
	@Column(name = "phone")
	private String phone;

	@Column(name = "address")
	private String address;
	@OneToOne
	@JoinColumn(name = "users")
	@Column(name = "user_id")
	private long user_id;
	
	@Column(name = "flag_delete")
	private boolean flag_delete;

	
}
