package com.web.book.dao;

import java.util.List;

import com.web.book.model.ActBean;
import com.web.book.model.ActCollectBean;
import com.web.book.model.ActJoinBean;

public interface ActDao {
		
		//透過關鍵字查詢活動資料
		public List<ActBean> getAllActs(String act_Name);
		
		//經由活動名稱查詢單筆資料
		public ActBean getAct(String act_Name);
		
		//新增活動
		public void createAct(ActBean ab);

		//修改活動
		public void updateAct(ActBean ab);
		
		//刪除活動
		public void deleteAct(Integer Act_ID);

		//會員報名活動清單
		public List<ActJoinBean> getJoinRecords(String mb_ID);
		
		//報名活動
		public void joinAct(ActJoinBean ajb);
				
		//取消報名活動
		public void cancelJoinAct(String act_Name);
					
		//會員活動收藏清單
		List<ActCollectBean> getCollectRecords(String mb_ID);
		
		//收藏活動
		public void collectAct(ActCollectBean acb);
		
		//刪除收藏活動
		public void cancelCollectAct(String act_Name);
	
}
