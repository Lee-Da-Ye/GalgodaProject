package com.galgoda.inq.model.service;

import static com.galgoda.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.inq.model.dao.InqDao;

public class InqService {
	
	private InqDao iDao = new InqDao();
	
	public List<Hotel> selectHotelName(){
		Connection conn = getConnection();
		List<Hotel> list = iDao.selectHotelName(conn);
		
		close(conn);
		return list;
	}
}
