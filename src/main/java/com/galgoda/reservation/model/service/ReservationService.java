package com.galgoda.reservation.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.customer.model.vo.Review;
import com.galgoda.hotel.model.vo.Hotel;
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
	
}
