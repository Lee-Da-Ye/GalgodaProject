package com.galgoda.hotel.model.vo;

public class Option {
	private int opNo;
	private String opName;
	private String status;
	
	public Option() {
	}

	public Option(int opNo, String opName, String status) {
		super();
		this.opNo = opNo;
		this.opName = opName;
		this.status = status;
	}

	public int getOpNo() {
		return opNo;
	}

	public void setOpNo(int opNo) {
		this.opNo = opNo;
	}

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Option [opNo=" + opNo + ", opName=" + opName + ", status=" + status + "]";
	}
	
	
	
}
