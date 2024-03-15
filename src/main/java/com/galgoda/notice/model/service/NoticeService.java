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
}
