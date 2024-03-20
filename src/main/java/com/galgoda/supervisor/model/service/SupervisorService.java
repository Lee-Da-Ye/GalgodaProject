package com.galgoda.supervisor.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.supervisor.model.dao.SupervisorDao;
import com.galgoda.supervisor.model.vo.Terms;

import static com.galgoda.common.template.JDBCTemplate.*;

public class SupervisorService {
	
	public SupervisorDao sDao = new SupervisorDao();

	public List<Customer> selectUserList(PageInfo pi) {
		Connection conn = getConnection();
		List<Customer> list = sDao.selectUserList(conn,pi);
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

	public int insertTerm(Terms t, Attachment at) {
		Connection conn = getConnection();
		int result1 = sDao.insertTerm(conn,t);
		int result2 = 1;
		if( at!= null) {
			result2 = sDao.insertTermAt(conn,at);
		}
		
		if(result1 >0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	}

	public Terms detailTerms(int termNo) {
		Connection conn =getConnection();
		Terms t = sDao.detailTerms(conn,termNo);
		close(conn);
		
		return t;
	}

	public Attachment selectFile(int termNo) {
		Connection conn = getConnection();
		Attachment at = sDao.selectFile(conn,termNo);
		close(conn);
		
		return at;
	}

	public int updateTerm(Terms t, Attachment at) {
		Connection conn =getConnection();
		int result1 = sDao.updateTerm(conn,t);
		int result2 = 1;
		if( at!= null) {
			if(at.getFileNo() != 0) {
				result2 = sDao.updateTermAt(conn,at);
			}else {
				result2 = sDao.insertNewTermAt(conn,at);
			}
		}
		
		if(result1 >0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}

	public int deleteTerm(int termNo) {
		Connection conn = getConnection();
		int result = sDao.deleteTerm(conn,termNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int selectUserListCount() {
		Connection conn =getConnection();
		int listCount = sDao.selectUserListCount(conn);
		close(conn);
		
		return listCount;
	}

	public int deleteUser(int userNo) {
		Connection conn = getConnection();
		int result = sDao.deleteUser(conn,userNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
