package com.web.book.service;

import java.util.List;

import com.web.book.model.ShoppingCartBean;

public interface ShoppingCartService {
	
		//新增會員一筆購物車資料
		void addToCart(Integer cart_Num, Integer cart_Price, Integer bk_ID, Integer bb_ID);

		//刪除會員一筆購物車資料
		void deleteCart(Integer cart_ID);

		//查詢會員購物車資料
		List<ShoppingCartBean> searchCart(Integer bb_ID);

		//修改會員一筆購物車資料
		void updateCart(Integer cart_ID, Integer cart_Num);
		
		//更新一筆購物車資料
		void updateCartAll(Integer cart_Num, Integer bk_ID, Integer bb_ID);

}
