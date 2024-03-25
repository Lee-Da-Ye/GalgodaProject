package com.galgoda.supervisor.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.common.template.MyFileRenamePolicy;
import com.galgoda.member.model.vo.Admin;
import com.galgoda.supervisor.model.service.SupervisorService;
import com.galgoda.supervisor.model.vo.Terms;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SupervisorInsertTermController
 */
@WebServlet("/insertTerm.su")
public class SupervisorInsertTermController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorInsertTermController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 파일전송이 잘됬으면 
			int maxSize = 10 * 1024 * 1024;
			//파일최대크기 10메가 
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath , maxSize,"UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String notes = multiRequest.getParameter("notes");
			
			HttpSession session = request.getSession();
			//int adminNo = ((Admin)session.getAttribute("loginAdmin")).getAdminNo();
			int adminNo = Integer.parseInt(multiRequest.getParameter("adminNo"));
			
			Terms t = new Terms();
			t.setAdminNo(String.valueOf(adminNo));
			t.setTermsTitle(title);
			t.setTermsContent(content);
			t.setNotes(notes);
			
			Attachment at = null;
			//파일이 있으면 
			if(multiRequest.getOriginalFileName("upfile")!=null	) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setFileName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
			}
			
			int result = new SupervisorService().insertTerm(t,at);
			
			if(result>0) { 
				session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/termsList.su");
			}else {  
				if(at != null) { 
					new File(savePath + at.getFileName()).delete();
				} 
				session.setAttribute("alertMsg", "이용약관 등록에 실패하였습니다.");
				response.sendRedirect(request.getContextPath() + "/termsList.su");
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
