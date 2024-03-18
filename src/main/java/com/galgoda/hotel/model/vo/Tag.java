package com.galgoda.hotel.model.vo;

public class Tag {

	
	 private int tagNo;
	 private String tagName;
	 private String status;
	 
	 public Tag () {}

	 
	 
	 
	 
	public Tag(int tagNo, String tagName, String status) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.status = status;
	}





	public int getTagNo() {
		return tagNo;
	}





	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}





	public String getTagName() {
		return tagName;
	}





	public void setTagName(String tagName) {
		this.tagName = tagName;
	}





	public String getStatus() {
		return status;
	}





	public void setStatus(String status) {
		this.status = status;
	}





	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", tagName=" + tagName + ", status=" + status + "]";
	}
	 
	 
}
