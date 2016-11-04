package com.zhzg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.zhzg.controller.base.BaseController;
import com.zhzg.interceptor.Token;
import com.zhzg.service.QuestionsService;
import com.zhzg.service.ReservationService;
import com.zhzg.service.VisitorsService;
import com.zhzg.util.PageData;
import com.zhzg.util.ReservationUtil;
import com.zhzg.util.Tools;

/**
 * 类名称：QuestionsController 创建人：ZZC 创建时间：2016年6月15日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/questions")
@SessionAttributes("sessionKey")
public class QuestionsController extends BaseController {
	//service bean
	@Resource(name = "questionsService")
	private QuestionsService questionsService;
	@Autowired  
	private  HttpServletRequest request;  
	
	private ModelMap model;
	/**
	 * 查询问卷信息并关联访客预约号
	 */
	@RequestMapping(value="/findquestions") 
	@Token(save = true)
	public ModelAndView findQuestions()throws Exception{
		ModelAndView mv = this.getModelAndView();
		String smartBallID = request.getParameter("SmartBallID");
		//model.addAttribute("sessionKey", smartBallID);
		PageData pd = new PageData(); 
		//获取智慧球ID
		// 判断pd是否为空，为空则返回错
		// 并且智慧球ID不能为空
		if (pd == null || Tools.isEmpty(smartBallID)) {
			mv.addObject("msg", "智慧球ID未识别，请重新放置智慧球");
			mv.setViewName("system/questionnaire/OriginalityCollections_success");
		}else{
			pd.put("SmartBallID", smartBallID);
			//根据智慧球ID 获取访客预约号
			Integer reservationID = questionsService.ReservationIdBySmartId(pd);
			if(Tools.isEmpty((reservationID+""))){
				mv.addObject("msg", "未查询到预约信息！");
				mv.setViewName("system/questionnaire/OriginalityCollections_success");
			
			}else{
				pd.put("ReservationID", reservationID);
				
				//判断此访客是否做过问卷调查了
				List listAnswer = questionsService.findQuestionsColl(pd);
				if(listAnswer.size()>0){
					//已经做过问卷调查了,返回到初始状态
					mv.addObject("msg", "您已经做过问卷调查了！");
					mv.setViewName("system/questionnaire/OriginalityCollections_success");
				}else{
					//获取问题信息并且关联对应的人员
					List list = new ArrayList<PageData>();
					list = questionsService.findQuestions(pd);
					//返回页面
					mv.addObject("questions", list);
					mv.addObject("pd", pd); 
					mv.setViewName("system/questionnaire/questionnaire");
				}
			}
			
		}
		
		return mv;
	}
	/**
	 * 保存用户答案
	 */
	@Token(remove = true)
	@RequestMapping(value="/savequestions") 
	public ModelAndView saveQuestions()throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = new PageData(); 
		pd = this.getPageData();
		//判断此访客是否做过问卷调查了
		List listAnswer = questionsService.findQuestionsColl(pd);
		if(listAnswer.size()>0){
			//已经做过问卷调查了,返回到初始状态
			mv.addObject("msg", "您已经做过问卷调查了！");
			mv.setViewName("system/questionnaire/OriginalityCollections_success");
		}else{
			String json = pd.getString("questionOption");
			//保存用户答案
			questionsService.saveQuestions(json);
			
			//返回页面
			mv.addObject("pd", pd); 
			mv.addObject("msg", "问卷提交成功，感谢！");
			mv.setViewName("system/questionnaire/OriginalityCollections_success");
		}	
		return mv;
	}
}
