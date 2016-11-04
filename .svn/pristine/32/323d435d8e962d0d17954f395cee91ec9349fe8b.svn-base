package com.zhzg.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.zhzg.dao.impl.DaoSupport;
import com.zhzg.entity.Page;
import com.zhzg.entity.system.QuestionnaireCollections;
import com.zhzg.entity.system.Visitors;
import com.zhzg.interceptor.Token;
import com.zhzg.util.PageData;
import com.zhzg.util.ReservationUtil;
import com.zhzg.util.Tools;

/**
 * 类名称：OriginalityService 创建人：ZZC 创建时间：2016年6月15日
 * 
 * @version
 */
@Service("originalityService")
public class OriginalityService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	//======================================================================================
	/**
	* 保存创意
	*/
	
	public void saveOriginality(PageData pd)throws Exception{
		// 创建时间
		pd.put("CreatedDate",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		dao.save("OriginalityMapper.saveOriginality", pd);
		
	}
	/**
	* 保存意见
	*/
	
	public void saveAdvice(PageData pd)throws Exception{
		// 创建时间
		pd.put("CreatedDate",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		dao.save("OriginalityMapper.saveAdvice", pd);
		
	}
	
}
