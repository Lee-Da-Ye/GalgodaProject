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
import com.galgoda.hotel.model.vo.Option;
import com.galgoda.hotel.model.vo.Report;
import com.galgoda.hotel.model.vo.Room;
import com.galgoda.hotel.model.vo.Tag;
import com.galgoda.member.model.vo.HotelUser;



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
	
	public Hotel  selectHotelNo(Connection conn, String hotelName) {
		Hotel h = new Hotel();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelNo");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotelName);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				h.setHotelNo(rset.getInt("hotel_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return h;
	}
	
	
	public List<Option> roomInsertForm(Connection conn){
		List<Option> list = new ArrayList<>();
		Option o = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("roominsertForm");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				o = new Option();
				o.setOpNo(rset.getInt("op_no"));
				o.setOpName(rset.getString("op_name"));

				list.add(o);

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
	
	public int insertRoom(Connection conn, Room r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRoom");

		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getHotelNo());
			pstmt.setString(2, r.getRoomName());
			pstmt.setString(3, r.getRoomSize());
			pstmt.setInt(4, r.getRoPeople());
			pstmt.setInt(5, r.getRoBath());
			pstmt.setInt(6, r.getRoPrice());
			pstmt.setInt(7, r.getRoCount());
			pstmt.setString(8, r.getOpNo());
			pstmt.setString(9, r.getImgPath());

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
				pstmt.setString(3, at.getOriginName());

				result = pstmt.executeUpdate();
			}



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertRoAttachment(Connection conn,List<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRoAttachment");

		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, at.getFilePath());
				pstmt.setString(2, at.getFileName());
				pstmt.setString(3, at.getOriginName());

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
	

	public Reservation selectReservation(Connection conn, int resNo) {
		Reservation r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				r = new Reservation();
				r.setResNo(rset.getInt("res_no"));
				r.setHotelNo(rset.getInt("hotel_no"));
				r.setHotelName(rset.getString("hotel_name"));
				r.setUserNo(rset.getInt("user_no"));
				r.setRoNo(rset.getInt("ro_no"));
				r.setDateIn(rset.getString("date_in"));
				r.setDateOut(rset.getString("date_out"));
				r.setResStatus(rset.getString("res_status"));
				r.setReq(rset.getString("req"));
				r.setReasonCancel(rset.getString("reason_cancel"));
				r.setPayMethod(rset.getString("pay_method"));
				r.setPay(rset.getInt("pay"));
				r.setPayDate(rset.getDate("pay_date"));
				r.setResPeople(rset.getInt("res_people"));
				r.setResName(rset.getString("res_name"));
				r.setResPhone(rset.getString("res_phone"));
				r.setResEmail(rset.getString("res_email"));
				r.setRoName(rset.getString("ro_name"));
				r.setOpName(rset.getString("op_name"));
				r.setUserId(rset.getString("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rset);
			close(pstmt);
		}
		return r;
		
		
	}
	
	
	public Review selectReview(Connection conn, int revNo) {
		Review r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				r = new Review();
				r.setRevNo(rset.getInt("rev_no"));
				r.setResNo(rset.getInt("res_no"));
				r.setUserNo(rset.getInt("user_no"));
				r.setRevRating(rset.getInt("rev_rating"));
				r.setRevTitle(rset.getString("rev_title"));
				r.setRevContent(rset.getString("rev_content"));
				r.setRegistDate(rset.getDate("regist_date"));
				r.setUserId(rset.getString("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rset);
			close(pstmt);
		}
		return r;
		
	}

	public HotelUser selectHotelUser(Connection conn, String userId) {
		
		HotelUser hu = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hu = new HotelUser(rset.getInt("mem_no")
				         , rset.getString("mem_id")
				         , rset.getString("mem_pwd")
				         , rset.getString("mem_name")
				         , rset.getString("mem_phone")
				         , rset.getString("mem_email")
				         , rset.getString("hotel_name"));
		
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hu;
		
	}
	
	public int updatePersonalInfo(Connection conn, HotelUser hu) {
		
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePersonalInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hu.getMemName());
			pstmt.setString(2, hu.getMemPwd());
			pstmt.setString(3, hu.getMemPhone());
			pstmt.setString(4, hu.getMemEmail());
			pstmt.setString(5, hu.getMemId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int reportUser(Connection conn, Report r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reportUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getResNo());
			pstmt.setString(2, r.getRepReason());
			pstmt.setString(3, r.getRepContent());
			pstmt.setInt(4, r.getRepRefNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int confirmReservation(Connection conn, int resNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("confirmReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int cancelReservation(Connection conn, int resNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("cancelReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public Hotel selectHotelForm(Connection conn, int memNo) {
		
		Hotel h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelForm");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				h = new Hotel();
				h.setHotelNo(rset.getInt("hotel_no"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setHotelAddress(rset.getString("hotel_address"));
				h.setHotelDetailAdd(rset.getString("hotel_detailadd"));
				h.setHotelTel(rset.getString("hotel_tel"));
				h.setHotelSite(rset.getString("hotel_site"));
				h.setHotelCheckin(rset.getInt("hotel_checkin"));
				h.setHotelCheckout(rset.getInt("hotel_checkout"));
				h.setHotelDetail(rset.getString("hotel_detail"));
				h.setHotelIntro(rset.getString("hotel_intro"));
				h.setRefundpolicy(rset.getString("refundpolicy"));
				h.setTagNo(rset.getString("tag_no"));
				h.setImgPath(rset.getString("img_path"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return h;
		
				
	}
	
	public List<Room> selectRoomList(Connection conn, String hotelName) {
		List<Room> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRoomList");

		try {
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, hotelName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Room r = new Room();
				r.setRoomNo(rset.getInt("ro_no"));
				r.setHotelNo(rset.getInt("hotel_no"));
				r.setRoomName(rset.getString("ro_name"));
				r.setRoomSize(rset.getString("ro_size"));
				r.setRoPeople(rset.getInt("ro_bathroom"));
				r.setRoPrice(rset.getInt("ro_price"));
				r.setRoCount(rset.getInt("ro_count"));
				r.setOpNo(rset.getString("op_no"));
				r.setImgPath(rset.getString("img_path"));
				
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
	
	public int deleteHotelUser(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteHotelUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int updateHotel(Connection conn, Hotel h ) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHotel");

		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, h.getHotelAddress());
			pstmt.setString(2, h.getHotelDetailAdd());
			pstmt.setString(3, h.getHotelTel());
			pstmt.setString(4, h.getHotelSite());
			pstmt.setInt(5, h.getHotelCheckin());
			pstmt.setInt(6, h.getHotelCheckout());
			pstmt.setString(7, h.getHotelDetail());
			pstmt.setString(8, h.getHotelIntro());
			pstmt.setString(9, h.getRefundpolicy());
			pstmt.setString(10, h.getTagNo());
			pstmt.setString(11, h.getImgPath());
			pstmt.setString(12, h.getHotelName());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateHoAttachment(Connection conn, List<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHoAttachment");

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
	
	
	public List<Attachment> selectFileList(Connection conn, int refNo, String type){
		List<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, refNo);
			pstmt.setString(2, type);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setFilePath(rset.getString("file_path"));
				at.setFileName(rset.getString("file_name"));
				at.setOriginName(rset.getString("file_origin_name"));
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
	
	public int reportReview(Connection conn, Report r) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reportReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getResNo());
			pstmt.setString(2, r.getFileNoList());
			pstmt.setInt(3, r.getRevNo());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteRoom(Connection conn, int roomNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteRoom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteAttachment(Connection conn, int roomNo,String type) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			pstmt.setString(2, type);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int countRoom(Connection conn, int hotelNo) {
		
		int roomCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countRoom");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				roomCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return roomCount;
		
		
	}
	
	public int countRes(Connection conn, int hotelNo) {
		
		int resCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countRes");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				resCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return resCount;
		
		
	}
	
	public int countReview(Connection conn, int hotelNo) {
		
		int reviewCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countReview");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reviewCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewCount;
		
		
	}
		
		
}
 