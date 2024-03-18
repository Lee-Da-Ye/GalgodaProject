package com.galgoda.supervisor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.member.model.vo.Customer;
import com.galgoda.supervisor.model.service.SupervisorService;

/**
 * Servlet implementation class SupervisorUpdateUserController
 */
@WebServlet("/updateUser.su")
public class SupervisorUpdateUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorUpdateUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String phone = request.getParameter("phone1") + "-" 
						+ request.getParameter("phone2") + "-" 
						+ request.getParameter("phone3");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		
		Customer user = new Customer();
		user.setUserNo(userNo);
		user.setUserName(userName);
		user.setUserId(userId);
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setAddressDetail(addressDetail);
		
		Customer updateUser = new SupervisorService().updateUser(user);
		HttpSession session = request.getSession();
		if(updateUser==null) {
			session.setAttribute("alertMsg", "회원정보 수정에 실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/userList.su");
		}else {
			
			session.setAttribute("alertMsg", "성공적으로 회원정보 변경되었습니다.");
			response.sendRedirect(request.getContextPath()+"/detailUser.su?no=" + updateUser.getUserNo());
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
