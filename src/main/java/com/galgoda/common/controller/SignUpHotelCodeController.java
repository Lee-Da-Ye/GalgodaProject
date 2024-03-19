package com.galgoda.common.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.galgoda.common.model.service.CommonService;

/**
 * Servlet implementation class SignUpHotelCodeController
 */
@WebServlet("/hotelCodeCheck.co")
public class SignUpHotelCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpHotelCodeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 클라이언트로부터 받은 코드 파라미터 가져오기
        String verificationCode = request.getParameter("verificationCode");
        String hotelName = request.getParameter("hotelName");

        // 코드 일치 여부 확인 서비스 호출
        boolean isCodeAccord = new CommonService().isCodeAccord(hotelName, verificationCode);

        // JSON 형식으로 결과 전달
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("isCodeAccord", isCodeAccord);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
