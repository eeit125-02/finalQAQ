package com.web.book.service;

import java.util.List;

import com.web.book.model.MemberBean;

public interface MemberService {

	boolean Login(String account, String pwd);

	boolean insertMember(MemberBean memberData);

	List<MemberBean> adminselect();

	MemberBean select(String account);

	boolean deleteMember(int id);

	boolean update(MemberBean mb);
	
	boolean checkAccount(String account);

}