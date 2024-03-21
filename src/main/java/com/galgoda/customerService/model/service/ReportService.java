package com.galgoda.customerService.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.galgoda.customer.model.vo.Review;
import com.galgoda.customerService.model.dao.ReportDao;
import com.galgoda.hotel.model.vo.Report;

public class ReportService {
	private ReportDao rDao = new ReportDao();
	
	public List<Report> selectReportUserList(){
		Connection conn = getConnection();
		List<Report> list = rDao.selectReportUserList(conn);
		
		close(conn);
		return list;
		
	}
	
	public List<Report> selectReportReviewList(){
		Connection conn = getConnection();
		List<Report> list = rDao.selectReportReviewList(conn);
		
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
}
