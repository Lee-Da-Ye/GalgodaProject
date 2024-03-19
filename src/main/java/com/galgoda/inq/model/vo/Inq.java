package com.galgoda.inq.model.vo;

public class Inq {
	private int inqNo;
	private String inqTitle;
	private String inqContent;
	private String inqWriter;
	private String writerPhone;
	private String writerEmail;
	private String category;
	private String inqType;
	private String registDate;
	private String modifyDate;
	private String ansContent;
	private int ansWriter;
	private String stauts;
	private String ansDate;

	public Inq() {
	}

	public Inq(int inqNo, String inqTitle, String inqContent, String inqWriter, String writerPhone, String writerEmail,
			String category, String inqType, String registDate, String modifyDate, String ansContent, int ansWriter,
			String stauts, String ansDate) {
		super();
		this.inqNo = inqNo;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqWriter = inqWriter;
		this.writerPhone = writerPhone;
		this.writerEmail = writerEmail;
		this.category = category;
		this.inqType = inqType;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.ansContent = ansContent;
		this.ansWriter = ansWriter;
		this.stauts = stauts;
		this.ansDate = ansDate;
	}

	public int getInqNo() {
		return inqNo;
	}

	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqContent() {
		return inqContent;
	}

	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}

	public String getInqWriter() {
		return inqWriter;
	}

	public void setInqWriter(String inqWriter) {
		this.inqWriter = inqWriter;
	}

	public String getWriterPhone() {
		return writerPhone;
	}

	public void setWriterPhone(String writerPhone) {
		this.writerPhone = writerPhone;
	}

	public String getWriterEmail() {
		return writerEmail;
	}

	public void setWriterEmail(String writerEmail) {
		this.writerEmail = writerEmail;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getInqType() {
		return inqType;
	}

	public void setInqType(String inqType) {
		this.inqType = inqType;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public int getAnsWriter() {
		return ansWriter;
	}

	public void setAnsWriter(int ansWriter) {
		this.ansWriter = ansWriter;
	}

	public String getStauts() {
		return stauts;
	}

	public void setStauts(String stauts) {
		this.stauts = stauts;
	}

	public String getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}

	@Override
	public String toString() {
		return "Inq [inqNo=" + inqNo + ", inqTitle=" + inqTitle + ", inqContent=" + inqContent + ", inqWriter="
				+ inqWriter + ", writerPhone=" + writerPhone + ", writerEmail=" + writerEmail + ", category=" + category
				+ ", inqType=" + inqType + ", registDate=" + registDate + ", modifyDate=" + modifyDate + ", ansContent="
				+ ansContent + ", ansWriter=" + ansWriter + ", stauts=" + stauts + ", ansDate=" + ansDate + "]";
	}
	
	

	
	
	
}
