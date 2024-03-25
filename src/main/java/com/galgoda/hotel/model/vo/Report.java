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
	 private String userId; // table join 으로 새로 추가된 변수
	 private String revTitle; // table join 으로 새로 추가된 변수
	 private int revNo; // table join 으로 새로 추가된 변수
	 private Date registDate; // table join 으로 새로 추가된 변수
	 private int revRating; // table join 으로 새로 추가된 변수
	 private String revContent; // table join 으로 새로 추가된 변수
	 private String fileNoList; // 리뷰신고시 파일넘버
	 
	 
	 public Report() {}

	 
	 
    
    
    
    /**
     * 신고 유저 조회용 매개변수 생성자
     * @param repNo
     * @param repReason
     * @param repDate
     * @param status
     * @param userId
     * 
     */
	public Report(int repNo, String repReason, Date repDate, String status, String userId) {
		super();
		this.repNo = repNo;
		this.repReason = repReason;
		this.repDate = repDate;
		this.status = status;
		this.userId = userId;
	}






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




	
	
	public Date getRegistDate() {
		return registDate;
	}






	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}






	public int getRevRating() {
		return revRating;
	}






	public void setRevRating(int revRating) {
		this.revRating = revRating;
	}






	public String getRevContent() {
		return revContent;
	}






	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}






	public int getRevNo() {
		return revNo;
	}






	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}






	public String getRevTitle() {
		return revTitle;
	}






	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
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

	




	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getFileNoList() {
		return fileNoList;
	}






	public void setFileNoList(String fileNoList) {
		this.fileNoList = fileNoList;
	}






	@Override
	public String toString() {
		return "Report [repNo=" + repNo + ", resNo=" + resNo + ", repReason=" + repReason + ", repContent=" + repContent
				+ ", repDate=" + repDate + ", status=" + status + ", fileNo=" + fileNo + ", repType=" + repType
				+ ", repRefNo=" + repRefNo + "]";
	}
	 
	 
}
