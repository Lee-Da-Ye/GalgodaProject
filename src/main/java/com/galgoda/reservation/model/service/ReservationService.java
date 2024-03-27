package com.galgoda.reservation.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.customer.model.vo.Review;
import com.galgoda.customer.model.vo.Wishlist;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Room;
import com.galgoda.reservation.model.dao.ReservationDao;

public class ReservationService {

	
	private ReservationDao rDao = new ReservationDao();

	public List<Hotel> searchHotelList(Reservation r, String searchType){
		Connection conn = getConnection();
		
		
		
		List<Hotel> list  = new ArrayList<>();
		if(searchType.equals("hotelName")) {
			
			list = rDao.searchHotelName(conn, r);
			
		} else if(searchType.equals("tagName")){
			
			list = rDao.searchTagName(conn, r);
		}

		
		close(conn);
		
		return list;
		
		
	}
	
	public int wishlList(int userNo, int wishHotelNo) {
		Connection conn = getConnection();
		int result = rDao.wishList(conn, userNo, wishHotelNo);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public List<Review> selectReviewList(int no) {
		Connection conn = getConnection();
		List<Review> list = rDao.selectReviewList(conn,no);
		close(conn);
		
		return list;
	}
	
	public String findRoomName(int roomNo) {
		Connection conn = getConnection();
		String roomName = rDao.findRoomName(conn, roomNo);
		close(conn);
		
		return roomName;
	}
	
	public int findRoomPrice(int roomNo) {
		Connection conn = getConnection();
		int roomPrice = rDao.findRoomPrice(conn, roomNo);
		close(conn);
		
		return roomPrice;
	}
	
	public String findHotelName(int hotelNo) {
		Connection conn = getConnection();
		String roomName = rDao.findHotelName(conn, hotelNo);
		close(conn);
		
		return roomName;
	}
	
	public int insertNewReservation(Reservation newRes) {
		Connection conn = getConnection();
		int result = rDao.insertNewReservation(conn, newRes);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int reduceRoomCount(int hotelNo, int roomCount) {
		Connection conn = getConnection();
		int result = rDao.reduceRoomCount(conn, hotelNo, roomCount);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	public List<Wishlist> selectwishList(int userNo){
		Connection conn = getConnection();
		List<Wishlist> list = rDao.selectwishList(conn, userNo);
		close(conn);
		
		return list;
	}

	public List<Attachment> selectRoomFileList(int no, List<Room> rm) {
		Connection conn = getConnection();
		List<Attachment> list = rDao.selectRoomFileList(conn, no, rm);
		close(conn);
		
		return list;
	}

	public List<Attachment> selectHotelFileList(int no) {
		Connection conn = getConnection();
		List<Attachment> list = rDao.selectHotelFileList(conn, no);
		close(conn);
		
		return list;
	}
	
	
}
