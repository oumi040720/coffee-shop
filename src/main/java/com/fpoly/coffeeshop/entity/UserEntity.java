package com.fpoly.coffeeshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "users")
public class UserEntity {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id")
	@JsonManagedReference
	private RoleEntity role;

	@OneToOne(mappedBy = "user")
	private StaffEntity staff;

	@Column(name = "flag_delete")
	private Boolean flagDelete;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public RoleEntity getRole() {
		return role;
	}

	public void setRole(RoleEntity role) {
		this.role = role;
	}

	public StaffEntity getStaff() {
		return staff;
	}

	public void setStaff(StaffEntity staff) {
		this.staff = staff;
	}

	public Boolean getFlagDelete() {
		return flagDelete;
	}

	public void setFlagDelete(Boolean flagDelete) {
		this.flagDelete = flagDelete;
	}

}
