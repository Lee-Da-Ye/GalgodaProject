package com.galgoda.customerService.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.customerService.model.dao.InqDao;
import com.galgoda.customerService.model.vo.Inq;
import com.galgoda.hotel.model.vo.Hotel;

public class InqService {
	
	private InqDao iDao = new InqDao();
	
	public List<Hotel> selectHotelName(){
		Connection conn = getConnection();
		List<Hotel> list = iDao.selectHotelName(conn);
		
		close(conn);
		return list;
	}
	
	public int insertInq(Inq inq, List<Attachment> list) {
		Connection conn = getConnection();
		int result1 = iDao.insertInq(conn, inq);
		
		int result2 = 1;
		
		if(!list.isEmpty()) {
			result2 = iDao.insertAttachment(conn, list);
		}
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	public List<Inq> selectInqList(){
		Connection conn = getConnection();
		List<Inq> list = iDao.selectInqList(conn);
		
		close(conn);
		return list;
	}
	
	public Inq selectInq(int inqNo) {
		Connection conn = getConnection();
		Inq inq = iDao.selectInq(conn, inqNo);
		
		close(conn);
		return inq;
	}
	
	public int updateInq(int inqNo, String inqAnswer) {
		Connection conn = getConnection();
		int result = iDao.updateInq(conn, inqNo, inqAnswer);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
