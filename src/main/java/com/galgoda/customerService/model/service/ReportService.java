package com.galgoda.customerService.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customerService.model.dao.ReportDao;
import com.galgoda.hotel.model.vo.Report;

public class ReportService {
	private ReportDao rDao = new ReportDao();
	
	public List<Report> selectReportUserList(PageInfo pi){
		Connection conn = getConnection();
		List<Report> list = rDao.selectReportUserList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	public List<Report> selectReportReviewList(PageInfo pi){
		Connection conn = getConnection();
		List<Report> list = rDao.selectReportReviewList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public Report selectReportUser(int repNo) {
		Connection conn = getConnection();
		Report r = rDao.selectReportUser(conn, repNo);
		
		close(conn);
		return r;
	}
	
	public Report selectReportReview(int repNo) {
		Connection conn = getConnection();
		Report r = rDao.selectReportReview(conn, repNo);
		
		close(conn);
		return r;
	}
	
	public int selectReportReviewListCount() {
		Connection conn = getConnection();
		int count = rDao.selectReportReviewListCount(conn);
		
		close(conn);
		return count;
	}
	
	public int selectReportUserListCount() {
		Connection conn = getConnection();
		int count = rDao.selectReportUserListCount(conn);
		
		close(conn);
		return count;
	}
}
