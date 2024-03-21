package com.galgoda.customerService.model.dao;

import static com.galgoda.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.galgoda.customer.model.vo.Review;
import com.galgoda.hotel.model.vo.Report;

public class ReportDao {
	
	private Properties prop = new Properties();
	public ReportDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/db/mappers/customerService-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Report> selectReportUserList(Connection conn){
		List<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Report r = new Report(rset.getInt("rep_no")
						            , rset.getString("rep_reason")
						            , rset.getDate("rep_date")
						            , rset.getString("status")
						            , rset.getString("user_id"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public List<Report> selectReportReviewList(Connection conn){
		List<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportReviewList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Report r = new Report();
				r.setRepNo(rset.getInt("rep_no"));
				r.setUserId(rset.getString("user_id"));
				r.setRevTitle(rset.getString("rev_title"));
				r.setRepDate(rset.getDate("rep_date"));
				r.setStatus(rset.getString("status"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Report selectReportUser(Connection conn, int repNo) {
		Report r = new Report();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, repNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r.setRepNo(rset.getInt("rep_no"));
				r.setUserId(rset.getString("user_id"));
				r.setResNo(rset.getInt("res_no"));
				r.setRepReason(rset.getString("rep_reason"));
				r.setRepContent(rset.getString("rep_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public Report selectReportReview(Connection conn, int repNo) {
		Report r = new Report();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, repNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r.setRepNo(rset.getInt("rep_no"));
				r.setRevNo(rset.getInt("rev_no"));
				r.setUserId(rset.getString("user_id"));
				r.setResNo(rset.getInt("res_no"));
				r.setRegistDate(rset.getDate("regist_date"));
				r.setRevRating(rset.getInt("rev_rating"));
				r.setRevTitle(rset.getString("rev_title"));
				r.setRevContent(rset.getString("rev_content"));
				r.setFileNo(rset.getInt("file_no"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
}
