package com.web.book.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.book.dao.MemberDao;
import com.web.book.model.MemberBean;
import com.web.book.service.MemberService;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao ;
		
	@Override
	public boolean Login(String account , String pwd) {
		return dao.Login(account, pwd);	
	}


	@Override
	public boolean insertMember(MemberBean memberData) {
		return dao.insertMember(memberData);
	}


	@Override
	public List<MemberBean> adminselect() {
		return dao.adminselect();
	}


	@Override
	public MemberBean select(String account) {
		return dao.select(account);
	}


	@Override
	public boolean deleteMember(int id) {
		return dao.delete(id);
	}


	@Override
	public boolean update(MemberBean mb) {
		return dao.update(mb);
	}

}
