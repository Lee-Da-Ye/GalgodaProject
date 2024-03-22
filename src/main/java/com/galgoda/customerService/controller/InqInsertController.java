package com.galgoda.customerService.controller;

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
import com.galgoda.customerService.model.service.InqService;
import com.galgoda.customerService.model.vo.Inq;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InqInsertController
 */
@WebServlet("/insert.inq")
public class InqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InqInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			Inq inq = new Inq();
			inq.setInqWriter(multiRequest.getParameter("userName"));
			inq.setWriterPhone(multiRequest.getParameter("phone"));
			inq.setWriterEmail(multiRequest.getParameter("email"));
			inq.setCategory(multiRequest.getParameter("category"));
			inq.setInqType(multiRequest.getParameter("type"));
			inq.setInqTitle(multiRequest.getParameter("title"));
			inq.setInqContent(multiRequest.getParameter("content"));

			List<Attachment> list = new ArrayList<>();

			for(int i=1; i<4; i++) {
				String key = "upload" + i;

				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setFilePath("resources/upfiles/" + multiRequest.getFilesystemName(key));
					at.setFileName(multiRequest.getFilesystemName(key));

					list.add(at);
				}
			}
			int result = new InqService().insertInq(inq, list);

			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "문의가 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.inq?page=1");
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
