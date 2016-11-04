package com.zhzg.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhzg.dao.impl.DaoSupport;
import com.zhzg.util.PageData;
import com.zhzg.util.Tools;



@Service("dietCollectionsService")
public class DietCollectionsService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao; 
	
	/**
	 * pd内容为ReservationID和一个名为DietCollections的字符串(各个菜单逗号隔开)，对应数据表里多条记录
	 * */
	public void saveDietCollections(PageData pd) throws Exception{	
		dao.save("DietCollectionsMapper.saveDietCollections", pd);
	}
	
	
	public List findAllMenus() throws Exception{
		return (List)dao.findForList("MenusMapper.findAllMenus",new PageData());
	}
	
	public void saveDietResults(PageData pd) throws Exception{
		dao.save("DietCollectionsMapper.saveDietResult", pd);
	}
	
}
