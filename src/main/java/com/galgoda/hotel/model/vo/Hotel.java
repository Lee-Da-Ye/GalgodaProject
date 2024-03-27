package com.galgoda.hotel.model.vo;

public class Hotel {

	
	 private int hotelNo;
	 private String hotelName;
	 private String hotelAddress;
	 private String hotelDetailAdd;
	 private String hotelTel;
	 private String hotelSite;
     private int hotelCheckin;
	 private int hotelCheckout;
	 private String hotelDetail;
	 private String hotelIntro;
	 private String refundpolicy;
	 private String status;
	 private String tagNo;
	 private String imgPath;
	 private int memNo;
	 private int resCount; // 호텔 예약 횟수
	 private int reviewCount; // 호텔별 리뷰 수
	 private int minPrice; // 호텔별 객실 최저가
	 private double avgReview; // 리뷰 평균
	 
	 public Hotel() {}

	 
	 

	public Hotel(int hotelNo, String hotelName, String hotelAddress, String hotelDetailAdd, String hotelTel,
			String hotelSite, int hotelCheckin, int hotelCheckout, String hotelDetail, String hotelIntro,
			String refundpolicy, String status, String tagNo, String imgPath, int memNo) {
		super();
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.hotelAddress = hotelAddress;
		this.hotelDetailAdd = hotelDetailAdd;
		this.hotelTel = hotelTel;
		this.hotelSite = hotelSite;
		this.hotelCheckin = hotelCheckin;
		this.hotelCheckout = hotelCheckout;
		this.hotelDetail = hotelDetail;
		this.hotelIntro = hotelIntro;
		this.refundpolicy = refundpolicy;
		this.status = status;
		this.tagNo = tagNo;
		this.imgPath = imgPath;
		this.memNo = memNo;
	}


	




	public Hotel(String hotelName, int hotelNo, int resCount, String imgPath) {
		super();
		this.hotelName = hotelName;
		this.hotelNo = hotelNo;
		this.resCount = resCount;
		this.imgPath = imgPath;
	}




	public int getHotelNo() {
		return hotelNo;
	}







	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}







	public String getHotelName() {
		return hotelName;
	}







	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}







	public String getHotelAddress() {
		return hotelAddress;
	}







	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}







	public String getHotelDetailAdd() {
		return hotelDetailAdd;
	}







	public void setHotelDetailAdd(String hotelDetailAdd) {
		this.hotelDetailAdd = hotelDetailAdd;
	}







	public String getHotelTel() {
		return hotelTel;
	}







	public void setHotelTel(String hotelTel) {
		this.hotelTel = hotelTel;
	}







	public String getHotelSite() {
		return hotelSite;
	}







	public void setHotelSite(String hotelSite) {
		this.hotelSite = hotelSite;
	}







	public int getHotelCheckin() {
		return hotelCheckin;
	}







	public void setHotelCheckin(int hotelCheckin) {
		this.hotelCheckin = hotelCheckin;
	}







	public int getHotelCheckout() {
		return hotelCheckout;
	}







	public void setHotelCheckout(int hotelCheckout) {
		this.hotelCheckout = hotelCheckout;
	}







	public String getHotelDetail() {
		return hotelDetail;
	}







	public void setHotelDetail(String hotelDetail) {
		this.hotelDetail = hotelDetail;
	}







	public String getHotelIntro() {
		return hotelIntro;
	}







	public void setHotelIntro(String hotelIntro) {
		this.hotelIntro = hotelIntro;
	}







	public String getRefundpolicy() {
		return refundpolicy;
	}







	public void setRefundpolicy(String refundpolicy) {
		this.refundpolicy = refundpolicy;
	}







	public String getStatus() {
		return status;
	}







	public void setStatus(String status) {
		this.status = status;
	}







	public String getTagNo() {
		return tagNo;
	}







	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}







	public String getImgPath() {
		return imgPath;
	}







	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}







	public int getMemNo() {
		return memNo;
	}







	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}







	public int getResCount() {
		return resCount;
	}




	public void setResCount(int resCount) {
		this.resCount = resCount;
	}




	public int getReviewCount() {
		return reviewCount;
	}




	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}




	public int getMinPrice() {
		return minPrice;
	}




	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}




	public double getAvgReview() {
		return avgReview;
	}




	public void setAvgReview(double avgReview) {
		this.avgReview = avgReview;
	}




	@Override
	public String toString() {
		return "Hotel [hotelNo=" + hotelNo + ", hotelName=" + hotelName + ", hotelAddress=" + hotelAddress
				+ ", hotelDetailAdd=" + hotelDetailAdd + ", hotelTel=" + hotelTel + ", hotelSite=" + hotelSite
				+ ", hotelCheckin=" + hotelCheckin + ", hotelCheckout=" + hotelCheckout + ", hotelDetail=" + hotelDetail
				+ ", hotelIntro=" + hotelIntro + ", refundpolicy=" + refundpolicy + ", status=" + status + ", tagNo="
				+ tagNo + ", imgPath=" + imgPath + ", memNo=" + memNo + "]";
	}
	 
	 
	 
	
	
}
