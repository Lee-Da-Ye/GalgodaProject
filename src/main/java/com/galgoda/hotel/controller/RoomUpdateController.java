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
import com.galgoda.hotel.model.service.HotelService;
import com.galgoda.hotel.model.vo.Room;
import com.galgoda.member.model.vo.HotelUser;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RoomUpdateController
 */
@WebServlet("/roomUpdate.ho")
public class RoomUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdateController() {
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
			
			int roomNo = Integer.parseInt(multiRequest.getParameter("no"));
			String roomName = multiRequest.getParameter("roomName");
			String roomSize = multiRequest.getParameter("roomSize");
			int roPeople = Integer.parseInt(multiRequest.getParameter("roPeople"));
			int roBath = Integer.parseInt(multiRequest.getParameter("roBath"));
			int roPrice = Integer.parseInt(multiRequest.getParameter("roPrice"));
			int roCount = Integer.parseInt(multiRequest.getParameter("roCount"));
			
			
			
			String[] roomOptions = multiRequest.getParameterValues("roomOption"); 
			String roomOption = null;
			if(roomOptions != null) {
				roomOption = String.join(", ", roomOptions);
			}
			
			String roomImgPath = "resources/upfiles/" + multiRequest.getFilesystemName("roomImgPath");
		
		
			Room r = new Room();
			r.setRoomNo(roomNo);
			r.setRoomName(roomName);
			r.setRoomSize(roomSize);
			r.setRoPeople(roPeople);
			r.setRoBath(roBath);
			r.setRoPrice(roPrice);
			r.setRoCount(roCount);
			r.setOpNo(roomOption);
			r.setImgPath(roomImgPath);
			
			
			List<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				String key = "upload_file" + i;
				
					if(multiRequest.getOriginalFileName(key) != null) {
					
					// 첨부파일이 존재할 경우
					// Attachment생성 + 원본명,수정명,경로,파일레벨 담아서 => list에 추가
					Attachment at = new Attachment();
					at.setFilePath("resources/upfiles/" + multiRequest.getFilesystemName("upload_file" + i));
					at.setFileName(multiRequest.getFilesystemName(key));
					
					list.add(at);
					
				}
				
			}
			int result =  new HotelService().updateRoom(r, list);
			
			if(result > 0) {
				// 성공 => 
				request.getSession().setAttribute("alertMsg", "객실이 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/roomUpdateForm.ho");
				
				
			}
		
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
