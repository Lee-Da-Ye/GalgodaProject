package com.galgoda.customer.model.vo;

import java.sql.Date;

public class Wishlist {
	
	private int wishNo;
	private int userNo;
	private int hotelNO;
	private String hotelName; // 위시리스트 조회 시 테이블 조인으로 인한 추가
	private Date regDate;
	private String imgPath; //  위시리스트 조회 시 테이블 조인으로 인한 추가
	
	public Wishlist() {}

	public Wishlist(int wishNo, int userNo, int hotelNO, Date regDate) {
		super();
		this.wishNo = wishNo;
		this.userNo = userNo;
		this.hotelNO = hotelNO;
		this.regDate = regDate;
	}
	
	

	public Wishlist(int wishNo, int userNo, int hotelNO, String hotelName, Date regDate, String imgPath) {
		super();
		this.wishNo = wishNo;
		this.userNo = userNo;
		this.hotelNO = hotelNO;
		this.hotelName = hotelName;
		this.regDate = regDate;
		this.imgPath = imgPath;
	}

	public int getWishNo() {
		return wishNo;
	}

	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getHotelNO() {
		return hotelNO;
	}

	public void setHotelNO(int hotelNO) {
		this.hotelNO = hotelNO;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Wishlist [wishNo=" + wishNo + ", userNo=" + userNo + ", hotelNO=" + hotelNO + ", hotelName=" + hotelName
				+ ", regDate=" + regDate + ", imgPath=" + imgPath + "]";
	}

	
	
	
}
	