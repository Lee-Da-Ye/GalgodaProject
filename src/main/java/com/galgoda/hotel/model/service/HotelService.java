package com.galgoda.hotel.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;


import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.hotel.model.dao.HotelDao;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Tag;

public class HotelService {

	
	private HotelDao hDao = new HotelDao();
	
	
	public List<Tag> hotelInsertForm(){
		Connection conn = getConnection();
		
		List<Tag> list = hDao.hotelInsertForm(conn);
		close(conn);
		
		return list;
	
	}
	
	public int insertHotel(Hotel h, List<Attachment> list) {
		Connection conn = getConnection();
		int result2 = 1;
		
		int result1 = hDao.insertHotel(conn, h);
		
		 result2 = hDao.insertHoAttachment(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = hDao.selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public List<Reservation> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Reservation> list = hDao.selectList(conn, pi);
		close(conn);
		
		return list;
	}
	
	
}
