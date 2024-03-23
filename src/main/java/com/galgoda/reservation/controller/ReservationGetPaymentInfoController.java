package com.galgoda.reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.galgoda.customer.model.service.CustomerService;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.member.model.vo.Customer;

/**
 * Servlet implementation class ReservationGetPaymentInfoController
 */
@WebServlet("/getPaymentInfo.res")
public class ReservationGetPaymentInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationGetPaymentInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int resNo = Integer.parseInt(request.getParameter("resNo"));
				
		// 세션에서 로그인된 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    
	    // 로그인된 사용자의 userNo 가져오기
	    int userNo = loginCustomer.getUserNo();
	    
	    List<Reservation> reservations = new CustomerService().selectReservation(userNo);
	
		
		// 선택한 개별 예약 번호에 대해서만 예약정보를 조회
				Reservation selectedReservation = null;
			    for (Reservation r : reservations) {
			        if (r.getResNo() == resNo) {
			            selectedReservation = r;
			            break;
			        }
			    }
			    
		// JSON 형식으로 응답
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    PrintWriter out = response.getWriter();
	    JSONObject jsonResponse = new JSONObject();
	    
	    if (selectedReservation != null) {
	        // selectedReservation에서 필요한 결제 정보를 가져와서 JSON 응답에 포함
	    	jsonResponse.put("hotelName", selectedReservation.getHotelName());
	        jsonResponse.put("amount", selectedReservation.getPay());
	        jsonResponse.put("buyerEmail", selectedReservation.getResEmail());
	        jsonResponse.put("buyerName", selectedReservation.getResName());
	        jsonResponse.put("buyerTel", selectedReservation.getResPhone());
	    } else {
	        // selectedReservation이 null인 경우
	        jsonResponse.put("error", "선택한 예약 건에 대한 결제 정보를 찾을 수 없습니다.");
	    }
	    out.println(jsonResponse.toString());
	    out.close();
	    
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
