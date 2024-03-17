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
 * Servlet implementation class CustomerPersonalInfoFormController
 */
@WebServlet("/updatePersonalInfo.cu")
public class CustomerPersonalInfoFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerPersonalInfoFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//고객의 개인정보 수정만을 담당 (호텔 담당자 정보 수정은 다른 페이지에서)
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    
	    // 로그인된 사용자의 userId 가져오기
	    String userId = loginCustomer.getUserId();
	    String userPwd = request.getParameter("userPwd");
	    
	    Customer ct = new CustomerService().selectCustomer(userId);
	    
	    if(ct != null && ct.getUserPwd().equals(userPwd)) { // 사용자가 입력한 비밀번호가 일치
	    	request.setAttribute("ct", ct);
	    	request.getRequestDispatcher("/views/customer/updatePersonalInfoForm.jsp").forward(request, response);
	    } else {
	    	session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
	    	response.sendRedirect(request.getContextPath() + "/personalInfo.cu");
            
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
