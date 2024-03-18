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
	
	
	
}
