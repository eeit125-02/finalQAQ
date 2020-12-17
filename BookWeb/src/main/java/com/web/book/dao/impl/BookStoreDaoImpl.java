package com.web.book.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.BookStoreDao;
import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.MemberBean;

@Repository
public class BookStoreDaoImpl implements BookStoreDao {
	
	@Autowired
	SessionFactory factory;
	
	// 商品頁面搜尋
	@Override
	@SuppressWarnings("unchecked")
	public List<BookBean> searchBookStore() {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean";
		return session.createQuery(hql).getResultList();
	}
	
	// 單一商品詳細資料
	@Override
	public BookBean getBookDetail(Integer bk_ID) {
		Session session = factory.getCurrentSession();
		return session.get(BookBean.class, bk_ID);
	}
	@Override
	// 單一賣家商品詳細資料
	public BookStoreBean getOneBookStore(Integer bks_ID) {
		Session session = factory.getCurrentSession();
		return session.get(BookStoreBean.class, bks_ID);
	}
	
	// 搜尋會員賣場資料
	@Override
	@SuppressWarnings("unchecked")
	public List<BookStoreBean> searchMemberStore(Integer mb_ID) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookStoreBean a where a.member = :member ";
		Query<BookStoreBean> query = session.createQuery(hql);
		MemberBean member = session.load(MemberBean.class, mb_ID);
		return query.setParameter("member", member).getResultList();
	}
	
	// 從書庫搜尋書名(新增用途)
	@Override
	@SuppressWarnings("unchecked")
	public List<BookBean> searchBookName(String bk_Name) {
		Session session = factory.getCurrentSession();
		String hql = "From BookBean a Where a.bk_Name like :bkname";
		Query<BookBean> query = session.createQuery(hql);
		return query.setParameter("bkname", "%" + bk_Name + "%").getResultList();
	}
	
	// 從書庫搜尋出來的結果選擇一筆資料新增
	@Override
	public void addBookName(Integer bs_Num, Integer bs_Price, Integer bk_ID, Integer bs_ID) {
		Session session = factory.getCurrentSession();
		MemberBean member = session.load(MemberBean.class, bs_ID);
		BookBean book = session.load(BookBean.class, bk_ID);
		BookStoreBean bookStore = new BookStoreBean(null, bs_Num, bs_Price, book, member);
		session.save(bookStore);
	}
	
	//找到會員賣場要修改的一筆資料
//	@SuppressWarnings("unchecked")
//	public BookStoreBean searchOneData(Integer bk_ID) {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM BookStoreBean a where a.book = :book ";
//		Query<BookStoreBean> query = session.createQuery(hql);
//		BookBean book = session.load(BookBean.class, bk_ID);
//		return query.setParameter("book", book).getResultList();
//	}
	
	// 修改會員賣場資料
	@Override
	public void updateBookStore(Integer bks_ID, Integer bs_Num, Integer bs_Price) {
		Session session = factory.getCurrentSession();
		BookStoreBean bookStore = session.load(BookStoreBean.class, bks_ID);
		bookStore.setBs_Num(bs_Num);
		bookStore.setBs_Price(bs_Price);		
	}
	
	// 刪除會員賣場資料
	@Override
	public void deleteBookStore(Integer bks_ID) {
		Session session = factory.getCurrentSession();
		BookStoreBean bookStore = session.load(BookStoreBean.class, bks_ID);
		session.delete(bookStore);
	}

}
