package com.zhzg.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhzg.dao.impl.DaoSupport;
import com.zhzg.util.PageData;


@Service("commonService")
public class CommonService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List findAllOccupation(PageData pd)throws Exception{		
		return (List)dao.findForList("OccupationsMapper.findAllOccupation",pd);
	}

	public List findAllPostion(PageData pd) throws Exception {		
		return (List)dao.findForList("PositionsMapper.findAllPosition",pd);
	}
	
	public List findAllIndustry(PageData pd) throws Exception {		
		return (List)dao.findForList("IndustriesMapper.findAllIndustry",pd);
	}
}
