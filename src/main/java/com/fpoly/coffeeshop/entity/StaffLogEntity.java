package com.fpoly.coffeeshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "staff_logs")
public class StaffLogEntity {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "created_date")
	private Date createdDate;

	@Column(name = "create_bBy")
	private String createdBy;

	@Column(name = "modified_date")
	private Date modifiedDate;

	@Column(name = "modified_by")
	private String modifiedBy;

	@Column(name = "old_fullname")
	private String oldFullname;

	@Column(name = "old_birthday")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date oldBirthday;

	@Column(name = "old_email")
	private String oldEmail;

	@Column(name = "old_phone")
	private String oldPhone;

	@Column(name = "old_address")
	private String oldAddress;

	@Column(name = "old_photo")
	private String oldPhoto;

	@Column(name = "old_staff_id")
	private String oldStaffID;

	@Column(name = "old_user_id")
	private String oldUserID;

	@Column(name = "old_username")
	private String oldUsername;

	@Column(name = "old_flag_delete")
	private Boolean oldFlagDelete;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public String getOldFullname() {
		return oldFullname;
	}

	public void setOldFullname(String oldFullname) {
		this.oldFullname = oldFullname;
	}

	public Date getOldBirthday() {
		return oldBirthday;
	}

	public void setOldBirthday(Date oldBirthday) {
		this.oldBirthday = oldBirthday;
	}

	public String getOldEmail() {
		return oldEmail;
	}

	public void setOldEmail(String oldEmail) {
		this.oldEmail = oldEmail;
	}

	public String getOldPhone() {
		return oldPhone;
	}

	public void setOldPhone(String oldPhone) {
		this.oldPhone = oldPhone;
	}

	public String getOldAddress() {
		return oldAddress;
	}

	public void setOldAddress(String oldAddress) {
		this.oldAddress = oldAddress;
	}

	public String getOldPhoto() {
		return oldPhoto;
	}

	public void setOldPhoto(String oldPhoto) {
		this.oldPhoto = oldPhoto;
	}

	public String getOldStaffID() {
		return oldStaffID;
	}

	public void setOldStaffID(String oldStaffID) {
		this.oldStaffID = oldStaffID;
	}

	public String getOldUserID() {
		return oldUserID;
	}

	public void setOldUserID(String oldUserID) {
		this.oldUserID = oldUserID;
	}

	public String getOldUsername() {
		return oldUsername;
	}

	public void setOldUsername(String oldUsername) {
		this.oldUsername = oldUsername;
	}

	public Boolean getOldFlagDelete() {
		return oldFlagDelete;
	}

	public void setOldFlagDelete(Boolean oldFlagDelete) {
		this.oldFlagDelete = oldFlagDelete;
	}

}
