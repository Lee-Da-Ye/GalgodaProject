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
import com.galgoda.customer.model.vo.Wishlist;
import com.galgoda.member.model.vo.Customer;

/**
 * Servlet implementation class CustomerWishlistController
 */
@WebServlet("/wishlist.cu")
public class CustomerWishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerWishlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		    
	    // 로그인된 사용자의 userNo 가져오기
	    int userNo = loginCustomer.getUserNo();
		
		List<Wishlist> wishlist = new CustomerService().selectWishlist(userNo);
		request.setAttribute("wishlist", wishlist); 
		
		request.getRequestDispatcher("/views/customer/wishlist.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
