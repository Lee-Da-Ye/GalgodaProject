package com.galgoda.hotel.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.customer.model.vo.Review;
import com.galgoda.hotel.model.dao.HotelDao;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Option;
import com.galgoda.hotel.model.vo.Report;
import com.galgoda.hotel.model.vo.Room;
import com.galgoda.hotel.model.vo.Tag;
import com.galgoda.member.model.vo.HotelUser;

public class HotelService {

	
	private HotelDao hDao = new HotelDao();
	
	
	public List<Tag> hotelInsertForm(){
		Connection conn = getConnection();
		
		List<Tag> list = hDao.hotelInsertForm(conn);
		close(conn);
		
		return list;
	
	}
	
	public Hotel  selectHotelNo(String hotelName) {
		Connection conn = getConnection();
		
		Hotel h = hDao.selectHotelNo(conn, hotelName);
		close(conn);
		
		return h;
	}
	
	public List<Option> roomInsertForm(){
		Connection conn = getConnection();
		
		List<Option> list = hDao.roomInsertForm(conn);
		close(conn);
		
		return list;
	}
	
	public int insertHotel(Hotel h, List<Attachment> list) {
		Connection conn = getConnection();
		
		
		int result2 = 1;
		
		int result1 = hDao.insertHotel(conn, h);
		
		if(!list.isEmpty()) {
		 result2 = hDao.insertHoAttachment(conn, list);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	
	public int insertRoom(Room r, List<Attachment> list) {
		Connection conn = getConnection();
		
		
		int result2 = 1;
		
		int result1 = hDao.insertRoom(conn, r);
		
		if(!list.isEmpty()) {
		 result2 = hDao.insertRoAttachment(conn, list);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = hDao.selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public int selectRevListCount(String hotelName) {
		Connection conn = getConnection();
		
		int listCount = hDao.selectRevListCount(conn, hotelName);
		
		close(conn);
		
		return listCount;
	}
	

	
	public List<Reservation> selectList(PageInfo pi ,String hotelName) {
		Connection conn = getConnection();
		
		List<Reservation> list = hDao.selectList(conn, pi, hotelName);
		close(conn);
		
		return list;
	}
	
	
	public List<Review> selectRevList(PageInfo pi, String hotelName) {
		Connection conn = getConnection();
		
		List<Review> list = hDao.selectRevList(conn, pi, hotelName);
		close(conn);
		
		return list;
	}
	

	public Reservation selectReservation(int resNo) {
		Connection conn = getConnection();
		
		Reservation r = hDao.selectReservation(conn, resNo);
		close(conn);
		
		return r;
	}

	
	public Review selectReview(int revNo) {
		Connection conn = getConnection();
		
		Review r = hDao.selectReview(conn, revNo);
		close(conn);
		
		return r;
	}


	public HotelUser selectHotelUser(String userId) {
		Connection conn = getConnection();
		HotelUser hu = hDao.selectHotelUser(conn, userId);
		
		close(conn);
		
		return hu;
	}
	
	public HotelUser updatePersonalInfo(HotelUser hu) {
		Connection conn = getConnection();
		int result = hDao.updatePersonalInfo(conn, hu);
		
		HotelUser updatehu = null;
		
		if(result > 0) { // 업데이트 성공
			commit(conn);
			// 성공적으로 업데이트 시 최신 데이터를 다시 조회해서 session 에 변경(반영)
			updatehu = hDao.selectHotelUser(conn, hu.getMemId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updatehu;

	}
	
	
	public int reportUser(Report r) {
		Connection conn = getConnection();
		int result = hDao.reportUser(conn, r);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	public int confirmReservation(int resNo) {
		Connection conn = getConnection();
		int result = hDao.confirmReservation(conn, resNo);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public int cancelReservation(int resNo) {
		Connection conn = getConnection();
		int result = hDao.cancelReservation(conn, resNo);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}

	public Hotel selectHotelForm(int memNo) {
		Connection conn = getConnection();
		
		Hotel h = hDao.selectHotelForm(conn, memNo);
		close(conn);
		
		return h;

	}
	
	public List<Room> selectRoomList(String hotelName) {
		Connection conn = getConnection();
		
		List<Room> list = hDao.selectRoomList(conn, hotelName);
		close(conn);
		
		return list;

	}

	public int deleteHotelUser(String userId) {
		Connection conn = getConnection();
		int result = hDao.deleteHotelUser(conn, userId);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int updateHotel(Hotel h, List<Attachment> list) {
		Connection conn = getConnection();
		int result1 =  hDao.updateHotel(conn, h );
				
		int result2 = 1;		

		List<Attachment> list2 = hDao.selectFileNoList(conn, h.getHotelName());
		if(!list.isEmpty()) {
			if(list2.isEmpty()) {
				result2 = hDao.updateHoAttachment(conn, list, h.getHotelNo());
			}else {
				result2 = hDao.ReupdateHoAttachment(conn, list, list2);
			}
		}	
				
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	
	}
	public List<Attachment> selectFileList(int refNo, String type){
		Connection conn = getConnection();
		List<Attachment> list = hDao.selectFileList(conn, refNo, type);
		
		
		close(conn);
		return list;
		
	}
	
	public int reportReview(Report r){
		Connection conn = getConnection();
		int result = hDao.reportReview(conn, r);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteRoom(int roomNo) {
		Connection conn = getConnection();
		int result = hDao.deleteRoom(conn, roomNo);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteAttachment(int roomNo,String type) {
		Connection conn = getConnection();
		int result = hDao.deleteAttachment(conn, roomNo, type);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int countRoom(int hotelNo) {
		Connection conn = getConnection();
		int resCount = hDao.countRoom(conn, hotelNo);
		
		close(conn);
		return resCount;
		
	}
	
	public int countRes(int hotelNo) {
		Connection conn = getConnection();
		int resCount = hDao.countRes(conn, hotelNo);
		
		close(conn);
		return resCount;
		
	}
	
	public int countReview(int hotelNo) {
		Connection conn = getConnection();
		int resCount = hDao.countReview(conn, hotelNo);
		
		close(conn);
		return resCount;
		
	}
	
	public int updateRoom(Room r, List<Attachment> list) {
		Connection conn = getConnection();
		int result1 = hDao.updateRoom(conn, r);
		
		int result2 = 1;
		
		if(!list.isEmpty()) {
			result2 = hDao.updateRoAttachment(conn, list, r.getRoomNo());
		}
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}
	
	public int selectHotelResCount(String hotelName) {
		Connection conn = getConnection();
		int count = hDao.selectHotelResCount(conn, hotelName);
		
		close(conn);
		return count;
	}
	
	public int selectHotelResCategoryCount(String hotelName, String category) {
		Connection conn = getConnection();
		int count = hDao.selectHotelResCategoryCount(conn, hotelName, category);
		
		close(conn);
		return count;
	}
	
	public List<Reservation> selectCategoryList(PageInfo pi, String hotelName, String category){
		Connection conn = getConnection();
		List<Reservation> list = hDao.selectCategoryList(conn, pi, hotelName, category);
		
		close(conn);
		return list;
	}
	
	public int selectRevSearchListCount(String hotelName, String keyword) {
		Connection conn = getConnection();
		
		int listCount = hDao.selectRevSearchListCount(conn, hotelName, keyword);
		
		close(conn);
		
		return listCount;
	}

	public List<Review> selectRevSearchList(PageInfo pi, String hotelName, String keyword) {
		Connection conn = getConnection();
		
		List<Review> list = hDao.selectRevSearchList(conn, pi, hotelName, keyword);
		close(conn);
		
		return list;
	}
	
	public Hotel searchMemHotelName(int memNo) {
		Connection conn = getConnection();
		
		Hotel h = hDao.searchMemHotelName(conn, memNo);
		close(conn);
		
		return h;
	}
	
	
	
}
