package com.web.book.dao;

import java.util.List;

import com.web.book.model.ActBean;
import com.web.book.model.ActJoinBean;

public interface ActDao {

	// 查詢所有活動紀錄
	List<ActBean> getAllActs();

	// 經由活動名稱查詢單筆資料
	ActBean getAct(String act_Name);

	// 新增活動
	void createAct(ActBean actbean);

	// 修改活動
	ActBean updateAct(ActBean actbean);

	// 刪除活動
	void deleteAct(Integer Act_ID);

	// 會員的報名活動清單
	List<ActJoinBean> getJoinRecords(Integer mb_ID);

	// 報名活動
	void createActReg(Integer act_ID, Integer mb_ID);

	// 取消報名活動
	void cancelJoinAct(Integer join_ID);

	// 修改報名資料
	ActJoinBean updateJoinAct(Integer mb_ID);

}
