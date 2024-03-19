package com.galgoda.supervisor.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.supervisor.model.dao.SupervisorDao;
import com.galgoda.supervisor.model.vo.Terms;

import static com.galgoda.common.template.JDBCTemplate.*;

public class SupervisorService {
	
	public SupervisorDao sDao = new SupervisorDao();

	public List<Customer> selectUserList() {
		Connection conn = getConnection();
		List<Customer> list = sDao.selectUserList(conn);
		close(conn);
		
		return list;
	}

	public Customer selectUser(int userNo) {
		Connection conn = getConnection();
		Customer user = sDao.selectUser(conn,userNo);
		close(conn);
		
		return user;
	}

	public Customer updateUser(Customer user) {
		Connection conn = getConnection();
		int result = sDao.updateUser(conn,user);
		Customer updateUser = null;
		if(result>0) {
			commit(conn);
			
			updateUser = sDao.selectUser(conn,user.getUserNo() );
		}else {
			rollback(conn);
		}
		close(conn);
		return updateUser;
	}

	public List<Terms> selectTermsList() {
		Connection conn = getConnection();
		List<Terms> list = sDao.selectTermsList(conn);
		close(conn);
		
		return list;
	}

	public List<HotelUser> selectHotelList(PageInfo pi) {
		Connection conn = getConnection();
		List<HotelUser> list = sDao.selectHotelList(conn,pi);
		close(conn);
		
		return list;
	}

	public int selectHotelListCount() {
		Connection conn = getConnection();
		int listCount = sDao.selectHotelListCount(conn);
		close(conn);
		
		return listCount;
	}
	
}
