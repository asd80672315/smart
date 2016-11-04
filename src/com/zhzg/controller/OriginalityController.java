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
import javax.servlet.http.HttpSession;

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
import com.zhzg.service.OriginalityService;
import com.zhzg.service.QuestionsService;
import com.zhzg.service.ReservationService;
import com.zhzg.service.VisitorsService;
import com.zhzg.util.PageData;
import com.zhzg.util.ReservationUtil;
import com.zhzg.util.Tools;

/**
 * 类名称：OriginalityController 创建人：ZZC 创建时间：2016年6月15日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/originality")
public class OriginalityController extends BaseController {
	//service bean
	@Resource(name = "originalityService")
	private OriginalityService originalityService;
	@Resource(name = "questionsService")
	private QuestionsService questionsService;
	@Autowired  
	private  HttpServletRequest request;  
	
	/**
	 * 保存个人创意
	 */
	@Token(remove = true)
	@RequestMapping(value="/saveoriginality_person") 
	public ModelAndView saveOriginality_person()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData(); 
		HttpSession session = request.getSession();
		String smartBallID = (String) session.getAttribute("smartBallID");
		pd = this.getPageData();
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
				
				
				//个人合作方式
				pd.put("Manner", 1);
				
				//保存用户创意
				originalityService.saveOriginality(pd);	
				//返回页面
				mv.addObject("pd", pd); 
				mv.addObject("msg", "提交成功  我们会尽快与您联系");
				mv.setViewName("system/questionnaire/OriginalityCollections_success");
			}	
		}
		
		return mv;
	}
	
	/**
	 * 保存公司创意
	 */
	@Token(remove = true)
	@RequestMapping(value="/saveoriginality_company") 
	public ModelAndView saveOriginality_company()throws Exception{
		ModelAndView mv = this.getModelAndView();
		HttpSession session = request.getSession();
		String smartBallID = (String) session.getAttribute("smartBallID");
		PageData pd = new PageData(); 
		pd = this.getPageData();
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
				//公司合作方式
				pd.put("Manner", 2);
				
				//保存用户创意
				originalityService.saveOriginality(pd);	
				//返回页面
				mv.addObject("pd", pd); 
				mv.addObject("msg", "提交成功  我们会尽快与您联系");
				mv.setViewName("system/questionnaire/OriginalityCollections_success");
			
			}
		}
		
		return mv;
	}
	/**
	 * 保存用户意见
	 */
	@Token(remove = true)
	@RequestMapping(value="/saveadvice") 
	public ModelAndView saveAdvice()throws Exception{
		ModelAndView mv = this.getModelAndView();
		HttpSession session = request.getSession();
		String smartBallID = (String) session.getAttribute("smartBallID");
		PageData pd = new PageData(); 
		pd = this.getPageData();
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
				//保存用户意见
				originalityService.saveAdvice(pd);	
				//返回页面
				mv.addObject("pd", pd); 
				mv.addObject("msg", "提交成功，感谢！");
				mv.setViewName("system/questionnaire/OriginalityCollections_success");
			
			}
		}
		
		return mv;
	}
	/**
	 * 跳转意见
	 */
	@Token(save = true)
	@RequestMapping(value="/gosuggestion") 
	public ModelAndView gosuggestion()throws Exception{
		ModelAndView mv = this.getModelAndView();
		String smartBallID = request.getParameter("SmartBallID");
		HttpSession session = request.getSession();
		session.setAttribute("smartBallID", smartBallID);
		if (Tools.isEmpty(smartBallID)) {
			mv.addObject("msg", "智慧球ID未识别，请重新放置智慧球");
			mv.setViewName("system/questionnaire/OriginalityCollections_success");
		
		}else{
			mv.setViewName("system/questionnaire/suggestion");
		}	
		return mv;
	}
	/**
	 * 跳转创意
	 */
	@Token(save = true)
	@RequestMapping(value="/gooriginality") 
	public ModelAndView gooriginality()throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		String smartBallID = request.getParameter("SmartBallID");
		HttpSession session = request.getSession();
		session.setAttribute("smartBallID", smartBallID);
		// 判断pd是否为空，为空则返回错
		// 并且智慧球ID不能为空
		if (Tools.isEmpty(smartBallID)) {
			mv.addObject("msg", "智慧球ID未识别，请重新放置智慧球");
			mv.setViewName("system/questionnaire/OriginalityCollections_success");
		
		}else{
			mv.setViewName("system/questionnaire/OriginalityCollections");
			
		}
		return mv;
	}
	
	/**
	 * 跳转个人加入
	 */
	@Token(save = true)
	@RequestMapping(value="/gooriginality_person")
	public ModelAndView gooriginality_person()throws Exception{
		ModelAndView mv = this.getModelAndView();
		HttpSession session = request.getSession();
		String smartBallID = (String) session.getAttribute("smartBallID");
		// 判断pd是否为空，为空则返回错
		// 并且智慧球ID不能为空
		if (Tools.isEmpty(smartBallID)) {
			mv.addObject("msg", "智慧球ID未识别，请重新放置智慧球");
			mv.setViewName("system/questionnaire/OriginalityCollections_success");
		
		}else{
			mv.setViewName("system/questionnaire/OriginalityPerson");
		}
		return mv;
	}
	
	/**
	 * 跳转公司合作
	 */
	@Token(save = true)
	@RequestMapping(value="/gooriginality_company")
	public ModelAndView gooriginality_company()throws Exception{
		ModelAndView mv = this.getModelAndView();
		// 判断pd是否为空，为空则返回错
		// 并且智慧球ID不能为空
		HttpSession session = request.getSession();
		String smartBallID = (String) session.getAttribute("smartBallID");
		if (Tools.isEmpty(smartBallID)) {
			mv.addObject("msg", "智慧球ID未识别，请重新放置智慧球");
			mv.setViewName("system/questionnaire/OriginalityCollections_success");
		
		}else{
			mv.setViewName("system/questionnaire/OriginalityCompany");
		}
		return mv;
	}

}
