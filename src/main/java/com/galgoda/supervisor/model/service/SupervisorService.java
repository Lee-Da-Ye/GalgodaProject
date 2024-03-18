package com.galgoda.supervisor.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.galgoda.member.model.vo.Customer;
import com.galgoda.supervisor.model.dao.SupervisorDao;
import static com.galgoda.common.template.JDBCTemplate.*;

public class SupervisorService {
	
	public SupervisorDao sDao = new SupervisorDao();

	public List<Customer> selectUserList() {
		Connection conn = getConnection();
		List<Customer> list = sDao.selectUserList(conn);
		close(conn);
		
		return list;
	}
	
}
