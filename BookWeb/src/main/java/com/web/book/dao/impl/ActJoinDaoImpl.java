package com.web.book.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.web.book.dao.ActJoinDao;
import com.web.book.model.ActJoinBean;


@Repository
public class ActJoinDaoImpl implements ActJoinDao {
	
	@Autowired
	SessionFactory factory;

	//查詢所有報名表
	@SuppressWarnings("unchecked")
	@Override
	public List<ActJoinBean> getAllJoins() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActJoinBean";
		List<ActJoinBean> actjoinlist = session.createQuery(hql).getResultList();
		return actjoinlist;
	}
	
	//依會員ID查詢報名紀錄
	@SuppressWarnings("unchecked")
	@Override
	public List<ActJoinBean> getJoinRecords(Integer mb_ID) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActJoinBean where mb_ID = :mb_ID";
		List<ActJoinBean> mbjoinlist = session.createQuery(hql).getResultList();
		return mbjoinlist;		
	}
	
	
	//依報名ID取得單一報名紀錄
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
	
	//新增報名		
	@Override
	public int createActJoin(ActJoinBean ajb) {
		int count = 0;

		Session session = factory.getCurrentSession();
		session.save(ajb);
		count++;
		return count;
	}

	//修改報名
	@Override
	public int updateActJoin(ActJoinBean ajb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.update(ajb);
		count++;

		return count;
	}

	//刪除報名
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

