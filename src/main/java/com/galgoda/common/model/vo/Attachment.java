package com.galgoda.common.model.vo;

import java.sql.Date;

public class Attachment {


	private int fileNo;
	private String filePath;
	private String status;
	private int refNo;
	private String refType;
	private String fileName;
	private String originName; 
	
	
	public Attachment() {}
	
	
	
	
	
	public Attachment(int fileNo, String filePath, String status, int refNo, String refType, String fileName) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.status = status;
		this.refNo = refNo;
		this.refType = refType;
		this.fileName = fileName;
	}








	public int getFileNo() {
		return fileNo;
	}








	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}








	public String getFilePath() {
		return filePath;
	}








	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}








	public String getStatus() {
		return status;
	}








	public void setStatus(String status) {
		this.status = status;
	}








	public int getRefNo() {
		return refNo;
	}








	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}








	public String getRefType() {
		return refType;
	}








	public void setRefType(String refType) {
		this.refType = refType;
	}








	public String getFileName() {
		return fileName;
	}








	public void setFileName(String fileName) {
		this.fileName = fileName;
	}








	public String getOriginName() {
		return originName;
	}





	public void setOriginName(String originName) {
		this.originName = originName;
	}





	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", filePath=" + filePath + ", status=" + status + ", refNo=" + refNo
				+ ", refType=" + refType + ", fileName=" + fileName + "]";
	}
	
	
	
	
}
