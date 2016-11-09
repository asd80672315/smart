package com.zhzg.controller;


import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zhzg.controller.base.BaseController;
import com.zhzg.entity.system.IDInfo;
import com.zhzg.interceptor.Token;
import com.zhzg.service.ReservationService;
import com.zhzg.service.VisitorsService;
import com.zhzg.util.PageData;
import com.zhzg.util.Tools;
import com.zhzg.util.VisitorUtil;
import com.zhzg.util.smartball.SmartBallUtils;

import java.util.List;
/**
 * 类名称：VisitorsController 创建人：ZZC 创建时间：2016年6月15日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/visitors")
public class VisitorsController extends BaseController {
	// service bean
	@Resource(name = "visitorsService")
	private VisitorsService visitorsService;
	@Resource(name = "ReservationService")
	private ReservationService reservationService;

	/**
	 * 保存访客信息
	 */
	@RequestMapping(value = "/saveVisitor")
	@Token(remove = true)
	public ModelAndView saveReservation() throws Exception {
		ModelAndView mv = this.getModelAndView();
		// 获取页面数据
		PageData pd = new PageData();
		pd = this.getPageData();
		// 保存数据
		visitorsService.saveVisitor(pd);
		// 返回页面
		mv.setViewName("system/receptionist/receptionistsuccess");
		String msg = "访客登记成功！";
		mv.addObject("msg", msg);
		mv.addObject("pd",pd);
		return mv;
	}

	// 保存团体访客信息
	@RequestMapping(value = "/saveVisitors")
	@Token(remove = true)
	public ModelAndView saveReservations() throws Exception {
		ModelAndView mv = this.getModelAndView();
		// 获取页面数据
		PageData pd = new PageData();
		pd = this.getPageData();

		// 保存数据
		visitorsService.saveVisitors(pd);
		// 返回页面
		mv.setViewName("system/receptionist/receptionistsuccess");
		mv.addObject("pd",pd);
		return mv;
	}

	// 根据预约编号查询预约信息
	/*@RequestMapping(value = "/findVisitors")
	public ModelAndView findVisitors() throws Exception {
		ModelAndView mv = this.getModelAndView();
		// 获取页面数据
		PageData pd = new PageData();
		pd = this.getPageData();
		// 查询验证是否办理过了登记
		PageData visitor = visitorsService.findByReservationID(pd);
		// 未办理过业务
		if (visitor == null || ("").equals(visitor)) {
			// 查询数据
			pd = reservationService.findByReservationID(pd);
			// 没有查询到数据
			if (pd == null || ("").equals(visitor)) {
				String msg = "没有查询到预约号信息，请重新输入！";
				// 返回页面显示
				mv.setViewName("system/receptionist/receptionist");
				mv.addObject("msg", msg);
			} else {
				// 返回页面显示
				mv.setViewName("system/receptionist/receptionist");
				mv.addObject("pd", pd);
			}
		} else {
			String msg = "该预约号已经办理过访客登记业务，请重新输入！";
			// 返回页面显示
			mv.setViewName("system/receptionist/receptionist");
			mv.addObject("msg", msg);
		}

		return mv;
	}*/
	
	// 根据电话号码和姓名查询预约信息
		@RequestMapping(value = "/findVisitors")
		public ModelAndView findVisitors() throws Exception {
			ModelAndView mv = this.getModelAndView();
			// 获取页面数据
			PageData pd = new PageData();
			pd = this.getPageData();
			pd.put("Phone", pd.getString("ReservationID"));
			pd.put("Name", pd.getString("ReservationID"));
			// 查询验证是否办理过了登记
			List visitor = visitorsService.findByTel(pd);
				// 没有查询到数据
			if (visitor == null || ("").equals(visitor)) {
				String msg = "没有查询到信息，请重新输入！";
				// 返回页面显示
				mv.setViewName("system/receptionist/query_list");
				mv.addObject("msg", msg);
			} else {
				// 返回页面显示
				mv.setViewName("system/receptionist/query_list");
				mv.addObject("pd", visitor);
			}
			

			return mv;
		}

	// 跳转到前台
	@RequestMapping(value = "/govisitors")
	@Token(save = true)
	public ModelAndView visitor() throws Exception {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/receptionist/query_list");
		return mv;
	}

	// 跳转到原始的取球模块，即弹出模态框页面
	@RequestMapping("/ballstartup")
	public ModelAndView ball() {
		return new ModelAndView("/system/receptionist/ballStartUp");
	}

	// 处理摸态框请求，返回取球模块页面
	@RequestMapping("/findvisitor")
	@Token(save = true)
	public ModelAndView findVisitor(HttpServletRequest request,	RedirectAttributes attr) {
		PageData pd = this.getPageData();//获取页面数据
		String url = pd.getString("url");//获取当前页面url
		String reservationId = pd.getString("ReservationID");//获取用户输入的预约号
		if (Tools.isEmpty(reservationId)) {//预约号为空，给出提示
			ModelAndView mv = new ModelAndView(url,"reservationiderror","预约号码为空，请输入预约号码");
			return mv;
		}else if (!reservationId.matches("\\d+")) {//预约号非法，给出提示
			ModelAndView mv = new ModelAndView(url,"reservationiderror","预约号码非法，请输入正确的预约号码");
			return mv;
		}
		try {
			VisitorUtil visitorUtil=new VisitorUtil();
			if(visitorUtil.isVIP(pd)){//判断是否vip，如果是vip则构造vip访客数据
				//首先生成vip数据，然后向数据库中插入一条vip访客数据
				pd=visitorUtil.generateVIPData(pd);
				//保存vip数据
				visitorsService.saveVIPVisitor(pd);
				//查找刚刚插入的vip访客id
				Integer visitorId=visitorsService.findMaxVisitorId(pd);
				//访客id放入页面数据
				pd.put("VisitorID", visitorId);
				return new ModelAndView("/system/receptionist/ball","pd",pd);
			}else{
				pd = visitorsService.findByReservationID(pd);
				if(pd==null){
					ModelAndView mv = new ModelAndView(url,"reservationiderror","预约号码非法，请输入正确的预约号码，请到前台咨询");
					mv.addObject("reservationid",reservationId);
					return mv;
				}
				reservationId = String.valueOf(pd.get("ReservationID"));
				String state = pd.getString("State");
				String smartballId=pd.getString("SmartBallID");
				if (!"1".equals(state)) {
					String msg = "";
					if ("2".equals(state)&&Tools.notEmpty(smartballId)) {
						msg = "您当前状态已经是在馆，请不要重复取智慧球，如有疑问请咨询前台";
					} else if ("3".equals(state)) {
						msg = "您当前已经离馆，请不要重复取智慧球，如有疑问请咨询前台";
					} else {
						msg = "您当前状态不满足取智慧球条件，请到前台咨询";
					}
					
					ModelAndView mv = new ModelAndView(url,"msg",msg);
					mv.addObject("reservationid",reservationId);
					return mv;
				}
				return new ModelAndView("/system/receptionist/ball","pd",pd);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mv = new ModelAndView(url,"msg", "数据查询出现问题，请重试。");
			mv.addObject("reservationid",reservationId);
			return mv;
		}
	}

	@RequestMapping("/updatevisitor")
	@Token(remove = true)
	public ModelAndView updateVisitor(HttpServletRequest request,
			RedirectAttributes attr) {
		PageData pd = this.getPageData();
		// 首先校验数据，如果数据不合法，则返回相应的信息
		if(pd==null){
			attr.addFlashAttribute("msg", "页面数据为空，请重试");
			ModelAndView mv = new ModelAndView("redirect:/visitors/error");
			return mv;
		}
		
		VisitorUtil visitorUtil = new VisitorUtil();// 预约工具类
		boolean isPdOK = visitorUtil.validate(pd);// 校验页面数据是否合法
		Map error = visitorUtil.getError();// 获取页面数据错误
		request.setAttribute("error", error);// 页面数据错误添加到request
		String url=pd.getString("url");
		if (!isPdOK) {// 页面数据不合法，则返回响应的错误页面或消息
			if (error.get("init") != null) {// 如果配置文件读取错误，则提示
				attr.addFlashAttribute("msg", error.get("init")+"，请返回重试");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}

			if (error.get("type") != null) {// 访客类型错误提示，提示嘉宾类型不合法，请重新进入主页输入预约号码
				attr.addFlashAttribute("msg", error.get("type")+"，请返回重试<br><a href='"+url+"'>取球页面</a>");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}

			if (error.get("state") != null) {// 到馆状态错误提示
				attr.addFlashAttribute("msg", error.get("state")+"，请返回重试<br><a href='"+url+"'>取球页面</a>");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}

			attr.addFlashAttribute("pd", pd);
			attr.addFlashAttribute("error", error);
			ModelAndView mv = new ModelAndView(
					"redirect:/visitors/reSubmitInfo");
			return mv;
		}
		
		try {
			// TODO:弹球，获取SmartBallID
			//String smartballId="simulate"+new Random().nextInt(100);			
			String deviceID=SmartBallUtils.getDeviceID(request.getRemoteAddr());
			if(deviceID==null){//客户机ip地址列表的配置文件读取错误，查看config。properties
				attr.addFlashAttribute("msg", "设备IP读取错误，请联系管理人员");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}
			//配置文件没有问题，获取小球ID
			String[] smartballInfo=null;
			try {
				smartballInfo=SmartBallUtils.getSmartBallID(deviceID);
			} catch (Exception e) {//与小球通信异常，如超时等问题
				attr.addFlashAttribute("msg", "与智慧球模块通信出现问题，请联系管理人员");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}			
			if(smartballInfo==null){//没有收到小球接口返回的信息，这时需要检查小球接口是否可用
				attr.addFlashAttribute("msg", "与智慧球模块通信完成，但未获取到智慧球信息，请联系管理人员");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}
			//与小球通信成功，如果代码为1才处理，否则提示错误
			if(!"1".equals(smartballInfo[0].trim())){//小球模块返回状态吗不为1，则代表有错误
				attr.addFlashAttribute("msg", "小球弹出失败，请联系管理员");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}
			//小球获取成功，更新数据
			String smartballId=smartballInfo[1];
			if("0".equals(smartballId.trim())){//如果球号为0，则返回错误信息
				attr.addFlashAttribute("msg", "小球号码异常，请联系管理员");
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}
			pd.put("SmartBallID", smartballId);
			visitorsService.updateVisitorByID(pd);
			attr.addFlashAttribute("source", "嘉宾数据修改");
			attr.addFlashAttribute("link", url);
			ModelAndView mv = new ModelAndView("redirect:/visitors/success");			
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			attr.addFlashAttribute("msg", "数据修改出现问题，请返回重试<br><a href='"+url+"'>取球页面</a>");
			ModelAndView mv = new ModelAndView("redirect:/visitors/error");
			return mv;
		}
	}
	
	@RequestMapping("/collectSmartBall")
	@Token(remove=true)
	public ModelAndView updateVisitorState(RedirectAttributes attr){
		PageData pd=getPageData();
		if(pd==null||pd.size()<=0){
			attr.addFlashAttribute("msg", "智慧球回收完毕，但很抱歉，没有读取到智慧球数据，无法为您生成未来身份证");
			ModelAndView mv = new ModelAndView("redirect:/visitors/error");
			return mv;
		}
		
		//TODO:校验数据是否合法
		
		//数据合法，调用service执行智慧球收集后的访客状态修改
		String url=pd.getString("url");
		try {
			//生成未来身份证信息
			List<PageData> infoList=visitorsService.findIDInformation(pd);			
			//更新访客状态并跳转到未来身份证页面
			if(infoList==null||infoList.size()<=0){//如果没查询到访客信息，则返回错误页面
				attr.addFlashAttribute("msg", "对不起，没有查询到您的身份信息，或者您没有参与互动项目，无法为您生成未来身份证<br>小球回收成功");
				visitorsService.updateVisitorState(pd);
				ModelAndView mv = new ModelAndView("redirect:/visitors/error");
				return mv;
			}
			//infoList中有数据，则更新数据，并展示访客的未来身份证
			for(PageData idInfo:infoList){
				pd.put("Name", idInfo.getString("Name"));
				pd.put("Age", idInfo.get("Age"));
				pd.put("Sex", idInfo.getString("Sex"));
				pd.put("Phone", idInfo.getString("Phone"));
				pd.put("MatchedStar", idInfo.getString("StarName"));
				pd.put("MatchedScore", idInfo.get("Score"));
				pd.put("dietSuggestion", idInfo.getString("DietSuggestion"));
				pd.put(idInfo.getString("ItemName"), idInfo.get("Seconds"));
				pd.put("PicURL", idInfo.getString("URL"));
			}
			visitorsService.updateVisitorState(pd);
			ModelAndView mv = new ModelAndView("/system/ballcollect/futureid","pd",pd);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			attr.addFlashAttribute("msg", "智慧球回收完毕，但很抱歉，读取智慧球数据时发生错误，无法为您生成未来身份证");
			ModelAndView mv = new ModelAndView("redirect:/visitors/error");
			return mv;
		}
	}

	@RequestMapping("/success")
	public String success() {
		return "system/receptionist/ballsuccess";
	}

	@RequestMapping("/error")
	public String error() {
		return "/error";
	}

	@RequestMapping("/reSubmitInfo")
	@Token(save = true)
	public String reSubmitInfo() {
		return "/system/receptionist/ball";
	}
	
	@RequestMapping("/futureID")
	public String futureID() {
		return "/system/ballcollect/futureid";
	}
	
	@RequestMapping("/ballcollect")
	@Token(save=true)
	public String ballcollect() {
		return "/system/ballcollect/ballcollect";
	}	

}
