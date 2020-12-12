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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.book.model.MemberBean;
import com.web.book.service.MemberService;
import com.web.book.service.impl.MemberServiceImpl;

@Controller
public class Login {

	@Autowired
	MemberService ms;

	// 會員登入
	@PostMapping("/login")
	public String login(Model model ,
									@RequestParam(value="account") String account,
									@RequestParam(value="pwd") String pwd) {
		boolean mb = ms.Login(account, pwd);
		if (mb) {
			if(account.equals("a123456") && pwd.equals("a123456")) {
				MemberBean memberall = (MemberBean) ms.adminselect();
				model.addAttribute("admin", memberall);
				return "Member/admin";
			}else {
			MemberBean select = ms.select(account);
			model.addAttribute("login", select);
			}
			} else {
//		導回login
		}
		return "Member/city";
	}

	// 會員修改
	@PostMapping("/Modify")
	public String Update(Model model,
						   @RequestParam(value="password") String pwd) {
		MemberBean member = (MemberBean) model.getAttribute("login");
		member.setMb_Password(pwd);
		boolean update = ms.update(member);
		if (update) {
			MemberBean select = ms.select(member.getMb_Account());
			model.addAttribute("login",select);
		}
		return "/city.jsp";
	}

	// 管理員(會員資料)
	@PostMapping("/admin")
	public void gotoSelectProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<MemberBean> inf = ms.adminselect();
		if (inf != null) {
			request.setAttribute("user", inf);
		}
		request.getRequestDispatcher("/adminModify.jsp").forward(request, response);
	}

	// 管理員介面
	public void gotoAdminProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/admin.jsp").forward(request, response);

	}

	// 管理員會員刪除
	public void gotoDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.getRequestDispatcher("/admin.jsp").forward(request, response);

		int MB_ID = Integer.valueOf(request.getParameter("delete"));
		IMemberService ms = new MemberServiceImpl();
		ms.deleteMember(MB_ID);
		List<MemberBean> inf = ms.adminselect();
		request.setAttribute("user", inf);
		request.getRequestDispatcher("/adminModify.jsp").forward(request, response);

	}

}
