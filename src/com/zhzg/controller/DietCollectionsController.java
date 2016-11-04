package com.zhzg.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zhzg.controller.base.BaseController;
import com.zhzg.interceptor.Token;
import com.zhzg.service.DietCollectionsService;
import com.zhzg.service.QuestionsService;
import com.zhzg.service.VisitorsService;
import com.zhzg.util.PageData;
import com.zhzg.util.Tools;

@Controller
@RequestMapping("/diet")
public class DietCollectionsController extends BaseController {
	
	@Resource(name="dietCollectionsService")
	private DietCollectionsService dietCollectionsService;
	@Resource(name="questionsService")
	private QuestionsService questionsService;
	@Resource(name="visitorsService")
	private VisitorsService visitorsService;
	
	
	
	
	
	
	@RequestMapping("/saveDC")
	//@Token(remove=true)
	public ModelAndView saveDietCollections(HttpServletRequest request,HttpServletResponse response,RedirectAttributes attr){
		PageData pd=getPageData();		
		if(pd==null||pd.size()<=0){
			attr.addFlashAttribute("msg", "页面数据为空，请重试");
			ModelAndView mv = new ModelAndView("redirect:/visitors/error");
			return mv;
		}
		String reservationId=request.getParameter("ReservationID");
		//在馆信息不存在
		if(Tools.isEmpty(reservationId)){
			attr.addFlashAttribute("msg", "未查询到您的在馆信息，请重新放置智慧球后重试");
			ModelAndView mv = new ModelAndView("redirect:/visitors/error");
			return mv;
		}
		pd.put("ReservationID", reservationId);
		//在馆信息不为空，检验menuID，校验页面数据，选择的菜单不能为空
		if(Tools.isEmpty(pd.getString("MenuID"))){
			request.getSession(false).setAttribute("token", UUID.randomUUID().toString());
			request.setAttribute("error", "您所选择的菜单为空，请返回重新选择");
			return new ModelAndView("/system/dietcollection/diet","pd",pd);
		}
		//页面数据合法，保存访客选择的菜单
		try {
			pd.put("CreatedBy", "szb");
			pd.put("CreatedDate", Tools.date2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
			pd.put("ModifiedBy", "szb");
			pd.put("ModifiedDate", Tools.date2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
			pd.put("Result", pd.getString("MenuID"));
			dietCollectionsService.saveDietCollections(pd);		
			dietCollectionsService.saveDietResults(pd);
			//attr.addFlashAttribute("source", "嘉宾饮食数据保存");			
			ModelAndView mv = success(pd.getString("MenuID"));			
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			attr.addFlashAttribute("msg", "保存数据出现问题，请返回重试");
			ModelAndView mv = new ModelAndView("redirect:/visitors/error");
			return mv;
		}
		
		
	}
	
	@RequestMapping("/findAllMenus")
	//@Token(save=true)
	public ModelAndView findAllMenus(){
		PageData pd=getPageData();
		try {
			List list=dietCollectionsService.findAllMenus();
			ModelAndView mv=new ModelAndView("/system/dietcollection/diet","pd",list);			
			return mv;
		} catch (Exception e) {			
			e.printStackTrace();
			return new ModelAndView("/system/dietcollection/diet","pd","error");
		}
		
	}
	
	@RequestMapping("/diet")
	public ModelAndView toDiet(HttpServletRequest request,HttpServletResponse response,RedirectAttributes attr){
		PageData pd=getPageData();
		String smartBallID=request.getParameter("SmartBallID");
		pd.put("SmartBallID", smartBallID);//从url中获取SmartBallID放入pd
		Integer reservationID=null;
		try {
			reservationID=questionsService.ReservationIdBySmartId(pd);//根据smartBallID获取reservationID
			
			if(Tools.isEmpty(String.valueOf(reservationID))){
				attr.addFlashAttribute("msg", "未查询到您的在馆信息，并重新放置智慧球后重试");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}
			pd.put("ReservationID", reservationID);//预约号放入页面隐藏域
			String name=visitorsService.findByReservationID(pd).getString("Name");
			pd.put("Name", name);
			
		} catch (Exception e) {
			attr.addFlashAttribute("msg", "查询在馆信息发生异常，并重新放置智慧球后重试");
			ModelAndView mv = new ModelAndView("redirect:/visitors/error");
			return mv;
		}
		//查到在馆信息，进入相应的页面，进入中餐或西餐页面
		pd.put("ReservationID", reservationID);//预约号放入页面隐藏域			
		return new ModelAndView("/system/dietcollection/diet","pd",pd);		
	}
	
	@RequestMapping("/dietChinese")
	public ModelAndView toDietChineseSelect(HttpServletRequest request,HttpServletResponse response,RedirectAttributes attr){
		PageData pd=getPageData();
		String dietSelect=request.getParameter("dietSelect");	
		String reservationId=request.getParameter("ReservationID");
		pd.put("DietSelect", dietSelect);
		pd.put("ReservationID", reservationId);
		if("1".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietChinese1");
		}else if("2".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietChinese2");
		}else if("3".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietChinese3");
		}else{//没有该参数，则返回中餐页面
			return new ModelAndView("/system/dietcollection/dietChinese","pd",pd);
		}
	}
	@RequestMapping("/dietWestern")
	public ModelAndView toDietWesternSelect(HttpServletRequest request){
		PageData pd=getPageData();
		String dietSelect=request.getParameter("dietSelect");	
		String reservationId=request.getParameter("ReservationID");
		pd.put("DietSelect", dietSelect);
		pd.put("ReservationID", reservationId);
		if("1".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietWestern1");
		}else if("2".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietWestern2");
		}else{//没有该参数，则返回西餐页面
			return new ModelAndView("/system/dietcollection/dietWestern","pd",pd);
		}		
	}
	
	
	@RequestMapping("/success")
	public ModelAndView success(String dietSelect){
		if("1".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietChinese1");
		}else if("2".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietChinese2");
		}else if("3".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietChinese3");
		}else if("4".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietWestern1");
		}else if("5".equals(dietSelect)){
			return new ModelAndView("/system/dietcollection/dietWestern2");
		}else{
			return null;
		}
	}
	
	
	

}
