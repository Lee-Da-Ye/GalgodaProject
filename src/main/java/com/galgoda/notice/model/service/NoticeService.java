package com.galgoda.notice.model.service;

import static com.galgoda.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.galgoda.notice.model.dao.NoticeDao;
import com.galgoda.notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();
	
	public List<Notice> selectNoticeList(){
		Connection conn = getConnection();
		List<Notice> list = nDao.selectNoticeList(conn);
		
		close(conn);
		return list;
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = nDao.selectNotice(conn, noticeNo);
		
		close(conn);
		return n;
	}
	
	public int insertHotelNotice(Notice n) {
		Connection conn = getConnection();
		int result = nDao.insertHotelNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int insertAdminNotice(Notice n) {
		Connection conn = getConnection();
		int result = nDao.insertAdminNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = nDao.updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = nDao.deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
