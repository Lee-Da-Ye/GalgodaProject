package com.galgoda.inq.model.dao;

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

import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.inq.model.vo.Inq;

public class InqDao {
	Properties prop = new Properties();
	public InqDao() {
		try {
			prop.loadFromXML(new FileInputStream(Inq.class.getResource("/db/mappers/inq-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Hotel> selectHotelName(Connection conn){
		List<Hotel> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.setHotelName(rset.getString("HOTEL_NAME"));
				list.add(h);
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
