package com.galgoda.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.common.model.service.CommonService;
import com.galgoda.member.model.vo.Customer;

/**
 * Servlet implementation class SignUpConfirmController
 */
@WebServlet("/signupConfirm.co")
public class SignUpCustomerConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpCustomerConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String userName = request.getParameter("userName");
		String userEngName = request.getParameter("userEngName");
		String birthDate = request.getParameter("birthDate");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		String etc = request.getParameter("etc");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Customer ct = new Customer();
		ct.setUserName(userName);
		ct.setUserEngName(userEngName);
		ct.setBirthDate(birthDate);
		ct.setEmail(email);
		ct.setPhone(phone);
		ct.setPhone(phone);
		ct.setZipcode(zipcode);
		ct.setAddress(address);
		ct.setAddressDetail(addressDetail);
		ct.setEtc(etc);
		ct.setUserId(userId);
		ct.setUserPwd(userPwd);
		
		int result = new CommonService().insertCustomer(ct);
		
		if(result > 0) { // 성공했을 경우
			
			HttpSession session = request.getSession(); // session 객체 얻어오기
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다. 반갑습니다!");
			
			response.sendRedirect(request.getContextPath());
			
		}else { // 실패했을 경우
			
			request.setAttribute("alertMsg", "회원가입에 실패했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/signupCustomer.co");
			
			
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
