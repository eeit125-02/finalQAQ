package com.web.book.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.ShoppingCartDao;
import com.web.book.model.BookBean;
import com.web.book.model.BookStoreBean;
import com.web.book.model.MemberBean;
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

}
