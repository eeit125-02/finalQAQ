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
import com.web.book.model.BookReportCollectBean;
import com.web.book.model.BookReportMessageBean;
import com.web.book.model.MemberBean;

@Repository
public class BookReportDaoImpl implements BookReportDao {
	
	@Autowired
	SessionFactory fatory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportBean> bookReportMemberAllList(Integer mb_ID) {
		
		Session session = fatory.getCurrentSession();
		String hql = "From BookReportBean br Where br.member.mb_ID = :mb_ID";
		Query<BookReportBean> query = session.createQuery(hql);
		
		return query.setParameter("mb_ID", mb_ID).getResultList();
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
		session.get(BookReportBean.class, br_ID).setBr_ClickNumber(session.get(BookReportBean.class, br_ID).getBr_ClickNumber() + 1);
		return session.get(BookReportBean.class, br_ID);
	}

	@Override
	public void deleteBookReport(Integer br_ID) {
		
		Session session = fatory.getCurrentSession();
		String hql = "Delete BookReportCollectBean rc Where rc.bookReport.br_ID = :br_ID";
		
		session.createQuery(hql).setParameter("br_ID", br_ID).executeUpdate();
		
		hql = "Delete BookReportMessageBean bm Where bm.bookReport.br_ID = :br_ID";
		session.createQuery(hql).setParameter("br_ID", br_ID).executeUpdate();
		
		hql = "Delete BookReportBean br Where br.br_ID = :br_ID";
		session.createQuery(hql).setParameter("br_ID", br_ID).executeUpdate();
		
	
	}

	@Override
	public void upDateBookReportData(Integer br_ID, Integer br_Score, String br_Content) {
		
		Session session = fatory.getCurrentSession();
		BookReportBean bookReport = session.load(BookReportBean.class, br_ID);
		bookReport.setBr_Score(br_Score);
		bookReport.setBr_Content(br_Content);
		
	}

	@Override
	public void insertBookReport(Integer mb_ID, Integer bk_ID, String br_Name, Integer br_Score, String br_Content) {
		
		Session session = fatory.getCurrentSession();
		MemberBean member = session.load(MemberBean.class, mb_ID);
		BookBean book = session.load(BookBean.class, bk_ID);
		Date date =  new Date();
		BookReportBean bookReport = new BookReportBean(null, br_Name, br_Score,
														br_Content, date, 0, 0, book, member);
		session.save(bookReport);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportBean>  allbookReportList() {
		Session session = fatory.getCurrentSession();
		String hql = "From BookReportBean br";
		Query<BookReportBean> query = session.createQuery(hql);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Integer getAllBookRepotPageSize() {
		
		Integer maxPage = 0;
		Session session = fatory.getCurrentSession();
		String hql = "Select count(br) From BookReportBean br";
		Query<BookReportBean> query = session.createQuery(hql);
		
		if (Integer.valueOf(String.valueOf(query.uniqueResult()))%10 == 0) {
			maxPage += Integer.valueOf(String.valueOf(query.uniqueResult()))/ 10;
		}
		else {
			maxPage += Integer.valueOf(String.valueOf(query.uniqueResult()))/ 10+ 1;
		}
		
		return maxPage;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportBean> getThisPageDateForAllBookRepot(Integer page) {
		
		Session session = fatory.getCurrentSession();
		String hql = "From BookReportBean order by br_ID";
		Query<BookReportBean> query = session.createQuery(hql);
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Integer getSearchBookRepotPageSize(String searchString) {
		
		Integer maxPage = 0;
		Session session = fatory.getCurrentSession();
		String hql = "Select count(br) From BookReportBean br Where "
					  + "br.book.bk_Name like :searchString"
					  + " or br.book.bk_Author like :searchString"
					  + " or br.book.bk_Publish like :searchString"
					  + " or br.br_Name like :searchString"
					  + " or br.book.bk_BookType like :searchString";
		
		Query<BookReportBean> query = session.createQuery(hql);
		query.setParameter("searchString", "%"+searchString+"%");
		
		if (Integer.valueOf(String.valueOf(query.uniqueResult()))%10 == 0) {
			maxPage += Integer.valueOf(String.valueOf(query.uniqueResult()))/ 10;
		}
		else {
			maxPage += Integer.valueOf(String.valueOf(query.uniqueResult()))/ 10+ 1;
		}
		
		return maxPage;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportBean> getThisPageDateForSearchBookRepot(Integer page, String searchString) {
		
		Session session = fatory.getCurrentSession();
		String hql = "From BookReportBean as br Where "
					  + "br.book.bk_Name like :searchString"
					  + " or br.book.bk_Author like :searchString"
					  + " or br.book.bk_Publish like :searchString"
					  + " or br.br_Name like :searchString"
					  + " or br.book.bk_BookType like :searchString";
		Query<BookReportBean> query = session.createQuery(hql);
		query.setParameter("searchString", "%"+searchString+"%");
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		
		return query.getResultList();
	}

	@Override
	public void addSubReport(Integer br_ID, Integer mb_ID) {
		
		Session session = fatory.getCurrentSession();
		MemberBean member = session.load(MemberBean.class, mb_ID);
		BookReportBean bookReport = session.load(BookReportBean.class, br_ID);
		Date date =  new Date();
		BookReportCollectBean collect = new BookReportCollectBean(null, bookReport, member, date);
		session.save(collect);
		session.get(BookReportBean.class, br_ID).setBr_CollectionNumber(session.get(BookReportBean.class, br_ID).getBr_CollectionNumber() + 1);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportCollectBean> getMemberCollectReportList(Integer mbId) {
		
		Session session = fatory.getCurrentSession();
		String hql = "From BookReportCollectBean rc Where rc.member = :member";
		Query<BookReportCollectBean> query = session.createQuery(hql);
		
		return query.setParameter("member", session.get(MemberBean.class, mbId)).getResultList();
	}

	@Override
	public void delteCollectReport(Integer rcId) {
		
		Session session = fatory.getCurrentSession();
		session.delete(session.load(BookReportCollectBean.class, rcId));
		Integer brId = session.load(BookReportCollectBean.class, rcId).getBookReport().getBr_ID();
		session.get(BookReportBean.class, brId).setBr_CollectionNumber(session.get(BookReportBean.class, brId).getBr_CollectionNumber() - 1);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportMessageBean> getBookReportMessageList(Integer brId) {
		Session session = fatory.getCurrentSession();
		String hql = "From BookReportMessageBean bm where bm.bookReport = :bookReport";
		Query<BookReportMessageBean> query = session.createQuery(hql);
		return query.setParameter("bookReport", session.get(BookReportBean.class, brId)).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookReportMessageBean> getMemberBookReportMessageList(Integer mbId) {
		Session session = fatory.getCurrentSession();
		String hql = "From BookReportMessageBean bm where bm.member = :member";
		Query<BookReportMessageBean> query = session.createQuery(hql);
		
		return query.setParameter("member", session.get(MemberBean.class, mbId)).getResultList();
	}

	@Override
	public void addReportMessage(Integer brId, Integer mbId, String content) {
		
		Session session = fatory.getCurrentSession();
		BookReportMessageBean bookReportMessage = new BookReportMessageBean(null, new Date(), content, session.get(BookReportBean.class, brId), session.get(MemberBean.class, mbId));
		session.save(bookReportMessage);
	}

	@Override
	public void deletReportMessage(Integer bmId) {
		Session session = fatory.getCurrentSession();
		session.delete(session.get(BookReportMessageBean.class, bmId));
	}
	
	
	
	
}
