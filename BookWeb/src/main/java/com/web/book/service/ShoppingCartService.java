package com.web.book.service;

import java.util.List;

import com.web.book.model.ShoppingCartBean;

public interface ShoppingCartService {
	
		//新增一筆購物車資料
		void addToCart(Integer cart_Num, Integer cart_Price, Integer bk_ID, Integer bb_ID);

		//刪除一筆購物車資料
		void deleteCart(Integer cart_ID);

		//查詢所有購物車資料
		List<ShoppingCartBean> searchCart();

		//修改一筆購物車資料
		void updateCart(Integer cart_ID, Integer cart_Num);

}
