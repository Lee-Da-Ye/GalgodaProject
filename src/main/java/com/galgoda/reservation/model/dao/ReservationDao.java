package com.galgoda.reservation.model.dao;

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
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.customer.model.vo.Review;
import com.galgoda.customer.model.vo.Wishlist;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Room;

public class ReservationDao {

	private Properties prop = new Properties();

	public ReservationDao() {
		try {
			prop.loadFromXML(new FileInputStream( ReservationDao.class.getResource("/db/mappers/reservation-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Hotel> searchHotelName(Connection conn, Reservation r){
		List<Hotel> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("searchHotelName");
		
		String hotelName = "%"+r.getHotelName()+"%";

		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1,hotelName );
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.setHotelNo(rset.getInt("HOTEL_NO"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setTagNo(rset.getString("tag_no"));
				h.setImgPath(rset.getString("img_path"));
				h.setReviewCount(rset.getInt("review_count"));
				h.setMinPrice(rset.getInt("min_price"));
				
				list.add(h);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<Hotel> searchTagName(Connection conn, Reservation r){
		
		List<Hotel> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String tagNo =  r.getTagNo();
		
		String sql = prop.getProperty("searchTagName");
		
		try {
			
			if(tagNo != null) {
				String[] tags = tagNo.split(","); // 1,2,3,4
			
				
				if (tags.length > 0) {
			        sql += " AND (";
			        for (int i = 0; i < tags.length; i++) {
			            if (i > 0) {
			                sql += " OR ";
			            }
			            sql += "h.tag_no LIKE '%" + tags[i] + ",%' ";
			        }
			        sql += ")";
			    }
			}
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.setHotelNo(rset.getInt("HOTEL_NO"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setTagNo(rset.getString("tag_no"));
				h.setImgPath(rset.getString("img_path"));
				h.setReviewCount(rset.getInt("review_count"));
				h.setMinPrice(rset.getInt("min_price"));
				
				list.add(h);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
	}

	public int wishList(Connection conn,int  userNo,int wishHotelNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addwishList");

		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, wishHotelNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Review> selectReviewList(Connection conn, int no) {
		List<Review> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review re = new Review();
				re.setRevNo(rset.getInt("rev_no"));
				re.setResNo(rset.getInt("res_no"));
				re.setUserId(rset.getString("user_id"));
				re.setRevTitle(rset.getString("rev_title"));
				re.setRevContent(rset.getString("rev_content"));
				re.setRevRating(rset.getInt("rev_rating"));
				re.setRegistDate(rset.getDate("regist_date"));
				re.setModifyDate(rset.getDate("modify_date"));
				re.setFileNo(rset.getInt("file_no"));
				re.setHotelNo(no);
				
				list.add(re);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public String findRoomName(Connection conn, int roomNo) {
		
		String roomName ="";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findRoomName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				roomName = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return roomName;
		
	}
	
	public int findRoomPrice(Connection conn, int roomNo) {
		
		int roomPrice = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findRoomPrice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				roomPrice = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return roomPrice;
		
	}

	public String findHotelName(Connection conn, int hotelNo) {
		
		String hotelName ="";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findHotelName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hotelName = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hotelName;
		
	}
	public int insertNewReservation(Connection conn, Reservation newRes) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newRes.getHotelName());
			pstmt.setString(2, newRes.getUserId());
			pstmt.setString(3, newRes.getRoName());
			pstmt.setInt(4, newRes.getHotelNo());
			pstmt.setString(5, newRes.getDateIn());
			pstmt.setString(6, newRes.getDateOut());
			pstmt.setString(7, newRes.getPayMethod());
			pstmt.setInt(8, newRes.getPay());
			pstmt.setInt(9, newRes.getResPeople());
			pstmt.setString(10, newRes.getResName());
			pstmt.setString(11, newRes.getResPhone());
			pstmt.setString(12, newRes.getResEmail());
			pstmt.setString(13, newRes.getOpName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int reduceRoomCount(Connection conn, int hotelNo, int roomCount) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reduceRoomCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomCount);
			pstmt.setInt(2, hotelNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	public List<Wishlist> selectwishList(Connection conn, int userNo){
		List<Wishlist> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectwishList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				 Wishlist w = new Wishlist();
				w.setHotelNO(rset.getInt("hotel_no"));
				
				list.add(w);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<Attachment> selectRoomFileList(Connection conn, int no, List<Room> rm) {
		List<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRoomFileList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(Room r : rm) {
				pstmt.setInt(1, r.getRoomNo());
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Attachment at = new Attachment();
					at.setFileNo(rset.getInt("file_no"));
					at.setFilePath(rset.getString("file_path"));
					at.setFileName(rset.getString("file_name"));
					at.setOriginName(rset.getString("file_origin_name"));
					at.setRefNo(rset.getInt("ref_no"));
					list.add(at);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public List<Attachment> selectHotelFileList(Connection conn, int no) {
		List<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelFileList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
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

}
