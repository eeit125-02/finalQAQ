package com.web.book.dao.impl;

import java.util.LinkedList;
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
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<BookBean> searchBookStore() {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookStoreBean a where a.member = 13 ";
		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(40);
		return query.getResultList();
	}
	
	//  一件商品價錢區間
	public void name() {
		Session session = factory.getCurrentSession();
		String hql = "";
	}

	// 灌庫存值給商店
	@Override
	public void boobqaq() {
		// 6242 /80~84、11 /13 /a123456
		Session session = factory.getCurrentSession();
		Integer qaqQty = 0;
		Integer qaqPrice = 0;
		MemberBean member = session.load(MemberBean.class, 11);
	// 管理員灌值 start
//		for (int i = 1; i < 6243; i++) {
//			BookBean book = session.load(BookBean.class, i);
//			qaqQty = (int)(Math.random()*(20))+1;
//			if (book.getBk_Price()==null) {
//				book.setBk_Price(100);
//			}
//			BookStoreBean bookStoreBean = new BookStoreBean(null, qaqQty, book.getBk_Price(), book, member);
//			session.save(bookStoreBean);
//		}
	// 管理員灌值 end
		
	// 製造不同庫存不同價錢區間 start
	// 不重複數字 start
		LinkedList<Integer> myList = new LinkedList<Integer>();
	// 書本ID
		int n = 6243;
		for (int i = 0; i < n; i++)
			myList.add(i + 1);
	// 隨機的比數
		int[] arr = new int[1000];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = myList.remove((int) (Math.random() * n) + 1);
			n--;
		}
	// 不重覆數字 end
		for (int i = 0; i < arr.length; i++) {
			BookBean book = session.load(BookBean.class, arr[i]);
			qaqQty = (int)(Math.random()*(10))+1;
			qaqPrice = (int)(Math.random()*( (book.getBk_Price()/10) -5))+5;
			BookStoreBean bookStoreBean = new BookStoreBean(null, qaqQty, qaqPrice*10, book, member);
			session.save(bookStoreBean);
		}
	// 製造不同庫存不同價錢區間 end	
		
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

	// 找到會員賣場要修改的一筆資料
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
