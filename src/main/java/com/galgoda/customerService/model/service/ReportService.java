package com.galgoda.customerService.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.galgoda.common.model.vo.Attachment;
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
	
	public int deleteReportReview(int revNo) {
		Connection conn = getConnection();
		
		
		int result1 = rDao.deleteReview(conn, revNo);
		int result2 = rDao.deleteReportReview(conn, revNo);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	public int deleteReportUser(String userId) {
		Connection conn = getConnection();
		int result1 = rDao.deleteUser(conn, userId);
		int result2 = rDao.deleteReportUser(conn, userId);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	public int cancelReport(int repNo) {
		Connection conn = getConnection();
		int result = rDao.cancelReport(conn, repNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Attachment> selectReportReviewAttachment(int repNo){
		Connection conn = getConnection();
		List<Attachment> list = rDao.selectReportReviewAttachment(conn, repNo);
		
		close(conn);
		return list;
	}
}
