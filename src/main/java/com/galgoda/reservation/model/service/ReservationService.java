package com.galgoda.reservation.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.reservation.model.dao.ReservationDao;

public class ReservationService {

	
	private ReservationDao rDao = new ReservationDao();

	public List<Hotel> searchHotelList(Reservation r, String searchType){
		Connection conn = getConnection();
		
		System.out.println(r);
		
		List<Hotel> list  = new ArrayList<>();
		if(searchType.equals("hotelName")) {
			
			list = rDao.searchHotelName(conn, r);
			
		} else if(searchType.equals("tagName")){
			
			list = rDao.searchTagName(conn, r);
		}

		
		close(conn);
		
		System.out.println(list);
		return list;
		
		
	
	}
	
}
