package com.galgoda.customer.model.vo;

import java.sql.Date;

public class CustomerReview {
	private int revNo;
	private int resNo;
	private int hotelNo;
	private int userNo; 
	private String revTitle;
	private String revContent;
	private int revRating;
	private Date registDate;
	private Date modifyDate;
	private int fileNo;
	
	private String date_in;
	private String date_out;
	private int res_people;
	private String img_path;
	private String userName; 
    private String userId;
	private String hotelName;
	private String status;
	
	
	public CustomerReview() {}


	public CustomerReview(int revNo, int resNo, int hotelNo, int userNo, String revTitle, String revContent, int revRating,
			Date registDate, Date modifyDate, int fileNo, String date_in, String date_out, int res_people,
			String img_path, String userName, String userId, String hotelName, String status) {
		super();
		this.revNo = revNo;
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.userNo = userNo;
		this.revTitle = revTitle;
		this.revContent = revContent;
		this.revRating = revRating;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.fileNo = fileNo;
		this.date_in = date_in;
		this.date_out = date_out;
		this.res_people = res_people;
		this.img_path = img_path;
		this.userName = userName;
		this.userId = userId;
		this.hotelName = hotelName;
		this.status = status;
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


	public String getDate_in() {
		return date_in;
	}


	public void setDate_in(String date_in) {
		this.date_in = date_in;
	}


	public String getDate_out() {
		return date_out;
	}


	public void setDate_out(String date_out) {
		this.date_out = date_out;
	}


	public int getRes_people() {
		return res_people;
	}


	public void setRes_people(int res_people) {
		this.res_people = res_people;
	}


	public String getImg_path() {
		return img_path;
	}


	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getHotelName() {
		return hotelName;
	}


	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "CustomerReview [revNo=" + revNo + ", resNo=" + resNo + ", hotelNo=" + hotelNo + ", userNo=" + userNo
				+ ", revTitle=" + revTitle + ", revContent=" + revContent + ", revRating=" + revRating + ", registDate="
				+ registDate + ", modifyDate=" + modifyDate + ", fileNo=" + fileNo + ", date_in=" + date_in
				+ ", date_out=" + date_out + ", res_people=" + res_people + ", img_path=" + img_path + ", userName="
				+ userName + ", userId=" + userId + ", hotelName=" + hotelName + ", status=" + status + "]";
	}


	public CustomerReview(int revNo, int resNo, int hotelNo, int userNo, String revTitle, String revContent, int revRating,
			Date registDate, Date modifyDate, int fileNo) {
		super();
		this.revNo = revNo;
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.userNo = userNo;
		this.revTitle = revTitle;
		this.revContent = revContent;
		this.revRating = revRating;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.fileNo = fileNo;
	}


	public CustomerReview(int revNo, int resNo, int hotelNo, int userNo, String revTitle, String revContent, int revRating) {
		super();
		this.revNo = revNo;
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.userNo = userNo;
		this.revTitle = revTitle;
		this.revContent = revContent;
		this.revRating = revRating;
	}


	public CustomerReview(int revNo, int resNo, int hotelNo, String revTitle, String date_in, String date_out, int res_people,
			String img_path, String hotelName) {
		super();
		this.revNo = revNo;
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.revTitle = revTitle;
		this.date_in = date_in;
		this.date_out = date_out;
		this.res_people = res_people;
		this.img_path = img_path;
		this.hotelName = hotelName;
	}


	public CustomerReview(int revNo, String revTitle, String revContent) {
		super();
		this.revNo = revNo;
		this.revTitle = revTitle;
		this.revContent = revContent;
	}


	public CustomerReview(int revNo, int resNo, int hotelNo, String revTitle, String revContent, int revRating, String date_in,
			String date_out, int res_people, String img_path, String hotelName) {
		super();
		this.revNo = revNo;
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.revTitle = revTitle;
		this.revContent = revContent;
		this.revRating = revRating;
		this.date_in = date_in;
		this.date_out = date_out;
		this.res_people = res_people;
		this.img_path = img_path;
		this.hotelName = hotelName;
	}


	

	



	
	
}
