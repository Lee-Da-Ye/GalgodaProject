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

import com.galgoda.common.model.dao.CommonDao;
import com.galgoda.member.model.vo.Customer;
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
	
	
	
}
