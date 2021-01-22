package com.web.book.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.ShoppingCartDao;
import com.web.book.model.BookBean;
import com.web.book.model.BookOrderBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.MemberBean;
import com.web.book.model.OrderItemBean;
import com.web.book.model.ShoppingCartBean;

@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao {
	
	@Autowired
	SessionFactory factory;
	
	//新增一筆購物車資料
	@Override
	public void addToCart(Integer cart_Num, Integer cart_Price, Integer bk_ID, Integer bb_ID, Integer bs_ID, Integer bks_ID) {
		Session session = factory.getCurrentSession();
		BookBean book = session.get(BookBean.class, bk_ID);
		MemberBean member = session.get(MemberBean.class, bb_ID);
		MemberBean memberSel = session.get(MemberBean.class, bs_ID);
		ShoppingCartBean shoppingCart = new ShoppingCartBean(null, cart_Num, cart_Price, book, member, memberSel, bks_ID);
		session.save(shoppingCart);
	}
	//刪除一筆購物車資料
	@Override
	public void deleteCart(Integer cart_ID) {
		Session session = factory.getCurrentSession();
		ShoppingCartBean shoppingCart = session.get(ShoppingCartBean.class, cart_ID);
		session.delete(shoppingCart);
	}
	//查詢所有購物車資料
	@Override
	@SuppressWarnings("unchecked")
	public List<ShoppingCartBean> searchCart(Integer bb_ID) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ShoppingCartBean a where a.member = :member";
		MemberBean member = session.get(MemberBean.class, bb_ID);
		List<ShoppingCartBean> list = session.createQuery(hql).setParameter("member", member).getResultList();
		return list;
	}
	
	//修改一筆購物車資料
	@Override
	public void updateCart(Integer cart_ID, Integer cart_Num) {
		Session session = factory.getCurrentSession();
		ShoppingCartBean shoppingCart = session.load(ShoppingCartBean.class, cart_ID);
		shoppingCart.setCart_Num(cart_Num);
	}
	
	//更新一筆購物車資料
	@Override
	@SuppressWarnings("unchecked")
	public void updateCartAll(Integer cart_Num, Integer bk_ID) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ShoppingCartBean a SET a.cart_Num = :cart_Num WHERE bk_ID = :bk_ID";
		Query<ShoppingCartBean> query = session.createQuery(hql);
		query.setParameter("cart_Num", cart_Num);
		query.setParameter("bk_ID", bk_ID);
		query.executeUpdate();
	}
	
	//更新一筆賣場資料
	@Override
	public void updateBookStore(Integer bks_ID, Integer bs_Num) {
		Session session = factory.getCurrentSession();
		BookStoreBean bookStore = session.get(BookStoreBean.class, bks_ID);
		bookStore.setBs_Num(bs_Num);
	}
	//新增一筆訂單
	@Override
	public void insertOrder(Date bo_Date, Integer bo_Total, String bo_Name, String bo_Add, Integer bo_Cel, Integer bb_ID, String bo_Status) {
		Session session = factory.getCurrentSession();
		MemberBean member = session.get(MemberBean.class, bb_ID);
		BookOrderBean order = new BookOrderBean(null, bo_Date, bo_Total, bo_Name, bo_Add, bo_Cel, member, bo_Status);
		session.save(order);		
	}
	//新增一筆訂單項目表
	@Override
	public void insertItem(Integer bo_ID, Integer bs_ID,Integer bk_ID, Integer oi_Qty, Integer oi_Price) {
		Session session = factory.getCurrentSession();
		BookOrderBean order = session.get(BookOrderBean.class, bo_ID);
		MemberBean member = session.get(MemberBean.class, bs_ID);
		BookBean book = session.get(BookBean.class, bk_ID);
		OrderItemBean item = new OrderItemBean(null, order, member, book, oi_Qty, oi_Price);
		session.save(item);
	}
	
	//新增完成顯示訂單
	@Override
	@SuppressWarnings("unchecked")
	public BookOrderBean searchOrder(Date bo_Date, Integer bb_ID) {
		Session session = factory.getCurrentSession();
		String hql ="From BookOrderBean where bo_Date = :bo_Date and bb_ID = :bb_ID";
		Query<BookOrderBean> query = session.createQuery(hql);
		query.setParameter("bo_Date", bo_Date);
		query.setParameter("bb_ID", bb_ID);
		return query.getSingleResult();
	}
	
	//成功產生訂單後刪除購物車資料
	@Override
	@SuppressWarnings("unchecked")
	public void deleteAllCart(Integer bb_ID) {
		Session session = factory.getCurrentSession();
		String hql = "delete From ShoppingCartBean a where bb_ID = :bb_ID";
		Query<ShoppingCartBean> query = session.createQuery(hql);
		query.setParameter("bb_ID", bb_ID);
		query.executeUpdate();
	}

}
