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
			pstmt.setInt(4, r.getRoNo());
			pstmt.setString(5, r.getOpName());
			pstmt.setString(6, r.getResName());
			pstmt.setString(7, r.getResPhone());
			pstmt.setString(8, r.getResEmail());
			pstmt.setInt(9, r.getPay());
			pstmt.setString(10, r.getPayMethod());
			pstmt.setInt(11, r.getResNo());
			
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
	
}
