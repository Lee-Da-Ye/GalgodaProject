package com.galgoda.supervisor.model.vo;

import java.sql.Date;

public class Terms {
	private int termsNo;
	private String termsTitle;
	private String termsContent;
	private String adminNo;
	private String notes;
	private String registDate;
	private String modifyDate;
	private String status;
	
	public Terms() {
	}

	public Terms(int termsNo, String termsTitle, String termsContent, String adminNo, String notes, String registDate,
			String modifyDate, String status) {
		super();
		this.termsNo = termsNo;
		this.termsTitle = termsTitle;
		this.termsContent = termsContent;
		this.adminNo = adminNo;
		this.notes = notes;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public Terms(int termsNo, String termsTitle, String termsContent, String adminNo, String notes) {
		super();
		this.termsNo = termsNo;
		this.termsTitle = termsTitle;
		this.termsContent = termsContent;
		this.adminNo = adminNo;
		this.notes = notes;
	}

	public int getTermsNo() {
		return termsNo;
	}

	public void setTermsNo(int termsNo) {
		this.termsNo = termsNo;
	}

	public String getTermsTitle() {
		return termsTitle;
	}

	public void setTermsTitle(String termsTitle) {
		this.termsTitle = termsTitle;
	}

	public String getTermsContent() {
		return termsContent;
	}

	public void setTermsContent(String termsContent) {
		this.termsContent = termsContent;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
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
		return "Terms [termsNo=" + termsNo + ", termsTitle=" + termsTitle + ", termsContent=" + termsContent
				+ ", adminNo=" + adminNo + ", notes=" + notes + ", registDate=" + registDate + ", modifyDate="
				+ modifyDate + ", status=" + status + "]";
	}

	
	
	
	
	
	
}
