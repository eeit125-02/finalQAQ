package com.web.book.dao.impl;

import java.util.Date;
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

	// 商品頁面搜尋，管理員a123456,14
	@SuppressWarnings("unchecked")
	@Override
	public List<BookStoreBean> searchBookStore(int page, int bs_ID) {
		Session session = factory.getCurrentSession();
		String hql = "FROM BookStoreBean where bs_ID = :bs_ID";
		Query<BookStoreBean> query = session.createQuery(hql);
		int startPage = (page - 1)* 12;
		query.setParameter("bs_ID", bs_ID);
		query.setFirstResult(startPage);
		query.setMaxResults(12);
		return query.getResultList();
	}
	
	// 商品頁面搜尋全部頁數，管理員a123456,07 
	@SuppressWarnings("unchecked")
	public Integer getAllSearchBookStoreSize(int bs_ID) {
		Integer maxPage = 0;
		Session session = factory.getCurrentSession();
		String hql = "Select bks_ID FROM BookStoreBean where bs_ID = :bs_ID";
		Query<BookStoreBean> query = session.createQuery(hql);
		query.setParameter("bs_ID", bs_ID);
		if (query.getResultList().size()%12 == 0) {
			maxPage += query.getResultList().size()/12;
		} else {
			maxPage += (query.getResultList().size()/12) + 1;
		}
		return maxPage;
	}

	// 一件商品所有價錢區間
	@Override
	@SuppressWarnings("unchecked")
	public List<BookStoreBean> bookPrices(Integer bk_ID) {
		Session session = factory.getCurrentSession();
		String hql = "from BookStoreBean where bk_ID = :bk_ID  order by bs_Price";
		Query<BookStoreBean> query = session.createQuery(hql);
		return query.setParameter("bk_ID", bk_ID).getResultList();
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
		return query.setParameter("member", member).setFirstResult(0).setMaxResults(40).getResultList();
	}

	// 首頁搜尋書名
	@Override
	@SuppressWarnings("unchecked")
	public List<BookStoreBean> searchStoreBookName(String bk_Name, Integer page, Integer bs_ID) {
		Session session = factory.getCurrentSession();
		String hql = "From BookStoreBean a Where a.book.bk_Name like :bkname and bs_ID = :bs_ID";
		Query<BookStoreBean> query = session.createQuery(hql);
		int startPage = (page - 1)* 12;
		query.setParameter("bs_ID", bs_ID);
		query.setParameter("bkname", "%" + bk_Name + "%");
		query.setFirstResult(startPage);
		query.setMaxResults(12);
		return query.getResultList();
	}
	
	// 首頁搜尋書名全部頁數
	@SuppressWarnings("unchecked")
	public Integer getSearchStoreBookNameSize(String bk_Name, Integer bs_ID) {
		Integer maxPage = 0;
		Session session = factory.getCurrentSession();
		String hql = "Select bks_ID From BookStoreBean a Where a.book.bk_Name like :bkname and bs_ID = :bs_ID";
		Query<BookStoreBean> query = session.createQuery(hql);
		query.setParameter("bkname", "%" + bk_Name + "%");
		query.setParameter("bs_ID", bs_ID);
		if (query.getResultList().size()%12 == 0) {
			maxPage += query.getResultList().size()/12;
		} else {
			maxPage += (query.getResultList().size()/12) + 1;
		}
		return maxPage;
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
	public void insertSearchBookName(Integer bs_Num, Integer bs_Price, Integer bk_ID, Integer bs_ID) {
		Session session = factory.getCurrentSession();
		MemberBean member = session.load(MemberBean.class, bs_ID);
		BookBean book = session.load(BookBean.class, bk_ID);
		Date date = new Date();
		BookStoreBean bookStore = new BookStoreBean(null, bs_Num, bs_Price, book, member, date);
		session.save(bookStore);
	}

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

	// 灌庫存值給商店
	@Override
	public void boobqaq() {
		// 6242 /80~84、11 /13 /a123456
		Session session = factory.getCurrentSession();
		Integer qaqQty = 0;
		Integer qaqPrice = 0;
		MemberBean member = session.load(MemberBean.class, 9);
		// 24 9 20
		// 管理員灌值 start
//		MemberBean member = session.load(MemberBean.class, 14);
//			for (int i = 1; i < 6243; i++) {
//				BookBean book = session.load(BookBean.class, i);
//				qaqQty = (int)(Math.random()*(20))+1;
//				if (book.getBk_Price()==null) {
//					book.setBk_Price(100);
//				}
//				Date date = new Date(120, 8, 22);
//				BookStoreBean bookStoreBean = new BookStoreBean(null, qaqQty, book.getBk_Price(), book, member, date);
//				session.save(bookStoreBean);
//			}
		// 管理員灌值 end

		// 製造不同庫存不同價錢區間 start
		// 不重複數字 start
//		LinkedList<Integer> myList = new LinkedList<Integer>();
		// 書本ID
//		int n = 6243;
//		for (int i = 0; i < n; i++)
//			myList.add(i + 1);
		// 隨機的比數
//		int[] arr = new int[1000];
//		for (int i = 0; i < arr.length; i++) {
//			arr[i] = myList.remove((int) (Math.random() * n) + 1);
//			n--;
//		}
		// 不重覆數字 end
//		for (int i = 0; i < arr.length; i++) {
//			BookBean book = session.load(BookBean.class, arr[i]);
//			qaqQty = (int) (Math.random() * (10)) + 1;
//			qaqPrice = (int) (Math.random() * ((book.getBk_Price() / 10) - 5)) + 5;
//			BookStoreBean bookStoreBean = new BookStoreBean(null, qaqQty, qaqPrice * 10, book, member);
//			session.save(bookStoreBean);
//		}
		// 製造不同庫存不同價錢區間 end
//		假資料
		Date date = new Date();
		for (int i = 1; i < 100; i++) {
			BookBean book = session.load(BookBean.class, i);
			qaqQty = (int) (Math.random() * (100)) + 1;
			if (book.getBk_Price()==null) {
				book.setBk_Price(100);
				qaqPrice = (int) (Math.random() * ((book.getBk_Price() / 10) - 5)) + 5;
			}
			qaqPrice = (int) (Math.random() * ((book.getBk_Price() / 10) - 5)) + 5;
			BookStoreBean bookStoreBean = new BookStoreBean(null, qaqQty, qaqPrice * 10, book, member, date);
			session.save(bookStoreBean);
		}
			

	}

}
