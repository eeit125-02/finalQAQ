package com.web.book.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.web.book.dao.ActDao;
import com.web.book.model.ActBean;
import com.web.book.model.BookBean;


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
	
	public ActBean getAct(Integer Act_ID) {
		ActBean ab = null;
		Session session = factory.getCurrentSession();
		ab = session.get(ActBean.class, Act_ID);

		return ab;
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
//	//會員的報名活動清單
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ActJoinBean> getJoinRecords(Integer mb_ID) {
//		Session session = factory.getCurrentSession();
//		String hql = "From ActJoinBean ajb Where ajb.mb_ID = :mb_ID";
//		ActJoinBean ajb=session.load(ActJoinBean.class, mb_ID);
//		List<ActJoinBean> list = session.createQuery(hql).setParameter("mbid", ajb).getResultList();
//		return list;
//	}
//
//	//報名活動
//	@SuppressWarnings("unused")
//	@Override
//	public void createActReg(Integer act_ID, Integer mb_ID) {
//		Session session = factory.getCurrentSession();
//		MemberBean memberbean = session.get(MemberBean.class, mb_ID);
//		ActBean actbean = session.get(ActBean.class,act_ID);
//		ActJoinBean actjoinbean = new ActJoinBean();
//		session.save(actjoinbean);
//	}
//
//	//取消報名活動
//	@Override
//	public void cancelJoinAct(Integer join_ID) {
//		Session session = factory.getCurrentSession();
//		ActJoinBean actjoinbean = new ActJoinBean();
//		actjoinbean.setjoin_ID(join_ID);
//		session.delete(actjoinbean);
//	}
//
//	//修改報名資料
//	@Override
//	public ActJoinBean updateJoinAct(Integer mb_ID) {
//		ActJoinBean actjoinbean = null;
//		factory.getCurrentSession().update(actjoinbean);
//		return actjoinbean;
//	}



