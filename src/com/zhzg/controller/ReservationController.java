package com.zhzg.controller;



import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zhzg.controller.base.BaseController;
import com.zhzg.interceptor.Token;
import com.zhzg.service.ReservationService;
import com.zhzg.service.VisitorsService;
import com.zhzg.util.PageData;
import com.zhzg.util.ReservationUtil;

/**
 * 类名称：ReservationController 创建人：SZB 创建时间：2016年6月15日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/reservation")
public class ReservationController extends BaseController {

	@Resource(name = "ReservationService")
	private ReservationService ReservationService;
	
	@Resource(name = "visitorsService")
	private VisitorsService visitorsService;

	/**
	 * 保存预约信息
	 */

	@RequestMapping(value = "/saveReservation")
	@Token(remove=true)	
	public ModelAndView saveReservation(HttpServletRequest request,RedirectAttributes attr) {
		PageData pd = new PageData();
		pd = this.getPageData();//获取原始页面数据
		if(pd==null){
			attr.addFlashAttribute("msg", "页面数据为空，请重试");
			ModelAndView mv = new ModelAndView("redirect:/reservation/error");
			return mv;
		}
		String type=pd.getString("Type");//获取预约类型
		ReservationUtil reservationUtil = new ReservationUtil();//预约工具类
		boolean isPdOK = reservationUtil.validate(pd);//校验页面数据是否合法
		Map error = reservationUtil.getError();//获取页面数据错误
		request.setAttribute("error", error);//页面数据错误添加到request
		request.setAttribute("pd", pd);//页面数据添加到request
		if (!isPdOK) {//页面数据不合法，则返回响应的错误页面或消息
			if(error.get("init")!=null){//如果State或Type为空，则返回错误
				attr.addFlashAttribute("msg", "页面来源不正确，请重新进入主页选择合适的预约选项");
				ModelAndView mv=new ModelAndView("redirect:/reservation/error");
				return mv;				
			}
			if("1".equals(type)){//返回个人页面
				request.getSession(false).setAttribute("token", UUID.randomUUID().toString());
				return new ModelAndView("/system/reservation/reservation_personal","pd",pd);
			}else if("2".equals(type)){//返回团体页面
				request.getSession(false).setAttribute("token", UUID.randomUUID().toString());
				return new ModelAndView("/system/reservation/reservation_group","pd",pd);
			}
		}
		//页面数据有效，调用service层方法保存预约信息
		try {
			ReservationService.saveReservation(pd);
			//将预约信息转换为访客信息，调用访客Service执行访客的转换
			if("1".equals(pd.getString("Type"))){//个人访客
				visitorsService.saveVisitor(pd);
			}else if("2".equals(pd.getString("Type"))){//团体访客
				visitorsService.saveVisitors(pd);//由于vertica不支持批量插入，这里改为单挑插入
				
			}			
			attr.addFlashAttribute("source", "预约");
			attr.addFlashAttribute("link", pd.getString("url"));
			attr.addFlashAttribute("pd", pd);		
			ModelAndView mv = new ModelAndView("redirect:/reservation/reservationsuccess");			
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			attr.addFlashAttribute("msg", "保存数据出现问题，请返回预约界面检查数据并重试");
			ModelAndView mv=new ModelAndView("redirect:/reservation/error");
			return mv;
		}
	}

	@RequestMapping("/reservation_personal")
	@Token(save=true)
	public String reservation_personal(HttpServletRequest request){
		return "/system/reservation/reservation_personal";
	}
	
	@RequestMapping("/reservation_group")
	@Token(save=true)
	public String reservation_group(HttpServletRequest request){
		return "/system/reservation/reservation_group";
	}
	
	@RequestMapping("/reservationsuccess")
	public String success(){
		return "system/reservation/reservationsuccess";
	}
	
	@RequestMapping("/error")
	public String error(){
		return "/error";
	}
	/**
	 * 修改用户
	 */
	/*
	 * @RequestMapping(value="/editU") public ModelAndView editU() throws
	 * Exception{ ModelAndView mv = this.getModelAndView(); PageData pd = new
	 * PageData(); pd = this.getPageData(); if(pd.getString("PASSWORD") != null
	 * && !"".equals(pd.getString("PASSWORD"))){ pd.put("PASSWORD", new
	 * SimpleHash("SHA-1", pd.getString("USERNAME"),
	 * pd.getString("PASSWORD")).toString()); } userService.editU(pd);
	 * mv.addObject("msg","success"); mv.setViewName("save_result"); return mv;
	 * }
	 */

	/**
	 * 去修改用户页面
	 */
	/*
	 * @RequestMapping(value="/goEditU") public ModelAndView goEditU() throws
	 * Exception{ ModelAndView mv = this.getModelAndView(); PageData pd = new
	 * PageData(); pd = this.getPageData();
	 * 
	 * //顶部修改个人资料 String fx = pd.getString("fx");
	 * 
	 * //System.out.println(fx);
	 * 
	 * if("head".equals(fx)){ mv.addObject("fx", "head"); }else{
	 * mv.addObject("fx", "user"); }
	 * 
	 * List<Role> roleList = roleService.listAllERRoles(); //列出所有二级角色 pd =
	 * userService.findByUiId(pd); //根据ID读取
	 * mv.setViewName("system/user/user_edit"); mv.addObject("msg", "editU");
	 * mv.addObject("pd", pd); mv.addObject("roleList", roleList);
	 * 
	 * return mv; }
	 */

	/**
	 * 去新增用户页面
	 */
	/*
	 * @RequestMapping(value="/goAddU") public ModelAndView goAddU()throws
	 * Exception{ ModelAndView mv = this.getModelAndView(); PageData pd = new
	 * PageData(); pd = this.getPageData(); List<Role> roleList;
	 * 
	 * roleList = roleService.listAllERRoles(); //列出所有二级角色
	 * 
	 * mv.setViewName("system/user/user_edit"); mv.addObject("msg", "saveU");
	 * mv.addObject("pd", pd); mv.addObject("roleList", roleList);
	 * 
	 * return mv; }
	 */

	/**
	 * 显示用户列表(tab方式)
	 */
	/*
	 * @RequestMapping(value="/listtabUsers") public ModelAndView
	 * listtabUsers(Page page)throws Exception{ ModelAndView mv =
	 * this.getModelAndView(); PageData pd = new PageData(); pd =
	 * this.getPageData(); List<PageData> userList =
	 * userService.listAllUser(pd); //列出用户列表
	 * mv.setViewName("system/user/user_tb_list"); mv.addObject("userList",
	 * userList); mv.addObject("pd", pd); return mv; }
	 */

	/**
	 * 删除用户
	 */
	/*
	 * @RequestMapping(value="/deleteU") public void deleteU(PrintWriter out){
	 * PageData pd = new PageData(); try{ pd = this.getPageData();
	 * userService.deleteU(pd); out.write("success"); out.close(); }
	 * catch(Exception e){ logger.error(e.toString(), e); }
	 * 
	 * }
	 */

	/**
	 * 批量删除
	 */
	/*
	 * @RequestMapping(value="/deleteAllU")
	 * 
	 * @ResponseBody public Object deleteAllU() { PageData pd = new PageData();
	 * Map<String,Object> map = new HashMap<String,Object>(); try { pd =
	 * this.getPageData(); List<PageData> pdList = new ArrayList<PageData>();
	 * String USER_IDS = pd.getString("USER_IDS");
	 * 
	 * if(null != USER_IDS && !"".equals(USER_IDS)){ String ArrayUSER_IDS[] =
	 * USER_IDS.split(","); userService.deleteAllU(ArrayUSER_IDS); pd.put("msg",
	 * "ok"); }else{ pd.put("msg", "no"); }
	 * 
	 * pdList.add(pd); map.put("list", pdList); } catch (Exception e) {
	 * logger.error(e.toString(), e); } finally { logAfter(logger); } return
	 * AppUtil.returnObject(pd, map); }
	 */
	// ===================================================================================================

	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) { DateFormat
	 * format = new SimpleDateFormat("yyyy-MM-dd");
	 * binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
	 * true)); }
	 */

	/* ===============================权限================================== */
	/*
	 * public Map<String, String> getHC(){ Subject currentUser =
	 * SecurityUtils.getSubject(); //shiro管理的session Session session =
	 * currentUser.getSession(); return (Map<String,
	 * String>)session.getAttribute(Const.SESSION_QX); }
	 */
	/* ===============================权限================================== */
}
