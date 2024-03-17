package com.galgoda.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.customer.model.service.CustomerService;
import com.galgoda.member.model.vo.Customer;

/**
 * Servlet implementation class CustomerResignController
 */
@WebServlet("/resignConfirm.cu")
public class CustomerResignController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerResignController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    
	    // 로그인된 사용자의 userId 가져오기
	    String userId = loginCustomer.getUserId();
	    
	    int result = new CustomerService().deleteCustomer(userId);
	    
	    if(result > 0) { // 성공
			
			// session에 담긴 회원객체(loginUser)를 지워야함
			session.removeAttribute("loginCustomer");
			// 응답페이지 : 메인페이지 
			// 응답데이터 : 알람문구 ("성공적으로 회원탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.")
			session.setAttribute("alertMsg", "성공적으로 회원탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
			response.sendRedirect(request.getContextPath());
			
		} else { // 실패
		
			// 응답페이지 : 마이페이지
			// 응답데이터 : 알람문구 ("회원탈퇴 실패")
			session.setAttribute("alertMsg", "회원탈퇴에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/resgin.cu");
		
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
