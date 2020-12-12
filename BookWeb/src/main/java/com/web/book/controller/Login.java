package com.web.book.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;

import java.sql.*;
import java.util.List;
import javax.naming.*;
import javax.sql.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.book.model.MemberBean;
import com.web.book.service.MemberService;
import com.web.book.service.impl.MemberServiceImpl;

@Controller
public class Login {
	
	@Autowired
	MemberService ms;
	// 會員登入
	@PostMapping("/login")
	public String gotoSubmitProcess(HttpServletRequest request,Model model){
		String account = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		boolean mb = ms.Login(account, pwd);
		if (mb) {
			MemberBean select = ms.select(account);
			model.addAttribute("login",select);
			return "Member/city";
		} else {
			return "Member/login";
		}
	}
//	// 會員資料
//	public String gotoMbselectProcess(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		MemberBean mb_inf = (MemberBean) request.getSession(true).getAttribute("Login");
//		String account = mb_inf.getmB_Account();
//		IMemberService ms = new MemberServiceImpl();
//		MemberBean select = ms.select(account);
//		request.getSession(true).setAttribute("Member", select);
//		request.getRequestDispatcher("/mb_inf.jsp").forward(request, response);
//	}
//
//	// 會員修改
//	public void gotoUpdate(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		String password;
//		MemberBean Member = (MemberBean) request.getSession(true).getAttribute("Member");
//
//		password = request.getParameter("pwd");
//		Member.setmB_Password(password);
//
////		request.getSession(true).setAttribute("Member", password);
//		System.out.println("MemberPsd:" + Member.getmB_Password());
//
//		IMemberService ms = new MemberServiceImpl();
//		boolean update = ms.update(Member);
//		if (update) {
//			request.getRequestDispatcher("/city.jsp").forward(request, response);
////			response.sendRedirect("city.jsp");
//		}
//
//	}
//
//	// 管理員(會員資料)
//	public void gotoSelectProcess(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
////			request.getRequestDispatcher("/admin.jsp").forward(request, response);
//		IMemberService ms = new MemberServiceImpl();
//		List<MemberBean> inf = ms.adminselect();
//		if (inf != null) {
////			request.getSession(true).setAttribute("inf", inf);
//			request.setAttribute("user", inf);
//		}
//		request.getRequestDispatcher("/adminModify.jsp").forward(request, response);
////				request.getRequestDispatcher("/admin.jsp").forward(request, response);
//	}
//
//	// 管理員介面
//	public void gotoAdminProcess(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		request.getRequestDispatcher("/admin.jsp").forward(request, response);
//
//	}
//
//	// 管理員會員刪除
//	public void gotoDelete(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
////		request.getRequestDispatcher("/admin.jsp").forward(request, response);
//
//		int MB_ID = Integer.valueOf(request.getParameter("delete"));
//		IMemberService ms = new MemberServiceImpl();
//		ms.deleteMember(MB_ID);
//		List<MemberBean> inf = ms.adminselect();
//		request.setAttribute("user", inf);
//		request.getRequestDispatcher("/adminModify.jsp").forward(request, response);
//
//	}

}
