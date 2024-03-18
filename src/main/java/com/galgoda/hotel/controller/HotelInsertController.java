package com.galgoda.hotel.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.template.MyFileRenamePolicy;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.member.model.vo.HotelUser;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class HotelInsertController
 */
@WebServlet("/hotelinsert.ho")
public class HotelInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			String hotelName = multiRequest.getParameter("hotelName");
			String hotelAddress = multiRequest.getParameter("addr2");
			
			String hotelDetailAdd = "";
			if( multiRequest.getParameter("hotelDetailAdd") != null) {
				hotelDetailAdd = multiRequest.getParameter("hotelDetailAdd");
			}
			
			String hotelTel = multiRequest.getParameter("hotelTel");
			
			
			String hotelSite = "";
			if(	multiRequest.getParameter("hotelSite") != null) {
				hotelSite = multiRequest.getParameter("hotelSite");
			}
					
			int hotelCheckin = Integer.parseInt(multiRequest.getParameter("hotelCheckin"));
			int hotelCheckout = Integer.parseInt(multiRequest.getParameter("hotelCheckout"));
			
			String[] hotelDetails = multiRequest.getParameterValues("hotelDetail"); 
			String hotelDetail = null;
			if(hotelDetails != null) {
				hotelDetail = String.join(", ", hotelDetails);
			}
			
			String[] hotelTags = multiRequest.getParameterValues("hotelTag"); 
			String hotelTag = null;
			if(hotelTags != null) {
				hotelTag = String.join(", ", hotelTags);
			}
			
			String hotelIntro = null;
			if(		multiRequest.getParameter("hotelIntro") != null) {
				hotelIntro = multiRequest.getParameter("hotelIntro");
			}
			
			String refundpolicy = null;
			if(		multiRequest.getParameter("refundpolicy") != null) {
				refundpolicy = multiRequest.getParameter("refundpolicy");
			}
		
			String hotelImgPath = "resources/upfiles/" + multiRequest.getFilesystemName("hotelImgPath");
		
		
			Hotel h = new Hotel();
			h.setHotelName(hotelName);
			h.setHotelAddress(hotelAddress);
			h.setHotelDetailAdd(hotelDetailAdd);
			h.setHotelTel(hotelTel);
			h.setHotelSite(hotelSite);
			h.setHotelCheckin(hotelCheckin);
			h.setHotelCheckout(hotelCheckout);
			h.setHotelDetail(hotelDetail);
			h.setTagNo(hotelTag);
			h.setHotelIntro(hotelIntro);
			h.setRefundpolicy(refundpolicy);
			h.setImgPath(hotelImgPath);
			int memNo = ((HotelUser)(request.getSession().getAttribute("loginHotel"))).getMemNo();
			h.setMemNo(memNo);
			
			
			
			List<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				String key = "upload_file" + i;
				
					if(multiRequest.getOriginalFileName(key) != null) {
					
					// 첨부파일이 존재할 경우
					// Attachment생성 + 원본명,수정명,경로,파일레벨 담아서 => list에 추가
					Attachment at = new Attachment();
					at.setFilePath("resources/upfiles/" + multiRequest.getFilesystemName("upload_file" + i));
				
					
					list.add(at);
					
				}
				
			}
			
			int result =  new HotelService().insertHotel(h, list);
			
		
		
		
		
		
		
		
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
