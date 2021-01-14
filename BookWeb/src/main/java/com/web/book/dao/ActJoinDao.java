package com.web.book.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.web.book.model.ActJoinBean;

public interface ActJoinDao {

	 //查詢所有參加資料
	List<ActJoinBean> getAllJoins();
	
//	//查詢參加活動關鍵字
//	List<ActJoinBean> searchJoinKeyword(String keyword);
	
	//經由報名ID取得單一報名資料
	ActJoinBean getActJoin(Integer join_ID);

	//經由會員ID取得會員報名紀錄
	List<ActJoinBean> getJoinRecords(Integer mb_ID);
	
	//新增活動
	int createActJoin(ActJoinBean ajb);

	//修改活動
	int updateActJoin(ActJoinBean ajb);
	
	//刪除活動
	int deleteActJoin(Integer join_ID);

	public boolean check(Integer mb_ID,Integer act_ID);

}
