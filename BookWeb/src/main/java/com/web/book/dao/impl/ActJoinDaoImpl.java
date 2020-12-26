package com.web.book.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.web.book.dao.ActJoinDao;
import com.web.book.model.ActJoinBean;


@Repository
public class ActJoinDaoImpl implements ActJoinDao {
	
	@Autowired
	SessionFactory factory;

	//查詢所有活動
	@SuppressWarnings("unchecked")
	@Override
	public List<ActJoinBean> getAllJoins() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActJoinBean";
		List<ActJoinBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	public ActJoinBean getActJoin(Integer join_ID) {
		ActJoinBean ajb = null;
		Session session = factory.getCurrentSession();
		ajb = session.get(ActJoinBean.class, join_ID);

		return ajb;
	}
	
//	//依活動名稱關鍵字查詢活動
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ActBean> getAct(String act_Name) {
//		List<ActBean> list = null;
//		Session session = factory.getCurrentSession();
//		String hql  = "FROM ActBean ab WHERE ab.act_Name like :keyword";
//		try {
//			 list = session.createQuery(hql)
//									.setParameter("keyword","%"+ act_Name +"%")
//									.getResultList();
//		} catch(NoResultException e) {
//			;  // 表示查無紀錄
//		}		
//		 
//		return list;
//	}
	
	//新增活動		
	@Override
	public int createActJoin(ActJoinBean ajb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.save(ajb);
		count++;
		return count;
	}

	//修改活動
	@Override
	public int updateActJoin(ActJoinBean ajb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.update(ajb);
		count++;

		return count;
	}

	//刪除活動
	@Override
	public int deleteActJoin(Integer join_ID) {
		int count = 0;
		Session session = factory.getCurrentSession();

		ActJoinBean ajb = new ActJoinBean();
		ajb.setjoin_ID(join_ID);
		System.out.println(ajb);
		session.delete(ajb);
		count++;

		return count;
	}

}

