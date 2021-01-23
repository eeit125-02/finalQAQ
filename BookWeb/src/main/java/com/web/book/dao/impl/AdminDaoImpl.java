package com.web.book.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.AdminDao;
import com.web.book.model.ActBean;
import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.PostBean;

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

	// 獲得所有書籍資訊
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> getAllbook() {
		
		Session session = factory.getCurrentSession();
		String hql = "From BookBean";
		
		Query<BookBean> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 獲得所有活動資料
	@SuppressWarnings("unchecked")
	@Override
	public List<ActBean> getAllAct() {
		
		Session session = factory.getCurrentSession();
		String hql = "From ActBean";
		Query<ActBean> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 獲得所有討論版資料
	@SuppressWarnings("unchecked")
	@Override
	public List<PostBean> getAllPost() {
		
		Session session = factory.getCurrentSession();
		String hql = "From PostBean";
		Query<PostBean> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 獲得所有購物資料
	@SuppressWarnings("unchecked")
	@Override
	public List<BookStoreBean> getAllStrore() {
		
		Session session = factory.getCurrentSession();
		String hql = "From PostBean";
		Query<BookStoreBean> query = session.createQuery(hql);
		
		return query.getResultList();
	}

	// 取得讀書資料
	@SuppressWarnings("unchecked")
	@Override
	public BookBean getBook(Integer bkId) {
		Session session = factory.getCurrentSession();
		String hql = "From BookBean bk Where bk.bk_ID =  :bkId";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("bkId", bkId);
		
		return query.getSingleResult();
	}

	//  刪除圖書資料
	@Override
	public Boolean deleteBook(Integer bkId) {
		
		Session session = factory.getCurrentSession();
		String hql = "Delete BookBean bk Where bk.bk_ID = :bk_ID";
		//session.createQuery(hql).setParameter("bk_ID", bkId).executeUpdate();
		System.out.println(session.createQuery(hql).setParameter("bk_ID", bkId).executeUpdate());
		return true;
	}

}
