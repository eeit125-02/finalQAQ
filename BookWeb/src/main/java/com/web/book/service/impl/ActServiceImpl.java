package com.web.book.service.impl;

import java.util.List;

import com.web.book.model.ActBean;
import com.web.book.model.ActCollectBean;
import com.web.book.model.ActJoinBean;
import com.web.book.service.ActService;

public class ActServiceImpl implements ActService {

	@Override
	public List<ActBean> getAllActs(String act_Name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActBean getAct(String act_Name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createAct(ActBean ab) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAct(ActBean ab) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAct(Integer Act_ID) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ActJoinBean> getJoinRecords(String mb_ID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void joinAct(ActJoinBean ajb) {
		// TODO Auto-generated method stub

	}

	@Override
	public void cancelJoinAct(String act_Name) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ActCollectBean> getCollectRecords(String mb_ID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void collectAct(ActCollectBean acb) {
		// TODO Auto-generated method stub

	}

	@Override
	public void cancelCollectAct(String act_Name) {
		// TODO Auto-generated method stub

	}

}
