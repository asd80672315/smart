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
 * 类名称：QuestionsService 创建人：ZZC 创建时间：2016年6月15日
 * 
 * @version
 */
@Service("questionsService")
public class QuestionsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	//======================================================================================
	
	/**
	* 获取问卷数据
	*/
	
	public List findQuestions(PageData pd)throws Exception{
		PageData questions = new PageData();
		//查询问卷信息
		List list =  (List)dao.findForList("QuestionsMapper.findQuestions", pd);;
		try {
			//获取问卷编号
			questions = (PageData) list.get(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		pd.put("QuestionnaireID", questions.get("QuestionnaireID"));
		//问卷编号关联访客预约号
		dao.update("QuestionsMapper.relationQuestions", pd);
		return list;
	}
	/**
	* 获取问卷回答数据
	*/
	public List findQuestionsColl(PageData pd)throws Exception{
		PageData questions = new PageData();
		//查询问卷信息
		List list =  (List)dao.findForList("QuestionsMapper.findQuestionsColl", pd);;
		return list;
	}
	/**
	* 根据智慧球获取访客预约号
	*/
	public Integer ReservationIdBySmartId(PageData pd)throws Exception{
		Integer ReservationId =  (Integer) dao.findForObject("VisitorsMapper.findReservationIdBySmartId", pd);	
		return ReservationId;
	}
	/**
	* 保存用户问卷答案
	*/
	
	public void saveQuestions(String pd)throws Exception{
		JSONArray jsonarray = JSONArray.fromObject(pd);  
		//json转换成list
        List<PageData> plist = jsonarray.toList(jsonarray, PageData.class);
        //dao.batchSave("QuestionsMapper.saveQuestions", plist);//vertica不支持批量更新数据，改成单条批量插入
        for(PageData pd1:plist){
        	dao.save("QuestionsMapper.saveQuestions", pd1);
        }
	}

	
}
