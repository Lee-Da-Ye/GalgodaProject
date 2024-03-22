package com.galgoda.customer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.customer.model.service.CustomerService;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.member.model.vo.Customer;

/**
 * Servlet implementation class CustomerResUpdateController
 */
@WebServlet("/resUpdate.cu")
public class CustomerResUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerResUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		String checkInDate = request.getParameter("checkInDate");
		String checkOutDate = request.getParameter("checkOutDate");
		int resPeople = Integer.parseInt(request.getParameter("resPeople"));
		int roomType = Integer.parseInt(request.getParameter("roomType"));
		
		String[] optionArr = request.getParameterValues("option");
		String option = (optionArr != null) ? String.join(", ", optionArr) : "";
		
		
		String resName = request.getParameter("resName");
		String resPhone = request.getParameter("resPhone");
		String resEmail = request.getParameter("resEmail");
		int resPay = Integer.parseInt(request.getParameter("resPay"));
		String resPayMethod = request.getParameter("resPayMethod");
		
		
		// 세션에서 로그인된 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    
	    // 로그인된 사용자의 userNo 가져오기
	    int userNo = loginCustomer.getUserNo();
		
		
		Reservation res = new Reservation();
		res.setResNo(resNo);
		res.setDateIn(checkInDate);
		res.setDateOut(checkOutDate);
		res.setResPeople(resPeople);
		res.setRoNo(roomType);
		res.setOpName(option);
		res.setResName(resName);
		res.setResPhone(resPhone);
		res.setResEmail(resEmail);
		res.setPay(resPay);
		res.setPayMethod(resPayMethod);
		
		Reservation updateRes = new CustomerService().updateReservation(res);
		List<Reservation> reservations = new CustomerService().selectReservation(userNo);
	
		
		// 선택한 개별 예약 번호에 대해서만 예약정보를 조회
				Reservation selectedReservation = null;
			    for (Reservation r : reservations) {
			        if (r.getResNo() == resNo) {
			            selectedReservation = r;
			            break;
			        }
			    }
			    
			    
		if(updateRes == null) { // 실패일 경우
			
			// 에러페이지 / 에러문구
			session.setAttribute("alertMsg", "예약정보 변경에 실패했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/resManagement.cu");
			
		}else { // 성공일 경우
			
			// 마이페이지 / 알람문구("성공적으로 회원정보 변경되었습니다.")
			
			session.setAttribute("alertMsg", "예약정보 변경이 완료되었습니다.");
			request.setAttribute("selectedReservation", selectedReservation); // 동일한 키값으로 다시 담게 되면 덮어씌워짐
			request.setAttribute("reservations", reservations); // 동일한 키값으로 다시 담게 되면 덮어씌워짐
			
			response.sendRedirect(request.getContextPath() + "/resManagement.cu");
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
