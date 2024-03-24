package com.galgoda.customerService.model.service;

import java.sql.Connection;
import java.util.List;

import com.galgoda.customerService.model.dao.FaqDao;
import com.galgoda.customerService.model.vo.Faq;
import static com.galgoda.common.template.JDBCTemplate.*;

public class FaqService {
	private FaqDao fDao = new FaqDao();
	
	public List<Faq> selectFaqList(String category){
		Connection conn = getConnection();
		List<Faq> list = fDao.selectFaqList(conn, category);
		
		close(conn);
		return list;
	}
}
