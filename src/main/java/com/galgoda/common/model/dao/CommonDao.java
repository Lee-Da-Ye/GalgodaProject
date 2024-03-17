package com.galgoda.common.model.dao;

import static com.galgoda.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.galgoda.member.model.vo.Admin;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.Hotel;


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
	
	
	public Hotel loginHotel(Connection conn, String userId, String userPwd) {
		
		Hotel hotel = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginHotel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hotel = new Hotel(rset.getInt("mem_no")
									  , rset.getString("mem_id")
									  , rset.getString("mem_pwd")
									  , rset.getString("mem_name")
									  , rset.getString("mem_phone")
									  , rset.getString("mem_email")
									  , rset.getDate("regist_date")
									  , rset.getDate("modify_date")
									  , rset.getString("status")
									  , rset.getString("role")
									  , rset.getInt("authenticode")
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

}
