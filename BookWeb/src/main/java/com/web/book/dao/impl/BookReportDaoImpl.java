package com.web.book.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.BookReportDao;
import com.web.book.model.BookBean;
import com.web.book.model.BookReportBean;
import com.web.book.model.MemberBean;

@Repository
public class BookReportDaoImpl implements BookReportDao {
	
	@Autowired
	SessionFactory fatory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportBean> bookReportMemberAllList(Integer mb_ID) {
		
		Session session = fatory.getCurrentSession();
		String hql = "From BookReportBean br Where br.member = :member";
		Query<BookReportBean> query = session.createQuery(hql);
		MemberBean member = session.load(MemberBean.class, mb_ID);
		
		return query.setParameter("member", member).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportBean> bookReportBookAllList(Integer bk_ID) {

		Session session = fatory.getCurrentSession();
		String hql = "From BookReportBean br Where br.book = :book";
		Query<BookReportBean> query = session.createQuery(hql);
		BookBean book = session.load(BookBean.class, bk_ID);
		
		return query.setParameter("book", book).getResultList();
	}
	
	@Override
	public BookReportBean getBookReport(Integer br_ID) {
		
		Session session = fatory.getCurrentSession();
		
		return session.get(BookReportBean.class, br_ID);
	}

	@Override
	public void deleteBookReport(Integer br_ID) {
		
		Session session = fatory.getCurrentSession();
		session.delete(session.load(BookReportBean.class, br_ID));
	
	}

	@Override
	public void upDateBookReportData(Integer br_ID, Integer br_Score, String br_Content) {
		
		Session session = fatory.getCurrentSession();
		BookReportBean bookReport = session.load(BookReportBean.class, br_ID);
		bookReport.setBr_Score(br_Score);
		bookReport.setBr_Content(br_Content);
		
	}

	@Override
	public void insertBookReport(int mb_ID, int bk_ID, int br_Score, String br_Content) {
		
		Session session = fatory.getCurrentSession();
		MemberBean member = session.load(MemberBean.class, mb_ID);
		BookBean book = session.load(BookBean.class, bk_ID);
		Date date =  new Date();
		BookReportBean bookReport = new BookReportBean(null, br_Score, br_Content, date, book, member);
		session.save(bookReport);
		
	}
}
