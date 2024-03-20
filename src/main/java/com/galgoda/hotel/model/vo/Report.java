package com.galgoda.hotel.model.vo;

import java.sql.Date;

public class Report {

	
	 private int repNo;
	 private int resNo;
	 private String repReason;
	 private String repContent;
	 private Date repDate;
	 private String status;
	 private int fileNo;
	 private String repType;
	 private int repRefNo;
	 
	 public Report() {}

	 
	 
	 
	 
	 
	public Report(int repNo, int resNo, String repReason, String repContent, Date repDate, String status, int fileNo,
			String repType, int repRefNo) {
		super();
		this.repNo = repNo;
		this.resNo = resNo;
		this.repReason = repReason;
		this.repContent = repContent;
		this.repDate = repDate;
		this.status = status;
		this.fileNo = fileNo;
		this.repType = repType;
		this.repRefNo = repRefNo;
	}






	public int getRepNo() {
		return repNo;
	}






	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}






	public int getResNo() {
		return resNo;
	}






	public void setResNo(int resNo) {
		this.resNo = resNo;
	}






	public String getRepReason() {
		return repReason;
	}






	public void setRepReason(String repReason) {
		this.repReason = repReason;
	}






	public String getRepContent() {
		return repContent;
	}






	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}






	public Date getRepDate() {
		return repDate;
	}






	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}






	public String getStatus() {
		return status;
	}






	public void setStatus(String status) {
		this.status = status;
	}






	public int getFileNo() {
		return fileNo;
	}






	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}






	public String getRepType() {
		return repType;
	}






	public void setRepType(String repType) {
		this.repType = repType;
	}






	public int getRepRefNo() {
		return repRefNo;
	}






	public void setRepRefNo(int repRefNo) {
		this.repRefNo = repRefNo;
	}






	@Override
	public String toString() {
		return "Report [repNo=" + repNo + ", resNo=" + resNo + ", repReason=" + repReason + ", repContent=" + repContent
				+ ", repDate=" + repDate + ", status=" + status + ", fileNo=" + fileNo + ", repType=" + repType
				+ ", repRefNo=" + repRefNo + "]";
	}
	 
	 
}
