package com.galgoda.common.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.galgoda.common.model.service.CoolSmsSender;

/**
 * Servlet implementation class SignUpAuthentiController
 */
@WebServlet("/authentiSms.co")
public class SignUpAuthentiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpAuthentiController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        HttpSession session = request.getSession(true);
        String verificationCode = CoolSmsSender.sendVerificationCode(phone, session);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        if (verificationCode != null) {
            jsonResponse.put("message", "인증번호가 전송되었습니다.");
            jsonResponse.put("verificationCode", verificationCode); // verificationCode를 JSON 응답에 포함
        } else {
            jsonResponse.put("message", "인증번호 전송에 실패했습니다.");
        }
        out.println(jsonResponse.toString());
        out.close();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	
        
}
