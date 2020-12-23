package com.web.book.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.book.dao.ShoppingCartDao;
import com.web.book.model.BookBean;
import com.web.book.model.MemberBean;
import com.web.book.model.ShoppingCartBean;

@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao {
	
	@Autowired
	SessionFactory factory;
	
	//新增一筆購物車資料
	@Override
	public void addToCart(Integer cart_Num, Integer cart_Price, Integer bk_ID, Integer bb_ID) {
		Session session = factory.getCurrentSession();
		MemberBean member = session.load(MemberBean.class, bb_ID);
		BookBean book = session.load(BookBean.class, bk_ID);
		ShoppingCartBean shoppingCart = new ShoppingCartBean(null, cart_Num, cart_Price, book, member);
		session.save(shoppingCart);
	}
	//刪除一筆購物車資料
	@Override
	public void deleteCart(Integer cart_ID) {
		Session session = factory.getCurrentSession();
		ShoppingCartBean shoppingCart = session.load(ShoppingCartBean.class, cart_ID);
		session.delete(shoppingCart);
	}
	//查詢所有購物車資料
	@Override
	@SuppressWarnings("unchecked")
	public List<ShoppingCartBean> searchCart(Integer bb_ID) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ShoppingCartBean a where a.member = :member";
		MemberBean member = session.load(MemberBean.class, bb_ID);
		List<ShoppingCartBean> list = session.createQuery(hql).setParameter("member", member).getResultList();
		return list;
	}
	//查詢是否有這筆購物車資料
//	public void checkCart(Integer bk_ID, Integer bb_ID) {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM ShoppingCartBean a where a.book = :book and a.member = :member";
//		BookBean book = session.get(BookBean.class, bk_ID);
//		MemberBean member = session.get(MemberBean.class, bb_ID);
//		session.createQuery(hql).setParameter("book", book).setParameter("member", member).getSingleResult();
//	}
	//修改一筆購物車資料
	@Override
	public void updateCart(Integer cart_ID, Integer cart_Num) {
		Session session = factory.getCurrentSession();
		ShoppingCartBean shoppingCart = session.load(ShoppingCartBean.class, cart_ID);
		shoppingCart.setCart_Num(cart_Num);
	}

}
