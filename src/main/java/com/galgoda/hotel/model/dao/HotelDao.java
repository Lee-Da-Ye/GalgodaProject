package com.galgoda.hotel.model.dao;

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

import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Tag;



public class HotelDao {

	
	private Properties prop = new Properties();
	
	public HotelDao() {
		try {
			prop.loadFromXML(new FileInputStream( HotelDao.class.getResource("/db/mappers/hotel-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public List<Tag> hotelInsertForm(Connection conn){
		List<Tag> list = new ArrayList<>();
		Tag t = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("hotelinsertForm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				t = new Tag();
				t.setTagNo(rset.getInt("tag_no"));
				t.setTagName(rset.getString("tag_name"));
				
				list.add(t);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public int insertHotel(Connection conn,Hotel h) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHotel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h.getHotelName());
			pstmt.setString(2, h.getHotelAddress());
			pstmt.setString(3, h.getHotelDetailAdd());
			pstmt.setString(4, h.getHotelTel());
			pstmt.setString(5, h.getHotelSite());
			pstmt.setInt(6, h.getHotelCheckin());
			pstmt.setInt(7, h.getHotelCheckout());
			pstmt.setString(8, h.getHotelDetail());
			pstmt.setString(9, h.getHotelIntro());
			pstmt.setString(10, h.getRefundpolicy());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
