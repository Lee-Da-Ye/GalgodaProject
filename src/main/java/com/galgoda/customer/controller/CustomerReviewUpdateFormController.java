package com.galgoda.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customer.model.service.CustomerService;
import com.galgoda.customer.model.vo.CustomerReview;
import com.galgoda.customer.model.vo.Reservation;

/**
 * Servlet implementation class CustomerReviewUpdateController
 */
@WebServlet("/reviewUpdateForm.cu")
public class CustomerReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int revNo = Integer.parseInt(request.getParameter("no"));
		/*
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		int hotelNo = Integer.parseInt(request.getParameter("hotelNo"));
		String revTitle = request.getParameter("revTitle");
		String revContent = request.getParameter("revContent");
		int revRating = Integer.parseInt(request.getParameter("revRating"));
		String date_in = request.getParameter("date_in");
		String date_out = request.getParameter("date_out");
		int res_people = Integer.parseInt(request.getParameter("res_people"));
		*/
		
		CustomerReview r = new CustomerService().selectRev(revNo);
		
		//Reservation r = new CustomerService().selectReservationCase(resNo);
		
		/*
		r.setRevNo(revNo);
		r.setRevTitle(revTitle);
		r.setRevContent(revContent);
		
		//
		request.setAttribute("hotelNo", hotelNo);
		request.setAttribute("resNo", resNo);
		request.setAttribute("r", r);
		request.setAttribute("date_in", date_in);
		request.setAttribute("date_out", date_out);
		request.setAttribute("res_people", res_people);
		request.setAttribute("revNo", revNo);
		request.setAttribute("revTitle", revTitle);
		request.setAttribute("revContent", revContent);
		request.setAttribute("revRating", revRating);*/
		//
	
		request.setAttribute("r", r);
		request.getRequestDispatcher("views/customer/reviewUpdateForm.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
