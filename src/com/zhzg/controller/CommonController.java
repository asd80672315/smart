package com.zhzg.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhzg.controller.base.BaseController;
import com.zhzg.service.CommonService;
import com.zhzg.util.PageData;


@Controller
@RequestMapping("/common")
public class CommonController extends BaseController {
	
	@Resource(name="commonService")
	private CommonService commonService;
	@RequestMapping("/occupation")
	public void getOccupation(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{	
		PageData pd=this.getPageData();
		List list=new ArrayList();
		try {
			list=commonService.findAllOccupation(pd);
			
			JSONArray json=JSONArray.fromObject(list);
			response.setContentType("application/json;charset=utf-8");
			response.getWriter().write(json.toString());
		} catch (Exception e) {			
			e.printStackTrace();
			Map<String,String> error=new HashMap<String,String>();
			error.put("occupation", "获取职业信息失败");
			request.setAttribute("error", error);
			response.getWriter().write("");
		}
	}
	
	@RequestMapping("/position")
	public void getPosition(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{	
		PageData pd=this.getPageData();
		List list=new ArrayList();
		try {
			list=commonService.findAllPostion(pd);
			JSONArray json=JSONArray.fromObject(list);
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			response.getWriter().write(json.toString());
		} catch (Exception e) {			
			e.printStackTrace();
			Map<String,String> error=new HashMap<String,String>();
			error.put("position", "获取职位信息失败");
			request.setAttribute("error", error);
			response.getWriter().write("");			
		}
	}
	
	@RequestMapping("/industry")
	public void getIndustry(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{	
		PageData pd=this.getPageData();
		List list=new ArrayList();
		try {
			list=commonService.findAllIndustry(pd);
			JSONArray json=JSONArray.fromObject(list);
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			response.getWriter().write(json.toString());
		} catch (Exception e) {			
			e.printStackTrace();
			Map<String,String> error=new HashMap<String,String>();
			error.put("occupation", "获取行业信息失败");
			request.setAttribute("error", error);
			response.getWriter().write("");
		}
	}
	
	
}
