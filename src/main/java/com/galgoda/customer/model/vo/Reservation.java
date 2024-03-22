package com.galgoda.customer.model.vo;

import java.sql.Date;

/**
 * @author MIRO
 *
 */
public class Reservation {

	private int resNo;
	private int hotelNo;
	private String hotelName; // table join 으로 새로 추가된 변수
	private int userNo;
	private int roNo;
	private String dateIn;
	private String dateOut;
	private Date resDate;
	private String resStatus;
	private String req;
	private String reasonCancel;
	private String payMethod;
	private int pay;
	private Date payDate;
	private int resPeople;
	private String resName;
	private String resPhone;
	private String resEmail;
	private String imgPath; // table join 으로 새로 추가된 변수
	private String roName; // table join 으로 새로 추가된 변수
	private int roPrice; // table join 으로 새로 추가된 변수
	private String opName; // table join 으로 새로 추가된 변수
	private String userId; // table join 으로 새로 추가된 변수

	
	
	public Reservation() {}

	public Reservation(int resNo, int hotelNo, int userNo, int roNo, String dateIn, String dateOut, Date resDate,
			String resStatus, String req, String reasonCancel, String payMethod, int pay, Date payDate, int resPeople,
			String resName, String resPhone, String resEmail) {
		super();
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.userNo = userNo;
		this.roNo = roNo;
		this.dateIn = dateIn;
		this.dateOut = dateOut;
		this.resDate = resDate;
		this.resStatus = resStatus;
		this.req = req;
		this.reasonCancel = reasonCancel;
		this.payMethod = payMethod;
		this.pay = pay;
		this.payDate = payDate;
		this.resPeople = resPeople;
		this.resName = resName;
		this.resPhone = resPhone;
		this.resEmail = resEmail;
	}
	
	

	public Reservation(int resNo, int hotelNo, String hotelName, int userNo, int roNo, String dateIn, String dateOut,
			Date resDate, String resStatus, String req, String reasonCancel, String payMethod, int pay, Date payDate,
			int resPeople, String resName, String resPhone, String resEmail) {
		super();
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.userNo = userNo;
		this.roNo = roNo;
		this.dateIn = dateIn;
		this.dateOut = dateOut;
		this.resDate = resDate;
		this.resStatus = resStatus;
		this.req = req;
		this.reasonCancel = reasonCancel;
		this.payMethod = payMethod;
		this.pay = pay;
		this.payDate = payDate;
		this.resPeople = resPeople;
		this.resName = resName;
		this.resPhone = resPhone;
		this.resEmail = resEmail;
	}
	
	

	public Reservation(int resNo, int hotelNo, String hotelName, int userNo, int roNo, String dateIn, String dateOut,
			Date resDate, String resStatus, String req, String reasonCancel, String payMethod, int pay, Date payDate,
			int resPeople, String resName, String resPhone, String resEmail, String imgPath) {
		super();
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.userNo = userNo;
		this.roNo = roNo;
		this.dateIn = dateIn;
		this.dateOut = dateOut;
		this.resDate = resDate;
		this.resStatus = resStatus;
		this.req = req;
		this.reasonCancel = reasonCancel;
		this.payMethod = payMethod;
		this.pay = pay;
		this.payDate = payDate;
		this.resPeople = resPeople;
		this.resName = resName;
		this.resPhone = resPhone;
		this.resEmail = resEmail;
		this.imgPath = imgPath;
	}

	
	
	
	

	public Reservation(int resNo, int hotelNo, String hotelName, int userNo, int roNo, String dateIn, String dateOut,
			Date resDate, String resStatus, String req, String reasonCancel, String payMethod, int pay, Date payDate,
			int resPeople, String resName, String resPhone, String resEmail, String imgPath, String roName,
			String opName) {
		super();
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.userNo = userNo;
		this.roNo = roNo;
		this.dateIn = dateIn;
		this.dateOut = dateOut;
		this.resDate = resDate;
		this.resStatus = resStatus;
		this.req = req;
		this.reasonCancel = reasonCancel;
		this.payMethod = payMethod;
		this.pay = pay;
		this.payDate = payDate;
		this.resPeople = resPeople;
		this.resName = resName;
		this.resPhone = resPhone;
		this.resEmail = resEmail;
		this.imgPath = imgPath;
		this.roName = roName;
		this.opName = opName;
	}
	
	
	
	

	public Reservation(int resNo, int hotelNo, String hotelName, int userNo, int roNo, String dateIn, String dateOut,
			Date resDate, String resStatus, String req, String reasonCancel, String payMethod, int pay, Date payDate,
			int resPeople, String resName, String resPhone, String resEmail, String imgPath, String roName, int roPrice,
			String opName) {
		super();
		this.resNo = resNo;
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.userNo = userNo;
		this.roNo = roNo;
		this.dateIn = dateIn;
		this.dateOut = dateOut;
		this.resDate = resDate;
		this.resStatus = resStatus;
		this.req = req;
		this.reasonCancel = reasonCancel;
		this.payMethod = payMethod;
		this.pay = pay;
		this.payDate = payDate;
		this.resPeople = resPeople;
		this.resName = resName;
		this.resPhone = resPhone;
		this.resEmail = resEmail;
		this.imgPath = imgPath;
		this.roName = roName;
		this.roPrice = roPrice;
		this.opName = opName;
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

	public int getRoNo() {
		return roNo;
	}

	public void setRoNo(int roNo) {
		this.roNo = roNo;
	}

	public String getDateIn() {
		return dateIn;
	}

	public void setDateIn(String dateIn) {
		this.dateIn = dateIn;
	}

	public String getDateOut() {
		return dateOut;
	}

	public void setDateOut(String dateOut) {
		this.dateOut = dateOut;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public String getResStatus() {
		return resStatus;
	}

	public void setResStatus(String resStatus) {
		this.resStatus = resStatus;
	}

	public String getReq() {
		return req;
	}

	public void setReq(String req) {
		this.req = req;
	}

	public String getReasonCancel() {
		return reasonCancel;
	}

	public void setReasonCancel(String reasonCancel) {
		this.reasonCancel = reasonCancel;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getResPeople() {
		return resPeople;
	}

	public void setResPeople(int resPeople) {
		this.resPeople = resPeople;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResPhone() {
		return resPhone;
	}

	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}

	public String getResEmail() {
		return resEmail;
	}

	public void setResEmail(String resEmail) {
		this.resEmail = resEmail;
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

	public String getRoName() {
		return roName;
	}

	public void setRoName(String roName) {
		this.roName = roName;
	}

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	public int getRoPrice() {
		return roPrice;
	}

	public void setRoPrice(int roPrice) {
		this.roPrice = roPrice;
	}

	@Override
	public String toString() {
		return "Reservation [resNo=" + resNo + ", hotelNo=" + hotelNo + ", hotelName=" + hotelName + ", userNo="
				+ userNo + ", roNo=" + roNo + ", dateIn=" + dateIn + ", dateOut=" + dateOut + ", resDate=" + resDate
				+ ", resStatus=" + resStatus + ", req=" + req + ", reasonCancel=" + reasonCancel + ", payMethod="
				+ payMethod + ", pay=" + pay + ", payDate=" + payDate + ", resPeople=" + resPeople + ", resName="
				+ resName + ", resPhone=" + resPhone + ", resEmail=" + resEmail + ", imgPath=" + imgPath + ", roName="
				+ roName + ", opName=" + opName + "]";
	}

	
	
	
}
