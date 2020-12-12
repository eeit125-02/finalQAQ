package com.web.book.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	
//	public void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		System.out.println(123);
//		String MB_Account;
//		String MB_Password;
//		String MB_Sex;
//		Date MB_Birthday;
//		String MB_Name;
//		String MB_Mail;
//		String MB_Tel;
//		String MB_Address;
//		String MB_type;
//		String type="";
//		String vs[]=null;	
//		Blob pic;
//		Timestamp ts = new Timestamp(System.currentTimeMillis());
//		MB_Account = request.getParameter("account").trim();
//		System.out.println(MB_Account);
//		MB_Password = request.getParameter("pwd").trim();
//		MB_Sex = request.getParameter("sex").trim();
//		MB_Birthday = Date.valueOf(request.getParameter("date").trim());
//		MB_Name = request.getParameter("name").trim();
//		MB_Mail = request.getParameter("mail").trim();
//		MB_Tel = request.getParameter("tel").trim();
//		MB_Address = request.getParameter("address").trim();
//		vs=request.getParameterValues("type");
//		for(int i=0;i<vs.length;i++) {type+=vs[i]+",";}		
//		MB_type =type;
//		MemberBean reg_member = new MemberBean(0, MB_Account, MB_Password, MB_Sex, MB_Birthday, MB_Name, MB_Mail, MB_Tel, MB_Address,ts, 0, MB_type,null);
//		System.out.println(reg_member);
//		request.getSession(true).setAttribute("reg_member", reg_member);
//		request.getRequestDispatcher("/confirm.jsp").forward(request, response);
//	}
//
//	public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		System.out.println("================");
//		try {
//			MemberServiceImpl ms = new MemberServiceImpl();
//			MemberBean memberData = (MemberBean) request.getSession(true).getAttribute("reg_member");
//			if (ms.insertMember(memberData)) {
//				request.getRequestDispatcher("/Thanks.jsp").forward(request, response);
//			}else request.getRequestDispatcher("/login.jsp").forward(request, response);
//		} catch (Exception e) {
//			System.out.println("寫入資料時發生異常,訊息");
//		}
//
//	}
}