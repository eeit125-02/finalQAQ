package com.web.book.dao.impl;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.ActDao;
import com.web.book.model.ActBean;
import com.web.book.model.ActCollectBean;
import com.web.book.model.ActJoinBean;

@Repository
public class ActDaoImpl implements ActDao {
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ActBean> getAllActs(String act_Name) {
		String hql = "FROM ActBean ab WHERE ab.act_Name like :keyword";
		Session session = factory.getCurrentSession();
		List<ActBean> list = session.createQuery(hql).setParameter("keyword","%"+ act_Name +"%").getResultList();
		return list;

	}

	@Override
	public ActBean getAct(String act_Name) {
		Session session = factory.getCurrentSession();
		ActBean actbean = session.load(ActBean.class, act_Name); 
		return actbean;
	}

	@Override
	public void createAct(ActBean ab) {
		Session session = factory.getCurrentSession();
		ActBean actbean = session.load(ActBean.class, ab);
	}

	@Override
	public void updateAct(ActBean ab) {
		Session session = factory.getCurrentSession();
		

	}

	@Override
	public void deleteAct(Integer Act_ID) {
		

	}

	@Override
	public List<ActJoinBean> getJoinRecords(String mb_ID) {
		
		return null;
	}

	@Override
	public void joinAct(ActJoinBean ajb) {
		

	}

	@Override
	public void cancelJoinAct(String act_Name) {
		
	
	}

	@Override
	public List<ActCollectBean> getCollectRecords(String mb_ID) {
		
		return null;
	}

	@Override
	public void collectAct(ActCollectBean acb) {
		

	}

	@Override
	public void cancelCollectAct(String act_Name) {
		

	}

}
