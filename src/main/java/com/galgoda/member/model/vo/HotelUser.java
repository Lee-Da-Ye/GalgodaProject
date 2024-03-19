package com.galgoda.member.model.vo;

import java.sql.Date;

public class HotelUser{
	
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String memPhone;
	private String memEmail;
	private Date registDate;
	private Date modifyDate;
	private String status;
	private String role;
	private String authentiCode;
	private String hotelName;
	private int hotelNo;
	private String hotelAddress;
	
	public String getHotelAddress() {
		return hotelAddress;
	}

	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}

	public int getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}

	public HotelUser() {}

	public HotelUser(int memNo, String memId, String memPwd, String memName, String memPhone, String memEmail,
			Date registDate, Date modifyDate, String status, String role, String authentiCode, String hotelName) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.role = role;
		this.authentiCode = authentiCode;
		this.hotelName = hotelName;
	}
	
	
	public HotelUser(int memNo, String memId, String memPwd, String memName, String memPhone, String memEmail,
			String hotelName) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.hotelName = hotelName;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getAuthentiCode() {
		return authentiCode;
	}

	public void setAuthentiCode(String authentiCode) {
		this.authentiCode = authentiCode;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	@Override
	public String toString() {
		return "HotelUser [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", memPhone=" + memPhone + ", memEmail=" + memEmail + ", registDate=" + registDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", role=" + role + ", authentiCode=" + authentiCode
				+ ", hotelName=" + hotelName + "]";
	}

	
	

}
