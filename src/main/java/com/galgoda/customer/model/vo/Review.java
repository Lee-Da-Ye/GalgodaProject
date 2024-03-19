package com.galgoda.customer.model.vo;

import java.sql.Date;

public class Review {
	
	 private int revNo;
	 private int resNo;
	 private int hotelNo;
	 private int userNo;
	 private String status;
	 private String revTitle;
	 private String revContent;
	 private int revRating;
	 private Date registDate;
	 private Date modifyDate;
	 private int fileNo;
	 private String userId; //  table join 으로 새로 추가된 변수
	 
	 
	 public Review() {}

	 
	 
	 
	 
	 
	 
	public Review(int revNo, int resNo, int hotelNo, int userNo, String status, String revTitle, String revContent,
			int revRating, Date registDate, Date modifyDate, int fileNo) {
		super();
		this.revNo = revNo;
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.userNo = userNo;
		this.status = status;
		this.revTitle = revTitle;
		this.revContent = revContent;
		this.revRating = revRating;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.fileNo = fileNo;
	}







	public int getRevNo() {
		return revNo;
	}





	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}





	public int getResNo() {
		return resNo;
	}





	public void setResNo(int resNo) {
		this.resNo = resNo;
	}





	public int getHotelNo() {
		return hotelNo;
	}





	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}





	public int getUserNo() {
		return userNo;
	}





	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}





	public String getStatus() {
		return status;
	}





	public void setStatus(String status) {
		this.status = status;
	}





	public String getRevTitle() {
		return revTitle;
	}





	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}





	public String getRevContent() {
		return revContent;
	}





	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}





	public int getRevRating() {
		return revRating;
	}





	public void setRevRating(int revRating) {
		this.revRating = revRating;
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





	public int getFileNo() {
		return fileNo;
	}





	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}





	public String getUserId() {
		return userId;
	}







	public void setUserId(String userId) {
		this.userId = userId;
	}







	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", resNo=" + resNo + ", hotelNo=" + hotelNo + ", userNo=" + userNo
				+ ", status=" + status + ", revTitle=" + revTitle + ", revContent=" + revContent + ", revRating="
				+ revRating + ", registDate=" + registDate + ", modifyDate=" + modifyDate + ", fileNo=" + fileNo + "]";
	}
	 
	 

}
