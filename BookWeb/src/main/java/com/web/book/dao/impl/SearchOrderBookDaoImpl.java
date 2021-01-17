package com.web.book.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.SearchOrderBookDAO;
import com.web.book.model.BookBean;


@Repository
public class SearchOrderBookDaoImpl implements SearchOrderBookDAO {

	private int maxpage = 0;

	@Autowired
	SessionFactory factory;

	// 查詢書籍關鍵字byPage
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBook(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Name like :searchkw ORDER BY b.bk_Page";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍作者byPage
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBookAuthor(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Author like :searchkw ORDER BY b.bk_Page";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍出版社byPage
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBookPublish(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Publish like :searchkw ORDER BY b.bk_Page";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍類型byPage
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<BookBean> searchOrderBookType(List<Integer> reslist, Integer page) {
		Session session = factory.getCurrentSession();
		List<BookBean> res1 = new ArrayList<BookBean>();
		ArrayList<BookBean> res = new ArrayList<BookBean>();

		String sql = null;
		System.out.println("uuuuuuuuuuuuuuuuuuuuuuu"+reslist);
		int count = reslist.size();
		int qaq = 1;
		for (Integer typeid : reslist) {
			if (qaq == 1) {
				sql = "sty_ID=" + session.load(BookBean.class, typeid).getBk_ID().toString();
				qaq += 1;
			} else if (qaq <= count) {
				sql += " or sty_ID=" + session.load(BookBean.class, typeid).getBk_ID().toString();
				qaq += 1;
			}
		}

		String hql = "SELECT bt.book FROM BookTypeBean as bt WHERE " + sql + "Order by bt.book.bk_Page";
		Query<BookBean> query = session.createQuery(hql);
maxpage=query.getResultList().size();
			query.setFirstResult((page - 1) * 10);
			query.setMaxResults(10);
			res1=query.getResultList();
		return res1;
	}

	// 取得總頁數
	@Override
	public int getOrderResultPage() {
		int totalpage = 0;
		if (maxpage % 10 == 0) {
			totalpage += maxpage / 10;
		} else {
			totalpage += maxpage / 10 + 1;
		}

		return totalpage;
	}
	
	//取得總筆數
	@Override
	public int getOrderResultNumber() {
		return maxpage;
	}

//	===========================

	
	// 查詢書籍關鍵字byDate
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBookDate(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Name like :searchkw ORDER BY b.bk_Date desc";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍作者byDate
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBookAuthorDate(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Author like :searchkw ORDER BY b.bk_Date desc";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍出版社byDate
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBookPublishDate(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Publish like :searchkw ORDER BY b.bk_Date desc";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍類型byDate
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<BookBean> searchOrderBookTypeDate(List<Integer> reslist, Integer page) {
		Session session = factory.getCurrentSession();
		List<BookBean> res1 = new ArrayList<BookBean>();
		ArrayList<BookBean> res = new ArrayList<BookBean>();

		String sql = null;
		int count = reslist.size();
		int qaq = 1;
		for (Integer typeid : reslist) {
			if (qaq == 1) {
				sql = "sty_ID=" + session.load(BookBean.class, typeid).getBk_ID().toString();
				qaq += 1;
			} else if (qaq <= count) {
				sql += " or sty_ID=" + session.load(BookBean.class, typeid).getBk_ID().toString();
				qaq += 1;
			}
		}

		String hql = "SELECT bt.book FROM BookTypeBean as bt WHERE " + sql + "Order by bt.book.bk_Date desc";
		Query<BookBean> query = session.createQuery(hql);
maxpage=query.getResultList().size();
			query.setFirstResult((page - 1) * 10);
			query.setMaxResults(10);
			res1=query.getResultList();
		return res1;
	}
	
//	=========================
	
	// 查詢書籍關鍵字byClick
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBookClick(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Name like :searchkw ORDER BY b.bk_Click desc";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍作者byClick
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBookAuthorClick(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Author like :searchkw ORDER BY b.bk_Click desc";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍出版社byClick
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> searchOrderBookPublishClick(String name, Integer page) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookBean b WHERE b.bk_Publish like :searchkw ORDER BY b.bk_Click desc";
		Query<BookBean> query = session.createQuery(hql);
		query.setParameter("searchkw", "%" + name + "%");
		maxpage = query.setParameter("searchkw", "%" + name + "%").getResultList().size();
		query.setFirstResult((page - 1) * 10);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// 查詢書籍類型byClick
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<BookBean> searchOrderBookTypeClick(List<Integer> reslist, Integer page) {
		Session session = factory.getCurrentSession();
		List<BookBean> res1 = new ArrayList<BookBean>();
		ArrayList<BookBean> res = new ArrayList<BookBean>();

		String sql = null;
		int count = reslist.size();
		int qaq = 1;
		for (Integer typeid : reslist) {
			if (qaq == 1) {
				sql = "sty_ID=" + session.load(BookBean.class, typeid).getBk_ID().toString();
				qaq += 1;
			} else if (qaq <= count) {
				sql += " or sty_ID=" + session.load(BookBean.class, typeid).getBk_ID().toString();
				qaq += 1;
			}
		}

		String hql = "SELECT bt.book FROM BookTypeBean as bt WHERE " + sql + "Order by bt.book.bk_Click desc";
		Query<BookBean> query = session.createQuery(hql);
maxpage=query.getResultList().size();
			query.setFirstResult((page - 1) * 10);
			query.setMaxResults(10);
			res1=query.getResultList();
		return res1;
	}

}
