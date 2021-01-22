package com.web.book.service;

import java.util.Date;
import java.util.List;

import com.web.book.model.BookOrderBean;
import com.web.book.model.ShoppingCartBean;

public interface ShoppingCartService {
	
		//新增會員一筆購物車資料
		void addToCart(Integer cart_Num, Integer cart_Price, Integer bk_ID, Integer bb_ID, Integer bs_ID, Integer bks_ID);

		//刪除會員一筆購物車資料
		void deleteCart(Integer cart_ID);

		//查詢會員購物車資料
		List<ShoppingCartBean> searchCart(Integer bb_ID);

		//修改會員一筆購物車資料
		void updateCart(Integer cart_ID, Integer cart_Num);
		
		//更新一筆購物車資料
		void updateCartAll(Integer cart_Num, Integer bk_ID);
		
		//更新一筆賣場資料
		void updateBookStore(Integer bks_ID, Integer bs_Num);
		
		//新增一筆訂單
		void insertOrder(Date bo_Date, Integer bo_Total, String bo_Name, String bo_Add, Integer bo_Cel, Integer bb_ID, String bo_Status);

		//新增一筆訂單項目表
		void insertItem(Integer bo_ID, Integer bs_ID,Integer bk_ID, Integer oi_Qty, Integer oi_Price);
		
		//新增完成顯示訂單
		BookOrderBean searchOrder(Date bo_Date, Integer bb_ID);
		
		//成功產生訂單後刪除購物車資料
		void deleteAllCart(Integer bb_ID);

}
