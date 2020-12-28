package com.web.book.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.web.book.dao.ActDao;
import com.web.book.model.ActBean;


@Repository
public class ActDaoImpl implements ActDao {
	
	@Autowired
	SessionFactory factory;

	//查詢所有活動
	@SuppressWarnings("unchecked")
	@Override
	public List<ActBean> getAllActs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActBean";
		List<ActBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	//查詢單筆活動
	public ActBean getAct(Integer Act_ID) {
		ActBean ab = null;
		Session session = factory.getCurrentSession();
		ab = session.get(ActBean.class, Act_ID);

		return ab;
	}
	
	
	//新增活動		
	@Override
	public int createAct(ActBean actbean) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.save(actbean);
		count++;
		return count;
	}

	//修改活動
	@Override
	public int updateAct(ActBean ab) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.update(ab);
		count++;

		return count;
	}

	//刪除活動
	@Override
	public int deleteAct(Integer act_ID) {
		int count = 0;
		Session session = factory.getCurrentSession();

		ActBean ab = new ActBean();
		ab.setact_ID(act_ID);
		System.out.println(ab);
		session.delete(ab);
		count++;

		return count;
	}

	//查詢活動關鍵字
	@SuppressWarnings("unchecked")
	@Override
	public List<ActBean> searchKeyword(String keyword) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActBean ab WHERE ab.act_Name like :searchkw";
		Query<ActBean> query = session.createQuery(hql);
		return query.setParameter("searchkw","%"+ keyword +"%").getResultList();
	}

}



