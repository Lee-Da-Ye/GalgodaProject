package com.galgoda.member.model.vo;

import java.sql.Date;

public class Customer {
	
	private int userNo;
	private String userId;
	private String userName;
	private String userEngName;
	private String userPwd;
	private String birthDate;
	private String email;
	private String phone;
	private String address;
	private String addressDetail;
	private Date registDate;
	private Date modifyDate;
	private String status;
	
	public Customer() {}

	public Customer(int userNo, String userId, String userName, String userEngName, String userPwd, String birthDate,
			String email, String phone, String address, String addressDetail, Date registDate, Date modifyDate,
			String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userEngName = userEngName;
		this.userPwd = userPwd;
		this.birthDate = birthDate;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.addressDetail = addressDetail;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEngName() {
		return userEngName;
	}

	public void setUserEngName(String userEngName) {
		this.userEngName = userEngName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Customer [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", userEngName="
				+ userEngName + ", userPwd=" + userPwd + ", birthDate=" + birthDate + ", email=" + email + ", phone="
				+ phone + ", address=" + address + ", addressDetail=" + addressDetail + ", registDate=" + registDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	

}
