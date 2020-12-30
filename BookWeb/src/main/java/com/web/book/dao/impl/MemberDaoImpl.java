package com.web.book.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.MemberDao;
import com.web.book.model.MemberBean;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory factory;

	@Override
	public boolean insertMember(MemberBean memberData) {
		Session session = factory.getCurrentSession();
		session.save(memberData);
		return true;
	}

	@Override
	public boolean Login(String account, String pwd) {
		boolean result = false;
		String hql = "FROM MemberBean WHERE mb_Account =:account and mb_Password =:pwd";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		List<MemberBean> list = query.setParameter("account", account).setParameter("pwd", pwd).getResultList();
		if (list.size() > 0) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean checkAccount(String account) {
		boolean result = false;
		String hql = "FROM MemberBean WHERE mb_Account =:account";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		List<MemberBean> list = query.setParameter("account", account).getResultList();
		System.out.println(list.size());
		if (list.size() > 0) {
			result = true;
		}
		return result;
	}
	
	@Override
	public boolean update(MemberBean mb) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(mb);
		return true;
	}

	@Override
	public MemberBean select(String account) {
		String hql = "FROM MemberBean WHERE mb_Account=:account";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		MemberBean mb =query.setParameter("account", account).getSingleResult();
		return mb;
	}

	@Override
	public List<MemberBean> adminselect() {
		List<MemberBean> dep = new ArrayList<MemberBean>();
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		dep = query.getResultList();

		return dep;
	}

	@Override
	public boolean checkColume(String account) {
		String hql = "FROM MemberBean WHERE mb_Account=:account";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		MemberBean mb =query.setParameter("account", account).getSingleResult();
		System.out.println(mb.isCheckColume());
		return mb.isCheckColume();
	}

	@Override
	public void change(String account) {
		String hql = "FROM MemberBean WHERE mb_Account=:account";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		MemberBean mb =query.setParameter("account", account).getSingleResult();
		mb.setCheckColume(!mb.isCheckColume());
	}
	
	@Override
	public boolean delete(int id) {
		Session session = factory.getCurrentSession();
		MemberBean mb = new MemberBean();
		mb.setMb_ID(id);
		session.delete(mb);
		return true;
	}

}
