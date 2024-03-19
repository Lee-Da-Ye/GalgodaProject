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

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.customer.model.vo.Review;
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
			pstmt.setString(11, h.getTagNo());
			pstmt.setString(12, h.getImgPath());
			pstmt.setInt(13, h.getMemNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int insertHoAttachment(Connection conn, List<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHoAttachment");

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

	public int selectListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}


	public int selectRevListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRevListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}


	public List<Reservation> selectList(Connection conn, PageInfo pi, String hotelName){
		List<Reservation> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, hotelName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Reservation ( rset.getInt("res_no")
						, rset.getInt("hotel_no")
						, rset.getInt("user_no")
						, rset.getInt("ro_no")
						, rset.getString("date_in")
						, rset.getString("date_out")
						, rset.getDate("res_date")
						, rset.getString("res_status")
						, rset.getString("req")
						, rset.getString("reason_cancel")
						, rset.getString("pay_method")
						, rset.getInt("pay")
						, rset.getDate("pay_date")
						, rset.getInt("res_people")
						, rset.getString("res_name")
						, rset.getString("res_phone")
						, rset.getString("res_email")
						));
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}




	public List<Review> selectRevList(Connection conn, PageInfo pi, String hotelName){
		List<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRevList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, hotelName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				Review r = new Review();
				r.setRevNo(rset.getInt("rev_no"));
				r.setUserId(rset.getString("user_id"));
				r.setResNo(rset.getInt("res_no"));
				r.setRegistDate( rset.getDate("regist_date"));
				r.setRevRating(rset.getInt("rev_rating"));
				r.setRevTitle(rset.getString("rev_title"));
				
				list.add(r);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}
}
