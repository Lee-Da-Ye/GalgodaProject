package com.galgoda.common.model.dao;

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
import com.galgoda.member.model.vo.Admin;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.supervisor.model.vo.Terms;


public class CommonDao {
	
	private Properties prop = new Properties();
	
	public CommonDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(CommonDao.class.getResource("/db/mappers/common-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public Customer loginCustomer(Connection conn, String userId, String userPwd) {
		
		Customer customer = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginCustomer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				customer = new Customer(rset.getInt("user_no")
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
		return customer;
		
	}
	
	
	public HotelUser loginHotel(Connection conn, String userId, String userPwd) {
		
		HotelUser hotel = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginHotel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hotel = new HotelUser(rset.getInt("mem_no")
									  , rset.getString("mem_id")
									  , rset.getString("mem_pwd")
									  , rset.getString("mem_name")
									  , rset.getString("mem_phone")
									  , rset.getString("mem_email")
									  , rset.getDate("regist_date")
									  , rset.getDate("modify_date")
									  , rset.getString("status")
									  , rset.getString("authenticode")
									  , rset.getString("hotel_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hotel;
		
	}
	
	public Admin loginAdmin(Connection conn, String userId, String userPwd) {
		
		Admin admin = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				admin = new Admin(rset.getInt("admin_no")
									  , rset.getString("admin_id")
									  , rset.getString("admin_pwd")
									  , rset.getString("admin_name")
									  , rset.getString("phone")
									  , rset.getString("email")
									  , rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return admin;
		
	}
	
	public int insertCustomer(Connection conn, Customer ct) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCustomer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ct.getUserId());
			pstmt.setString(2, ct.getUserName());
			pstmt.setString(3, ct.getUserEngName());
			pstmt.setString(4, ct.getUserPwd());
			pstmt.setString(5, ct.getBirthDate());
			pstmt.setString(6, ct.getEmail());
			pstmt.setString(7, ct.getPhone());
			pstmt.setString(8, ct.getZipcode());
			pstmt.setString(9, ct.getAddress());
			pstmt.setString(10, ct.getAddressDetail());
			pstmt.setString(11, ct.getEtc());
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public int isEmailDuplicate(Connection conn, String email) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("isEmailDuplicate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public int isHotelEmailDuplicate(Connection conn, String email) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("isHotelEmailDuplicate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public int isUserIdDuplicate(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("isUserIdDuplicate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public int isHotelUserIdDuplicate(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("isHotelUserIdDuplicate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public int isCodeAccord(Connection conn, String hotelName, String verificationCode) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("isCodeAccord");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotelName);
			pstmt.setString(2, verificationCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	
	public int updateHotelUser(Connection conn, HotelUser hu) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHotelUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hu.getMemId());
			pstmt.setString(2, hu.getMemPwd());
			pstmt.setString(3, hu.getMemName());
			pstmt.setString(4, hu.getMemPhone());
			pstmt.setString(5, hu.getMemEmail());
			pstmt.setString(6, hu.getHotelName());
			pstmt.setString(7, hu.getAuthentiCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public String findUserId(Connection conn, String userName, String phone) {
		
		String userId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findUserId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userId = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
	}
	
	public String findHotelUserId(Connection conn, String userName, String phone) {
		
		String userId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findHotelUserId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userId = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
	}
	
	public String findAdminUserId(Connection conn, String userName, String phone) {
		
		String userId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findAdminUserId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userId = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
	}
	
	public int resetCustomerPwd(Connection conn, String userId, String newPassword) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("resetCustomerPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int resetHotelUserPwd(Connection conn, String userId, String newPassword) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("resetHotelUserPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int resetAdminPwd(Connection conn, String userId, String newPassword) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("resetAdminPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int confirmCustomer(Connection conn, String userId, String phone) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("confirmCustomer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}	
	
	public int confirmHotel(Connection conn, String userId, String phone) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("confirmHotel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}	
	
	public int confirmAdmin(Connection conn, String userId, String phone) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("confirmAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}	
	
	public List<Hotel> selectPopularHotelList(Connection conn) {
		
		List<Hotel> popularHotelList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPopularHotelList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				popularHotelList.add(new Hotel(rset.getString("hotel_name")
					       , rset.getInt("hotel_no")
					       , rset.getInt("res_count")
					       , rset.getString("img_path")));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return popularHotelList;
		
	}

	public List<Terms> selectTermsList(Connection conn) {
		List<Terms> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTermsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Terms(
							rset.getInt("terms_no")
						  ,	rset.getString("terms_title")
						  , rset.getString("terms_content")
						  , rset.getString("admin_id")
						  , rset.getString("notes")
						  , rset.getString("regist_date")
						  , rset.getString("modify_date")
						  , rset.getString("status")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 태그 목록 조회용 메소드
	public List<Tag> selectTagList(Connection conn){
		List<Tag> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTagList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Tag t = new Tag();
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
}
