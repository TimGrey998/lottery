package com.lottery.biz.impl;

import java.util.List;

import com.lottery.biz.WiningBiz;
import com.lottery.dao.WiningListDao;
import com.lottery.dao.impl.WiningListDaoImpl;
import com.lottery.entity.Wining;

public class WiningBizImpl implements WiningBiz {
	WiningListDao dao = new WiningListDaoImpl();
	
	@Override
	public void insertWining(Wining wining) {
		// TODO Auto-generated method stub
		dao.insertWining(wining);
	}

	@Override
	public List<Wining> getWiningList() {
		// TODO Auto-generated method stub
		return dao.getWining();
	}

}
