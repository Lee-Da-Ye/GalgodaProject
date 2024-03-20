package com.galgoda.customerService.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customerService.model.dao.NoticeDao;
import com.galgoda.customerService.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();
	
	public List<Notice> selectNoticeList(PageInfo pi){
		Connection conn = getConnection();
		List<Notice> list = nDao.selectNoticeList(conn, pi);
		
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
	
	public int selectListCount() {
		Connection conn = getConnection();
		int count = nDao.selectListCount(conn);
		
		close(conn);
		return count;
	}
}
