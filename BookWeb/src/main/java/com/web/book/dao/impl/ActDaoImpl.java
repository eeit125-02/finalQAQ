package com.web.book.dao.impl;

import java.util.List;
import javax.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.web.book.dao.ActDao;
import com.web.book.model.ActBean;
import com.web.book.model.ActJoinBean;
import com.web.book.model.MemberBean;


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

	//依活動名稱關鍵字查詢活動
	@Override
	public ActBean getAct(String act_Name) {
		ActBean actbean = null;
		Session session = factory.getCurrentSession();
		String hql  = "FROM ActBean ab WHERE ab.act_Name like :keyword";
		try {
			actbean = (ActBean)session.createQuery(hql)
									.setParameter("keyword","%"+ act_Name +"%")
									.getResultList();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}		
		return actbean;
	}
	
	//新增活動		
	@Override
	public void createAct(ActBean actbean) {
		factory.getCurrentSession().saveOrUpdate(actbean);
	}

	//修改活動
	@Override
	public ActBean updateAct(ActBean actbean) {
		factory.getCurrentSession().update(actbean);
		return actbean;
	}

	//刪除活動
	@Override
	public void deleteAct(Integer act_ID) {
		Session session = factory.getCurrentSession();
		ActBean actbean = new ActBean();
		actbean.setact_ID(act_ID);
		session.delete(actbean);
	}

	//會員的報名活動清單
	@SuppressWarnings("unchecked")
	@Override
	public List<ActJoinBean> getJoinRecords(Integer mb_ID) {
		Session session = factory.getCurrentSession();
		String hql = "From ActJoinBean ajb Where ajb.mb_ID = :mb_ID";
		ActJoinBean ajb=session.load(ActJoinBean.class, mb_ID);
		List<ActJoinBean> list = session.createQuery(hql).setParameter("mbid", ajb).getResultList();
		return list;
	}

	//報名活動
	@SuppressWarnings("unused")
	@Override
	public void createActReg(Integer act_ID, Integer mb_ID) {
		Session session = factory.getCurrentSession();
		MemberBean memberbean = session.get(MemberBean.class, mb_ID);
		ActBean actbean = session.get(ActBean.class,act_ID);
		ActJoinBean actjoinbean = new ActJoinBean();
		session.save(actjoinbean);
	}

	//取消報名活動
	@Override
	public void cancelJoinAct(Integer join_ID) {
		Session session = factory.getCurrentSession();
		ActJoinBean actjoinbean = new ActJoinBean();
		actjoinbean.setjoin_ID(join_ID);
		session.delete(actjoinbean);
	}

	//修改報名資料
	@Override
	public ActJoinBean updateJoinAct(Integer mb_ID) {
		ActJoinBean actjoinbean = null;
		factory.getCurrentSession().update(actjoinbean);
		return actjoinbean;
	}


}
