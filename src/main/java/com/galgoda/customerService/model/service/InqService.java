package com.galgoda.customerService.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.model.vo.PageInfo;
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
			result2 = iDao.insertInqAttachment(conn, list);
		}
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	public List<Inq> selectInqUserList(PageInfo pi, String userName){
		Connection conn = getConnection();
		List<Inq> list = iDao.selectInqUserList(conn, pi, userName);
		
		close(conn);
		return list;
	}
	
	public List<Inq> selectInqHotelList(PageInfo pi, String hotelName){
		Connection conn = getConnection();
		List<Inq> list = iDao.selectInqHotelList(conn, pi, hotelName);
		
		close(conn);
		return list;
	}
	
	public List<Inq> selectInqList(PageInfo pi){
		Connection conn = getConnection();
		List<Inq> list = iDao.selectInqList(conn, pi);
		
		close(conn);
		return list;
	}
	
	
	public Inq selectInq(int inqNo) {
		Connection conn = getConnection();
		Inq inq = iDao.selectInq(conn, inqNo);
		
		close(conn);
		return inq;
	}
	
	public List<Attachment> selectInqAttachment(int inqNo){
		Connection conn = getConnection();
		List<Attachment> list = iDao.selectInqAttachment(conn, inqNo);
		
		close(conn);
		return list;
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
	
	public int selectInqListCount() {
		Connection conn = getConnection();
		int count = iDao.selectInqListCount(conn);
		
		close(conn);
		return count;
	}
	
	public int selectInqUserListCount(String userName) {
		Connection conn = getConnection();
		int count = iDao.selectInqUserListCount(conn, userName);
		
		close(conn);
		return count;
	}
	
	public int selectInqHotelListCount(String hotelName) {
		Connection conn = getConnection();
		int count = iDao.selectInqHotelListCount(conn, hotelName);
		
		close(conn);
		return count;
	}
	
	public int deleteInq(int inqNo) {
		Connection conn = getConnection();
		int result = iDao.deleteInq(conn, inqNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Inq> selectInqAdminList(String hotelName){
		Connection conn = getConnection();
		List<Inq> list = iDao.selectInqAdminList(conn, hotelName);
		
		close(conn);
		return list;
	}
	
	public List<Inq> selectInqList(){
		Connection conn = getConnection();
		List<Inq> list = iDao.selectInqList(conn);
		
		close(conn);
		return list;
	}
}
