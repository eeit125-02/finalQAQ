package com.web.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.book.dao.ShoppingCartDao;
import com.web.book.model.ShoppingCartBean;
import com.web.book.service.ShoppingCartService;

@Transactional
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	@Autowired
	ShoppingCartDao dao;

	@Override
	public void addToCart(Integer cart_Num, Integer cart_Price, Integer bk_ID, Integer bb_ID) {
		dao.addToCart(cart_Num, cart_Price, bk_ID, bb_ID);
	}

	@Override
	public void deleteCart(Integer cart_ID) {
		dao.deleteCart(cart_ID);
	}

	@Override
	public List<ShoppingCartBean> searchCart(Integer bb_ID) {
		return dao.searchCart(bb_ID);
	}

	@Override
	public void updateCart(Integer cart_ID, Integer cart_Num) {
		dao.updateCart(cart_ID, cart_Num);
	}

}
