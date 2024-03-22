package com.galgoda.hotel.model.vo;

import java.sql.Date;

public class Room {

	
	 private int roomNo;
	 private int hotelNo;
	 private String roomName;
	 private String roomSize;
	 private int roPeople;
	 private int roBath;
	 private int roPrice;
	 private int roCount;
	 private String opNo;
	 private Date registDate;
	 private Date modifyDate;
	 private String status;
	 private String imgPath;
	
	
	 
	 public Room() {}

	 
	 
	 
	 

	public Room(int roomNo, int hotelNo, String roomName, String roomSize, int roPeople, int roBath, int roPrice,
			int roCount, String opNo, Date registDate, Date modifyDate, String status, String imgPath) {
		super();
		this.roomNo = roomNo;
		this.hotelNo = hotelNo;
		this.roomName = roomName;
		this.roomSize = roomSize;
		this.roPeople = roPeople;
		this.roBath = roBath;
		this.roPrice = roPrice;
		this.roCount = roCount;
		this.opNo = opNo;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.imgPath = imgPath;
	}






	public int getRoomNo() {
		return roomNo;
	}






	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}






	public int getHotelNo() {
		return hotelNo;
	}






	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}






	public String getRoomName() {
		return roomName;
	}






	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}






	public String getRoomSize() {
		return roomSize;
	}






	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}






	public int getRoPeople() {
		return roPeople;
	}






	public void setRoPeople(int roPeople) {
		this.roPeople = roPeople;
	}






	public int getRoBath() {
		return roBath;
	}






	public void setRoBath(int roBath) {
		this.roBath = roBath;
	}






	public int getRoPrice() {
		return roPrice;
	}






	public void setRoPrice(int roPrice) {
		this.roPrice = roPrice;
	}






	public int getRoCount() {
		return roCount;
	}






	public void setRoCount(int roCount) {
		this.roCount = roCount;
	}






	public String getOpNo() {
		return opNo;
	}






	public void setOpNo(String opNo) {
		this.opNo = opNo;
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






	public String getImgPath() {
		return imgPath;
	}






	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}













	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", hotelNo=" + hotelNo + ", roomName=" + roomName + ", roomSize=" + roomSize
				+ ", roPeople=" + roPeople + ", roBath=" + roBath + ", roPrice=" + roPrice + ", roCount=" + roCount
				+ ", opNo=" + opNo + ", registDate=" + registDate + ", modifyDate=" + modifyDate + ", status=" + status
				+ ", imgPath=" + imgPath + "]";
	}
	 
	 
}
