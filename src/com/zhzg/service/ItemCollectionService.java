package com.zhzg.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhzg.dao.impl.DaoSupport;
import com.zhzg.util.PageData;

@Service("itemCollectionService")
public class ItemCollectionService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	public void saveItemCollection(PageData pd) throws Exception {
		String dateNow=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		pd.put("CreatedDate",dateNow);		
		// 创建者
		pd.put("CreatedBy", "szb");
		dao.save("ItemCollectionMapper.saveItemCollection", pd);
		
	}
	
	public void updateItemCollectionByReservationId(PageData pd) throws Exception{
		String dateNow=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		pd.put("ModifiedDate", dateNow);
		pd.put("ModifiedBy", "szb");
		dao.update("ItemCollectionMapper.updateItemCollectionByReservationId", pd);
	}
	
}
