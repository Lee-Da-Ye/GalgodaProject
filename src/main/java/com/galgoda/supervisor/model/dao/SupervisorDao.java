package com.galgoda.supervisor.model.dao;

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
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.supervisor.model.vo.Terms;


import static com.galgoda.common.template.JDBCTemplate.*;
public class SupervisorDao {
	private Properties prop = new Properties();
	public SupervisorDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(SupervisorDao.class.getResource("/db/mappers/supervisor-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<Customer> selectUserList(Connection conn) {
		List<Customer> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Customer(rset.getInt("user_no")
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
						  , rset.getString("status")));
							
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
				
		return list;
	}
	public Customer selectUser(Connection conn, int userNo) {
		Customer user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new Customer(rset.getInt("user_no")
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
		
		
		return user;
	}
	public int updateUser(Connection conn, Customer user) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPhone());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getAddressDetail());
			pstmt.setString(6, user.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public List<Terms> selectTermsList(Connection conn) {
		List<Terms> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
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
	public List<HotelUser> selectHotelList(Connection conn, PageInfo pi) {
		List<HotelUser> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HotelUser hotelUser = new HotelUser();
				hotelUser.setMemNo(rset.getInt("mem_no"));
				hotelUser.setMemName(rset.getString("mem_name"));
				hotelUser.setMemId(rset.getString("mem_id"));
				hotelUser.setHotelName(rset.getString("hotel_name"));
				hotelUser.setMemEmail(rset.getString("mem_email"));
				hotelUser.setMemPhone(rset.getString("mem_phone"));
				hotelUser.setHotelNo(rset.getInt("hotel_no"));
				hotelUser.setHotelAddress(rset.getString("hotel_address"));
				list.add(hotelUser);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int selectHotelListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	public int insertTerm(Connection conn, Terms t) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTerm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t.getTermsTitle());
			pstmt.setString(2, t.getTermsContent());
			pstmt.setString(3, t.getAdminNo());
			pstmt.setString(4, t.getNotes());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertTermAt(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTermAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getFileName());
			pstmt.setString(2, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public Terms detailTerms(Connection conn, int termNo) {
		Terms t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, termNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				t = new Terms();
				t.setTermsNo(rset.getInt("terms_no"));
				t.setTermsTitle(rset.getString("terms_title"));
				t.setTermsContent(rset.getString("terms_content"));
				t.setAdminNo(rset.getString("admin_id"));
				t.setNotes(rset.getString("notes"));
				t.setModifyDate(rset.getString("modify_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return t;
	}
	public Attachment selectFile(Connection conn, int termNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, termNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment();
				at.setFileName(rset.getString("file_name"));
				at.setFileNo(rset.getInt("file_no"));
				at.setFilePath(rset.getString("file_path"));
				at.setRefNo(rset.getInt("ref_no"));
				at.setRefType(rset.getString("ref_type"));
				at.setStatus(rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
	public int updateTerm(Connection conn, Terms t) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTerm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTermsTitle());
			pstmt.setString(2, t.getTermsContent());
			pstmt.setString(3, t.getNotes());
			pstmt.setInt(4, t.getTermsNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateTermAt(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTermAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getFileName());
			pstmt.setString(2, at.getFilePath());
			pstmt.setInt(3, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertNewTermAt(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewTermAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, at.getRefNo());
			pstmt.setString(2, at.getFileName());
			pstmt.setString(3, at.getFilePath());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteTerm(Connection conn, int termNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTerm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, termNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
}
