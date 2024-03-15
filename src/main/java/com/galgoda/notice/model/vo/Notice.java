package com.galgoda.notice.model.vo;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int memNo;
	private int adminNo;
	private String registDate;
	private String modifyDate;
	private String status;
	
	public Notice() {
	}
	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, String registDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.registDate = registDate;
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, int memNo, int adminNo, String registDate,
			String modifyDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.memNo = memNo;
		this.adminNo = adminNo;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", memNo=" + memNo + ", adminNo=" + adminNo + ", registDate=" + registDate + ", modifyDate="
				+ modifyDate + ", status=" + status + "]";
	}
	
	
	
}
