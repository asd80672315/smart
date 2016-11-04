package com.zhzg.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.constraints.Null;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.zhzg.dao.impl.DaoSupport;
import com.zhzg.entity.Page;
import com.zhzg.util.PageData;
import com.zhzg.util.ReservationUtil;
import com.zhzg.util.Tools;


@Service("ReservationService")
public class ReservationService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 通过id获取数据
	*/
	public PageData findByReservationID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ReservationMapper.findByReservationID", pd);
	}
	
	public String getMaxReservationNumber(PageData pd) throws Exception{
		return (String)dao.findForObject("ReservationMapper.getMaxReservationNumber", pd);
	}
	
	// 保存用户W
	
	public void saveReservation(PageData pd)throws Exception{
		//对页面数据进行封装，如果字段为"",则将改字段置为null
		String industryId=pd.getString("IndustryID");
		String positionId=pd.getString("PositionID");
		String occupationId=pd.getString("OccupationID");
		String age=pd.getString("Age");
		if(Tools.isEmpty(industryId)){
			pd.put("IndustryID", null);
		}
		if(Tools.isEmpty(positionId)){
			pd.put("PositionID", null);
		}
		if(Tools.isEmpty(occupationId)){
			pd.put("OccupationID", null);
		}
		if(Tools.isEmpty(age)){
			pd.put("Age", null);
		}
		
		//页面数据合法，进行响应的数据封装，进行数据库写入		
		ReservationUtil reservationUtil = new ReservationUtil();
		String dateNow=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		// 创建时间
		pd.put("CreatedDate",dateNow);
		// 创建者
		pd.put("CreatedBy", "szb");
		
		// 修改时间
		pd.put("ModifiedDate",dateNow);
		// 修改者
		pd.put("ModifiedBy", "szb");
		
		// 当前日期 yyyy-MM-dd
		pd.put("CurrentDay",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		// 第二天的日期 yyyy-MM-dd，用于获取当天的最大预约号码
		pd.put("NextDay",new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis() + 24 * 60 * 60 * 1000)));
		// 获取当天最大预约号，结果为数据库现存的最大数+1
		String maxReservationNumber = getMaxReservationNumber(pd);
		// 将最大预约号放入pd
		pd.put("MaxReservationNum", maxReservationNumber);
		// 根据最大预约号生成预约Id
		pd=reservationUtil.generateReservationId(pd);
		
		// 数据有效，则将数据加入到数据库中
		dao.save("ReservationMapper.saveReservation", pd);
		
	}
	/*
	* 修改用户
	
	public void editU(PageData pd)throws Exception{
		dao.update("UserXMapper.editU", pd);
	}
	
	* 换皮肤
	
	public void setSKIN(PageData pd)throws Exception{
		dao.update("UserXMapper.setSKIN", pd);
	}
	
	* 删除用户
	
	public void deleteU(PageData pd)throws Exception{
		dao.delete("UserXMapper.deleteU", pd);
	}
	
	* 批量删除用户
	
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("UserXMapper.deleteAllU", USER_IDS);
	}*/
	/*
	*用户列表(用户组)
	*/
	/*public List<PageData> listPdPageYuyue(Page page)throws Exception{
		return (List<PageData>) dao.findForList("YuyueMapper.getYuyuelistPage", page);
	}*/
	
	/*
	*用户列表(全部)
	*/
	/*public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserXMapper.listAllUser", pd);
	}*/
	
	/*
	*用户列表(供应商用户)
	
	public List<PageData> listGPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserXMapper.userGlistPage", page);
	}
	
	* 保存用户IP
	
	public void saveIP(PageData pd)throws Exception{
		dao.update("UserXMapper.saveIP", pd);
	}
	
	
	* 登录判断
	
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserXMapper.getUserInfo", pd);
	}
	
	* 跟新登录时间
	
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("UserXMapper.updateLastLogin", pd);
	}
	
	
	*通过id获取数据
	
	public User getUserAndRoleById(String USER_ID) throws Exception {
		return (User) dao.findForObject("UserMapper.getUserAndRoleById", USER_ID);
	}
*/
	
}
