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
 * Servlet implementation class CustomerUpdatePersonalInfoController
 */
@WebServlet("/updatePersonalInfoConfirm.cu")
public class CustomerUpdatePersonalInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerUpdatePersonalInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String updatedPwd = request.getParameter("updatedPwd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		String etc = request.getParameter("etc");
		
		Customer ct = new Customer();
		ct.setUserId(userId);
		ct.setUserName(userName);
		ct.setUserPwd(updatedPwd);
		ct.setPhone(phone);
		ct.setEmail(email);
		ct.setZipcode(zipcode);
		ct.setAddress(address);
		ct.setAddressDetail(addressDetail);
		ct.setEtc(etc);
		
		Customer updateCt = new CustomerService().updatePersonalInfo(ct);
		
		if(updateCt == null) { // 실패일 경우
			
			// 에러페이지 / 에러문구
			request.setAttribute("alertMsg", "회원정보 수정에 실패했습니다");
			request.getRequestDispatcher("/views/cutomer/updatePersonalInfoForm.jsp").forward(request, response);
			
			
		}else { // 성공일 경우
			
			// 마이페이지 / 알람문구("성공적으로 회원정보 변경되었습니다.")
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원정보 변경되었습니다.");
			session.setAttribute("loginCustomer", updateCt); // 동일한 키값으로 다시 담게 되면 덮어씌워짐
			
			// 마이페이지로 포워딩
			response.sendRedirect(request.getContextPath() + "/mypage.cu");
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
