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

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customerService.model.vo.Inq;
import com.galgoda.hotel.model.vo.Hotel;

public class InqDao {
	Properties prop = new Properties();
	public InqDao() {
		try {
			prop.loadFromXML(new FileInputStream(Inq.class.getResource("/db/mappers/customerService-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Hotel> selectHotelName(Connection conn){
		List<Hotel> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.setHotelName(rset.getString("HOTEL_NAME"));
				list.add(h);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public int insertInq(Connection conn, Inq inq) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inq.getInqTitle());
			pstmt.setString(2, inq.getInqContent());
			pstmt.setString(3, inq.getInqWriter());
			pstmt.setString(4, inq.getWriterPhone());
			pstmt.setString(5, inq.getWriterEmail());
			pstmt.setString(6, inq.getCategory());
			pstmt.setString(7, inq.getInqType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertAttachment(Connection conn, List<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getFilePath());
				pstmt.setString(2, at.getFileName());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public List<Inq> selectInqUserList(Connection conn, PageInfo pi){
		List<Inq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInqUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Inq inq = new Inq();
				inq.setInqNo(rset.getInt("INQ_NO"));
				inq.setCategory(rset.getString("HOTEL_NAME"));
				inq.setInqType(rset.getString("INQ_TYPE"));
				inq.setInqTitle(rset.getString("INQ_TITLE"));
				inq.setRegistDate(rset.getString("REGIST_DATE"));
				inq.setStauts(rset.getString("STATUS"));
				
				list.add(inq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public List<Inq> selectInqHotelList(Connection conn, PageInfo pi, String hotelName){
		List<Inq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInqHotelList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, hotelName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Inq inq = new Inq();
				inq.setInqNo(rset.getInt("INQ_NO"));
				inq.setCategory(rset.getString("HOTEL_NAME"));
				inq.setInqType(rset.getString("INQ_TYPE"));
				inq.setInqTitle(rset.getString("INQ_TITLE"));
				inq.setRegistDate(rset.getString("REGIST_DATE"));
				inq.setStauts(rset.getString("STATUS"));
				
				list.add(inq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public Inq selectInq(Connection conn, int inqNo) {
		Inq inq = new Inq();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				inq.setInqNo(rset.getInt("INQ_NO"));
				inq.setCategory(rset.getString("HOTEL_NAME"));
				inq.setInqType(rset.getString("INQ_TYPE"));
				inq.setInqWriter(rset.getString("INQ_WRITER"));
				inq.setInqTitle(rset.getString("INQ_TITLE"));
				inq.setInqContent(rset.getString("INQ_CONTENT"));
				inq.setAnsContent(rset.getString("ANS_CONTENT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return inq;
	}
	
	public List<Attachment> selectInqAttachment(Connection conn, int inqNo){
		List<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInqAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setFilePath(rset.getString("file_path"));
				at.setFileName(rset.getString("file_name"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int updateInq(Connection conn, int inqNo, String inqAnswer) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inqAnswer);
			pstmt.setInt(2, inqNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectInqListCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInqListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public int selectInqHotelListCount(Connection conn, String hotelName) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInqHotelListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotelName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
}
