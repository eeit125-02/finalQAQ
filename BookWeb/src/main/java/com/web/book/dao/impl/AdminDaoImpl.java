package com.web.book.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.AdminDao;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	SessionFactory factory;

	// 獲得半年心得撰寫數量 
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getMonthReportWrite() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR(br.br_DateTime), MONTH(br.br_DateTime), count(br) "
				   + "from BookReportBean br "
				   + "group by YEAR(br.br_DateTime), MONTH(br.br_DateTime) "
				   + "ORDER by YEAR(br.br_DateTime) DESC, MONTH (br.br_DateTime) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}

	// 獲得半年心得瀏覽數量
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getMonthReportViews() {
		
		Session session = factory.getCurrentSession();
		String hql = "Select YEAR(br.br_DateTime), MONTH(br.br_DateTime), sum(br.br_ClickNumber) "
				   + "from BookReportBean br "
				   + "group by YEAR(br.br_DateTime), MONTH(br.br_DateTime) "
				   + "ORDER by YEAR(br.br_DateTime) DESC, MONTH (br.br_DateTime) DESC";
		Query<Object> query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		
		return query.getResultList();
	}

}
