package com.web.book.dao;

import java.util.List;

import com.web.book.model.MemberBean;

public interface MemberDao {

	boolean insertMember(MemberBean memberData);

	boolean Login(String account, String pwd);

	boolean update(MemberBean mb);

	MemberBean select(String account);

	List<MemberBean> adminselect();

	boolean delete(int id);

}