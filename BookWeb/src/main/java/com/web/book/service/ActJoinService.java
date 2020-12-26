package com.web.book.service;

import java.util.List;

import com.web.book.model.ActJoinBean;

public interface ActJoinService {	

	        //查詢所有參加資料
			List<ActJoinBean> getAllJoins();
			
//			//查詢參加活動關鍵字
//			List<ActJoinBean> searchJoinKeyword(String keyword);
			
			//經由參加活動ID查詢單筆資料
			ActJoinBean getActJoin(Integer join_ID);
			
			//新增活動
			int createActJoin(ActJoinBean ajb);

			//修改活動
			int updateActJoin(ActJoinBean ajb);
			
			//刪除活動
			int deleteActJoin(Integer join_ID);

	

//			//會員報名活動清單
//			List<ActJoinBean> getJoinRecords(Integer mb_ID);
//			
//			//報名活動
//			void createActReg(Integer act_ID, Integer mb_ID);
//					
//			//取消報名活動
//			void cancelJoinAct(Integer join_ID);
//						
//			//修改報名資料
//			ActJoinBean updateJoinAct(Integer mb_ID);
//			
			

}
