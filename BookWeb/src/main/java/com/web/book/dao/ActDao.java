package com.web.book.dao;

import java.util.List;

import com.web.book.model.ActBean;

public interface ActDao {

	// 查詢所有活動紀錄
	List<ActBean> getAllActs();

	//查詢活動關鍵字
	List<ActBean> searchKeyword(String keyword);

	// 經由活動ID查詢單筆資料
	ActBean getAct(Integer act_ID);

	// 新增活動
	int createAct(ActBean actbean);

	// 修改活動
	int updateAct(ActBean ab);

	// 刪除活動
	int deleteAct(Integer act_ID);

	

//	// 會員的報名活動清單
//	List<ActJoinBean> getJoinRecords(Integer mb_ID);
//
//	// 報名活動
//	void createActReg(Integer act_ID, Integer mb_ID);
//
//	// 取消報名活動
//	void cancelJoinAct(Integer join_ID);
//
//	// 修改報名資料
//	ActJoinBean updateJoinAct(Integer mb_ID);

}
