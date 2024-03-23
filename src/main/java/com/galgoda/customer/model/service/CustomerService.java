package com.galgoda.customer.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customer.model.dao.CustomerDao;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.customer.model.vo.Wishlist;
import com.galgoda.member.model.vo.Customer;

public class CustomerService {

	public CustomerDao cDao = new CustomerDao();
	
	public List<Reservation> selectReservation(int userNo){
		Connection conn = getConnection();
		List<Reservation> reservations = cDao.selectReservation(conn, userNo);
		close(conn);
		return reservations;
	}
	
	public List<Reservation> selectReservationList(int userNo, PageInfo pi) {
		Connection conn = getConnection();
		List<Reservation> reservations = cDao.selectReservationList(conn, userNo, pi);
		close(conn);
		return reservations;
	}
	
	
	public List<Wishlist> selectWishlist(int userNo) {
		Connection conn = getConnection();
		List<Wishlist> wishlist = cDao.selectWishlist(conn, userNo);
		close(conn);
		return wishlist;
	}
	
	public Customer selectCustomer(String userId) {
		Connection conn = getConnection();
		Customer ct = cDao.selectCustomer(conn, userId);
		
		close(conn);
		
		return ct;
		
	}
	
	public Customer updatePersonalInfo(Customer ct) {
		Connection conn = getConnection();
		int result = cDao.updatePersonalInfo(conn, ct);
		
		Customer updateCt = null;
		if(result > 0) { // 업데이트 성공
			commit(conn);
			// 성공적으로 업데이트 시 최신 데이터를 다시 조회해서 session 에 변경(반영)
			updateCt = cDao.selectCustomer(conn, ct.getUserId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateCt;
	}
	
	public int deleteCustomer(String userId) {
		
		Connection conn = getConnection();
		int result = cDao.deleteCustomer(conn, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public Reservation updateReservation(Reservation r) {
		Connection conn = getConnection();
		int result = cDao.updateReservation(conn, r);
		
		Reservation updateRes = null;
		
		if(result > 0) {
			commit(conn);
			updateRes = cDao.selectReservationCase(conn, r.getResNo());
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		return updateRes;
	}
	
	public int cancelReservation(int resNo) {
		Connection conn = getConnection();
		int result = cDao.cancelReservation(conn, resNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int deleteWishlist(int wishNo) {
		
		Connection conn = getConnection();
		int result = cDao.deleteWishlist(conn, wishNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public int countRes(int userNo) {
		Connection conn = getConnection();
		int resCount = cDao.countRes(conn, userNo);
		
		close(conn);
		return resCount;
		
	}
	
	public int countWish(int userNo) {
		Connection conn = getConnection();
		int wishCount = cDao.countWish(conn, userNo);

		close(conn);
		return wishCount;
		
	}
	
	public int countReview(int userNo) {
		Connection conn = getConnection();
		int reviewCount = cDao.countReview(conn, userNo);
	
		close(conn);
		return reviewCount;
		
	}
	
}
