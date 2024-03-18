package com.galgoda.common.model.service;

import java.sql.Connection;

import com.galgoda.common.model.dao.CommonDao;
import static com.galgoda.common.template.JDBCTemplate.*;
import com.galgoda.member.model.vo.Admin;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;

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
	

}
