package com.galgoda.hotel.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.rollback;
import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.galgoda.common.model.vo.Attachment;
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
		
		int result1 = hDao.insertHotel(conn, h);
		
		int result2 = hDao.insertHoAttachment(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	
	
}
