package com.galgoda.customerService.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.galgoda.common.template.JDBCTemplate.*;

import com.galgoda.customerService.model.vo.Faq;

public class FaqDao {
	
	private Properties prop = new Properties();
	public FaqDao() {
		try {
			prop.loadFromXML(new FileInputStream(FaqDao.class.getResource("/db/mappers/customerService-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Faq> selectFaqList(Connection conn, String category){
		List<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaqList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Faq f = new Faq();
				f.setFaqNo(rset.getInt("faq_NO"));
				f.setFaqContent(rset.getString("faq_content"));
				f.setFaqAnswer(rset.getString("faq_answer"));
				
				list.add(f);
				
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
