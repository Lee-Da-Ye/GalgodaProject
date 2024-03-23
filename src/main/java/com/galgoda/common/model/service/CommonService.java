package com.galgoda.common.model.service;

import static com.galgoda.common.template.JDBCTemplate.close;
import static com.galgoda.common.template.JDBCTemplate.commit;
import static com.galgoda.common.template.JDBCTemplate.getConnection;
import static com.galgoda.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.galgoda.common.model.dao.CommonDao;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Tag;
import com.galgoda.member.model.vo.Admin;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.supervisor.model.vo.Terms;

public class CommonService {
	
	public CommonDao cDao = new CommonDao();
	
	public Customer loginCustomer(String userId, String userPwd) {
        // Customer 객체 생성 및 반환하는 로직
		Connection conn = getConnection();
		Customer customer = cDao.loginCustomer(conn, userId, userPwd);
		
		close(conn);
		return customer;
    }

    public HotelUser loginHotel(String userId, String userPwd) {
        // Hotel 객체 생성 및 반환하는 로직
    	Connection conn = getConnection();
    	HotelUser hotel = cDao.loginHotel(conn, userId, userPwd);
		
		close(conn);
		return hotel;
    }

    public Admin loginAdmin(String userId, String userPwd) {
        // Admin 객체 생성 및 반환하는 로직    	
    	Connection conn = getConnection();
		Admin admin = cDao.loginAdmin(conn, userId, userPwd);
		
		close(conn);
		return admin;
    }
	
    public int insertCustomer(Customer ct) {
    	
    	Connection conn = getConnection();
    	int result = cDao.insertCustomer(conn, ct);
    	
    	if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
    }
    
    public boolean isEmailDuplicate(String email) {
    	
    	Connection conn = getConnection();
    	int result = cDao.isEmailDuplicate(conn, email);
    	
    	if (result > 0) {
            // 이메일이 이미 존재하는 경우
    		rollback(conn);
    		close(conn);
            return true;
        } else {
            // 이메일이 존재하지 않는 경우
        	commit(conn);
        	close(conn);
            return false;
        }
    	
    	
    }
    
    public boolean isUserIdDuplicate(String userId) {
    	
    	Connection conn = getConnection();
    	int result = cDao.isUserIdDuplicate(conn, userId);
    	
    	if (result > 0) {
            // 아이디가 이미 존재하는 경우
    		rollback(conn);
    		close(conn);
            return true;
        } else {
            // 아이디가 존재하지 않는 경우
        	commit(conn);
        	close(conn);
            return false;
        }
    	
    	
    }
    
    public boolean isCodeAccord(String hotelName, String verificationCode) {
    	
    	Connection conn = getConnection();
    	int result = cDao.isCodeAccord(conn, hotelName, verificationCode);
    	
    	if(result > 0) {
    		// 일치하는 계정이 존재하는 경우
    		commit(conn);
    		close(conn);
    		return true;
    	} else {
    		rollback(conn);
    		close(conn);
    		return false;
    	}
    	
    	
    }
    
    public int updateHotelUser(HotelUser hu) {
    	
    	Connection conn = getConnection();
    	int result = cDao.updateHotelUser(conn, hu);
    	
    	if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
    	
    }
    
    public String findUserId(String userName, String phone) {
    	
    	Connection conn = getConnection();
    	String userId = cDao.findUserId(conn, userName, phone);
    	
		close(conn);
		
		return userId;
    	
    }
    
    public Customer resetCustomerPwd(String userId, String newPassword) {
    	Connection conn = getConnection();
    	int result = cDao.resetCustomerPwd(conn, userId, newPassword);
    	
    	Customer customer = null;
    	
    	if(result>0) {
			commit(conn);
			customer = new CommonService().loginCustomer(userId, newPassword);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return customer;
    }
    
    public HotelUser resetHotelUserPwd(String userId, String newPassword) {
    	Connection conn = getConnection();
    	int result = cDao.resetHotelUserPwd(conn, userId, newPassword);
    	
    	HotelUser hoteluser = null;
    
    	if(result>0) {
			commit(conn);
			hoteluser = new CommonService().loginHotel(userId, newPassword);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return hoteluser;
    }
    
    public Admin resetAdminPwd(String userId, String newPassword) {
    	Connection conn = getConnection();
    	int result = cDao.resetAdminPwd(conn, userId, newPassword);
    	
    	Admin admin = null;
    
    	if(result>0) {
			commit(conn);
			admin = new CommonService().loginAdmin(userId, newPassword);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return admin;
    }
    
    public int confirmCustomer(String userId, String phone) {
    	
    	Connection conn = getConnection();
    	int result = cDao.confirmCustomer(conn, userId, phone);
    	
    	close(conn);
    	
    	return result;
    }
    
    public int confirmHotel(String userId, String phone) {
    	
    	Connection conn = getConnection();
    	int result = cDao.confirmHotel(conn, userId, phone);
    	
    	close(conn);
    	
    	return result;
    }
    
    public int confirmAdmin(String userId, String phone) {
    	
    	Connection conn = getConnection();
    	int result = cDao.confirmAdmin(conn, userId, phone);
    	
    	close(conn);
    	
    	return result;
    }
    
    public List<Hotel> selectPopularHotelList(){
    	
    	Connection conn = getConnection();
    	List<Hotel> popularHotelList = cDao.selectPopularHotelList(conn);
    	
    	close(conn);
    	
    	return popularHotelList;
    	
    }

	public List<Terms> selectTermsList() {
		Connection conn = getConnection();
		List<Terms> list = cDao.selectTermsList(conn);
		close(conn);
		
		return list;
	}
	
	public List<Tag> selectTagList(){
		Connection conn = getConnection();
		List<Tag> list = cDao.selectTagList(conn);
		
		close(conn);
		return list;
	}
}
