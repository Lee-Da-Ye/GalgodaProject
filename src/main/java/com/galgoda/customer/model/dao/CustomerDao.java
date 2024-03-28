package com.galgoda.customer.model.dao;

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

import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customer.model.vo.CustomerReview;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.customer.model.vo.Wishlist;
import com.galgoda.member.model.vo.Customer;


public class CustomerDao {
	
	private Properties prop = new Properties();
	
	public CustomerDao() {
		try {
			prop.loadFromXML(new FileInputStream(CustomerDao.class.getResource("/db/mappers/customer-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Reservation> selectReservation(Connection conn, int userNo) {
		
		List<Reservation> reservations = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reservations.add(new Reservation(rset.getInt("res_no")
										       , rset.getInt("hotel_no")
										       , rset.getString("hotel_name")
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
										       , rset.getInt("res_room_count")
										       , rset.getString("res_name")
										       , rset.getString("res_phone")
										       , rset.getString("res_email")
										       , rset.getString("img_path")
										       , rset.getString("ro_name")
										       , rset.getInt("ro_price")
										       , rset.getString("op_name")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reservations;
	}
	
	
	public List<Reservation> selectReservationList(Connection conn, int userNo, PageInfo pi) {
		List<Reservation> reservations = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reservations.add(new Reservation(rset.getInt("res_no")
										       , rset.getInt("hotel_no")
										       , rset.getString("hotel_name")
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
										       , rset.getInt("res_room_count")
										       , rset.getString("res_name")
										       , rset.getString("res_phone")
										       , rset.getString("res_email")
										       , rset.getString("img_path")
										       , rset.getString("ro_name")
										       , rset.getInt("ro_price")
										       , rset.getString("op_name")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reservations;
		
		
		
		
	}
	
	public Reservation selectReservationCase(Connection conn, int resNo) {
		
		Reservation reservation = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservationCase");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reservation = new Reservation(rset.getInt("res_no")
									       , rset.getInt("hotel_no")
									       , rset.getString("hotel_name")
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
									       , rset.getInt("res_room_count")
									       , rset.getString("res_name")
									       , rset.getString("res_phone")
									       , rset.getString("res_email")
									       , rset.getString("img_path")
									       , rset.getString("ro_name")
									       , rset.getString("op_name"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reservation;
	}
	
	public List<Wishlist> selectWishlist(Connection conn, int userNo) {
		
		List<Wishlist> wishlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWishlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				wishlist.add(new Wishlist(rset.getInt("wish_no")
						                , rset.getInt("user_no")
						                , rset.getInt("hotel_no")
						                , rset.getString("hotel_name")
						                , rset.getDate("reg_date")
						                , rset.getString("img_path")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wishlist;
	}
	
	public Customer selectCustomer(Connection conn, String userId) {
		
		Customer ct = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCustomer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ct = new Customer(rset.getInt("user_no")
						        , rset.getString("user_id")
						        , rset.getString("user_name")
						        , rset.getString("user_eng_name")
						        , rset.getString("user_pwd")
						        , rset.getString("birth_date")
						        , rset.getString("email")
						        , rset.getString("phone")
						        , rset.getString("zipcode")
						        , rset.getString("address")
						        , rset.getString("address_detail")
						        , rset.getString("etc")
						        , rset.getDate("regist_date")
						        , rset.getDate("modify_date")
						        , rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return ct;
		
	}
	
	public int updatePersonalInfo(Connection conn, Customer ct) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePersonalInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ct.getUserName());
			pstmt.setString(2, ct.getUserPwd());
			pstmt.setString(3, ct.getPhone());
			pstmt.setString(4, ct.getEmail());
			pstmt.setString(5, ct.getZipcode());
			pstmt.setString(6, ct.getAddress());
			pstmt.setString(7, ct.getAddressDetail());
			pstmt.setString(8, ct.getEtc());
			pstmt.setString(9, ct.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteCustomer(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCustomer");
		
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
	
	public int updateReservation(Connection conn, Reservation r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getDateIn());
			pstmt.setString(2, r.getDateOut());
			pstmt.setInt(3, r.getResPeople());
			pstmt.setInt(4, r.getResRoomCount());
			pstmt.setInt(5, r.getRoNo());
			pstmt.setString(6, r.getOpName());
			pstmt.setString(7, r.getResName());
			pstmt.setString(8, r.getResPhone());
			pstmt.setString(9, r.getResEmail());
			pstmt.setInt(10, r.getPay());
			pstmt.setString(11, r.getPayMethod());
			pstmt.setInt(12, r.getResNo());
			
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
	
	public int deleteWishlist(Connection conn, int wishNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteWishlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wishNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int countRes(Connection conn, int userNo) {
		
		int resCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countRes");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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
	
	public int countWish(Connection conn, int userNo) {
		
		int wishCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				wishCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wishCount;
		
		
	}
	
	public int countReview(Connection conn, int userNo) {
		
		int reviewCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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
	
	
	
	
	public List<CustomerReview> selectReviewList(Connection conn, int userNo) {
		
		List<CustomerReview> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList"); // mapper에 properties 내에 entry key값을 메소드명으로 해뒀기 때문에
	
		try {
			pstmt = conn.prepareStatement(sql); // 애초에 sql문 담은채로 생성, 완성된 형태
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CustomerReview(
									rset.getInt("rev_no"),
									rset.getInt("res_no"),
									rset.getInt("hotel_no"),
									rset.getString("rev_title"),
									rset.getString("date_in"),
									rset.getString("date_out"),
									rset.getInt("res_people"),
									rset.getString("img_path"),
									rset.getString("hotel_name")
									));
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{ 
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}
	
	
	
	public int insertReview(Connection conn, CustomerReview r) {
		// insert문 => 처리된 행수 => int
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getResNo());
			pstmt.setString(2,r.getRevTitle());
			pstmt.setString(3, r.getRevContent());
			pstmt.setInt(4, r.getRevRating());
			pstmt.setInt(5, r.getHotelNo());
			pstmt.setInt(6, r.getUserNo());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteReview(Connection conn, int revNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
	

public CustomerReview selectRev(Connection conn, int revNo) {
		CustomerReview r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRev");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new CustomerReview(rset.getInt("rev_no")
							  , rset.getInt("res_no") 
							  , rset.getInt("hotel_no") 
							  , rset.getString("rev_title") 
							  , rset.getString("rev_content") 
							  , rset.getInt("rev_rating") 
							  , rset.getString("date_in") 
							  , rset.getString("date_out") 
							  , rset.getInt("res_people")
							  , rset.getString("img_path")
							  , rset.getString("hotel_name"));
				
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	
	public int updateReview(Connection conn, CustomerReview r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRevTitle());
			pstmt.setString(2, r.getRevContent());
			pstmt.setInt(3, r.getRevRating());
			pstmt.setInt(4, r.getRevNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
		
	}

	public int findRoomPrice(Connection conn, int hotelNo, int roomNo) {
		
		int roomPrice = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findRoomPrice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);
			pstmt.setInt(2, roomNo);
			
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
	
}
