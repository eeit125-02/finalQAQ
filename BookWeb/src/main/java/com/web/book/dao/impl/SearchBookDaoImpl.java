package com.web.book.dao.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.SearchBookDAO;
import com.web.book.model.BookBean;
import com.web.book.model.BookCollectBean;
import com.web.book.model.MemberBean;

@Repository
public class SearchBookDaoImpl implements SearchBookDAO {

	@Autowired
	SessionFactory factory;

	// 查詢書籍關鍵字
	// 缺一個判斷list=0就顯示查無此書的判斷式
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchBook(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Name like :searchkw";
		Query<BookBean> query = session.createQuery(hql);
		return query.setParameter("searchkw","%"+ name +"%").getResultList();
	}
	
	// 查詢書籍作者
	// 缺一個判斷list=0就顯示查無此書的判斷式
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchBookAuthor(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Author like :searchkw";
		Query<BookBean> query = session.createQuery(hql);
		return query.setParameter("searchkw","%"+ name +"%").getResultList();
	}
	
	// 查詢書籍出版社
	// 缺一個判斷list=0就顯示查無此書的判斷式
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchBookPublish(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Publish like :searchkw";
		Query<BookBean> query = session.createQuery(hql);
		return query.setParameter("searchkw","%"+ name +"%").getResultList();
	}

	// 取得單一本書的詳細資訊
	@Override
	@SuppressWarnings("unchecked")
	public BookBean getBook(int id) {
		BookBean result = new BookBean();
		String hql = "FROM BookBean b WHERE b.bk_ID = :bkid";
		Session session = factory.getCurrentSession();
		Query<BookBean> query = session.createQuery(hql);
		result = query.setParameter("bkid", id).getSingleResult();
		return result;
	}

	// 會員收藏清單
	@Override
	@SuppressWarnings("unchecked")
	public List<BookCollectBean> getCollect(int MB_ID) {
		List<BookCollectBean> list = new ArrayList<>();
		String hql = "From BookCollectBean bc Where bc.member = :mbid";
		Session session = factory.getCurrentSession();
		BookCollectBean bc=session.load(BookCollectBean.class, MB_ID);
		Query<BookCollectBean> query = session.createQuery(hql);
		list = query.setParameter("mbid", bc).getResultList();
		return list;
	}	
	
	// 刪除收藏項目
	@Override
	public boolean deletebc(int bcid) {
		int count = 0;
		boolean result2=false;
		Session session = factory.getCurrentSession();
		BookCollectBean result = session.load(BookCollectBean.class, bcid);		
		session.delete(result);
		count++;
		if(count>0) {
			result2=true;
		}
		return result2;
	}

	// 新增收藏項目
	@Override
	public boolean savebc(int bk_id, int mb_id) {
		boolean result=false;
		int count = 0;
		Session session = factory.getCurrentSession();
		LocalDate d = LocalDate.now();
		java.sql.Date sqlDate = java.sql.Date.valueOf(d);
		MemberBean member = session.get(MemberBean.class, mb_id);
		BookBean book = session.get(BookBean.class, bk_id);
		BookCollectBean bkc=new BookCollectBean(1, sqlDate, null, book, member);
		session.save(bkc);
		count++;
		if(count>0) {
			result=true;
		}
		return result;
	}

	// 新增書本
	@Override
	public BookBean savebk(BookBean bkc) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.save(bkc);
		count++;
		return bkc;
	}

	// 修改書本
	@Override
	public int updatebk(BookBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(mb);
		count++;
		return count;
	}

}
