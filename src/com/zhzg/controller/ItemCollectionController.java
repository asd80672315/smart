package com.zhzg.controller;

import java.io.IOException;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.zhzg.controller.base.BaseController;
import com.zhzg.interceptor.Token;
import com.zhzg.service.ItemCollectionService;
import com.zhzg.service.QuestionsService;
import com.zhzg.util.PageData;
import com.zhzg.util.Tools;

@Controller
@RequestMapping("/itemCollection")
public class ItemCollectionController extends BaseController {

	@Resource(name = "itemCollectionService")
	private ItemCollectionService itemCollectionService;

	@Resource(name = "questionsService")
	private QuestionsService questionsService;

	@RequestMapping("/saveItemCollection")
	public void saveItemCollection(HttpServletRequest request,
			HttpServletResponse response) {
		PageData pd=getPageData();
		// 智慧球ID和项目编号也不能为空，为空则返回错
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		if (pd == null || Tools.isEmpty(request.getParameter("SmartBallID"))
				|| Tools.isEmpty(request.getParameter("No"))) {
			try {
				
				response.getWriter().write("智慧球ID未识别，请重新放置智慧球");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 放入智慧球，请求到达该处，页面数据为智慧球ID及项目编号
		try {
			// 根据智慧球ID获取预约号
			pd.put("SmartBallID", request.getParameter("SmartBallID"));
			Integer reservationId = questionsService.ReservationIdBySmartId(pd);
			if (Tools.isEmpty(String.valueOf(reservationId))) {
				response.getWriter().write("预约号读取错误，请重新放置智慧球");
				return;
			}
			// 预约号放入pd
			pd.put("ReservationID", reservationId);
			// 开始时间放入pd
			pd.put("BeginDatetime",
					Tools.date2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
			// 数据插入数据库
			itemCollectionService.saveItemCollection(pd);
			response.getWriter().write("嘉宾数据保存成功");
		} catch (Exception e) {
			try {
				response.getWriter().write("嘉宾数据保存错误，该项目数据保存失败");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}

	}

	@RequestMapping("/updateItemCollection")
	public void updateItemCollectionByReservationId(
			HttpServletRequest request, HttpServletResponse response) {
		PageData pd=getPageData();
		// 判断pd是否为空，为空则返回错
		// 并且智慧球ID和项目编号也不能为空
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		if (pd == null || Tools.isEmpty(pd.getString("SmartBallID"))
				|| Tools.isEmpty(pd.getString("No"))) {
			try {
				response.getWriter().write("智慧球ID未识别，请重新放置智慧球");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		//取走智慧球，请求到达该处，页面数据为智慧球ID及项目编号
		try {
			// 根据智慧球ID获取预约号
			pd.put("SmartBallID", request.getParameter("SmartBallID"));
			Integer reservationId = questionsService.ReservationIdBySmartId(pd);
			if (Tools.isEmpty(reservationId.toString())) {
				response.getWriter().write("预约号读取错误，请重新放置智慧球");
				return;
			}
			// 预约号放入pd
			pd.put("ReservationID", reservationId);
			// 结束时间放入pd
			pd.put("EndDatetime",
					Tools.date2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
			// 数据插入数据库
			itemCollectionService.updateItemCollectionByReservationId(pd);
			response.getWriter().write("嘉宾数据更新成功");
		} catch (Exception e) {
			try {
				response.getWriter().write("嘉宾数据保存错误，该项目数据保存失败");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/itemCollection")

	public ModelAndView itemCollection(){
		return new ModelAndView("/system/itemcollection/itemcollection");
	}
}
