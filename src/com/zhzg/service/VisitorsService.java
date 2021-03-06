package com.zhzg.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.commons.lang.math.IntRange;
import org.openxmlformats.schemas.drawingml.x2006.picture.PicDocument;
import org.springframework.stereotype.Service;

import com.zhzg.dao.impl.DaoSupport;
import com.zhzg.entity.Page;
//import com.zhzg.entity.system.IDInfo;
import com.zhzg.entity.system.Visitors;
import com.zhzg.util.PageData;
import com.zhzg.util.ReservationUtil;
import com.zhzg.util.Tools;
import com.zhzg.util.VisitorUtil;

/**
 * 类名称：VisitorsService 创建人：ZZC 创建时间：2016年6月15日
 * 
 * @version
 */
@Service("visitorsService")
public class VisitorsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name = "ReservationService")
	private ReservationService reservationService;

	// ======================================================================================

	/*
	 * 通过id获取数据
	 */
	public PageData findByReservationID(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"VisitorsMapper.findByReservationID", pd);
	}
	/*
	 * 通过姓名，电话获取数据
	 */
	public List findByTel(PageData pd) throws Exception {
		return (List) dao.findForList(
				"VisitorsMapper.findByTel", pd);
	}

	/*
	 * 通过id获取访客数据
	 */
	/*
	 * public Integer findVisitor(PageData pd)throws Exception{ return
	 * (Integer)dao.findForObject("VisitorsMapper.findCountByVisitorsID", pd); }
	 */
	// 访客新增

	public void saveVisitor(PageData pd) throws Exception {
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
		// 创建时间
		String dateNow=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		pd.put("CreatedDate",dateNow);		
		// 创建者
		pd.put("CreatedBy", "zzc");
		pd.put("ModifiedDate", dateNow);
		pd.put("ModifiedBy", "szb");
		// 类型为个人
		pd.put("Type", "1");
		// 状态为到馆
		pd.put("State", "1");
		// 参观日期 现在页面没有获取 获取之后删除此行
		pd.put("VisitDate",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		pd.put("BookingDate",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		// 获取id
		String reservationID = pd.getString("ReservationID");
		if (reservationID == null || reservationID.equals("")) {
			// 没有预约号的情况下直接输入信息，生成访客信息
			reservationService.saveReservation(pd);
			/*
			 * // 获取当天最大预约号，结果为数据库现存的最大数+1 ReservationUtil reservationUtil = new
			 * ReservationUtil(); String maxReservationNumber =
			 * reservationService.getMaxReservationNumber(pd); // 将最大预约号放入pd
			 * pd.put("MaxReservationNum", maxReservationNumber); //
			 * 根据最大预约号生成预约Id pd=reservationUtil.generateReservationId(pd);
			 * //保存预约信息 dao.save("ReservationMapper.saveReservation", pd);
			 */
		}

		// 保存访客信息
		dao.save("VisitorsMapper.saveVisitor", pd);
	}

	// 团体访客新增

	public void saveVisitors(PageData pd) throws Exception {
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
		ArrayList<Visitors> list = new ArrayList<>();

		/*
		 * int beginNumber = Integer.parseInt(pd.getString("BeginNumber")); int
		 * endNumber = Integer.parseInt(pd.getString("EndNumber"));
		 */
		// 团体人数
		int groupNumber = Integer.parseInt(pd.getString("GroupNumber"));
		String reservationID = pd.getString("ReservationID");
		// 团体访客 type是2
		pd.put("Type", "2");
		pd.put("State", "1");
		pd.put("BookingDate",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		
		// 没有预约号的情况下直接输入信息，生成访客信息
		if (reservationID == null || reservationID.equals("")) {
			
			reservationService.saveReservation(pd);
		}
		// 本团队开始预约号
		int beginNumber = Integer.parseInt(pd.getString("BeginNumber"));
		// 本团队结束预约号
		int endNumber = Integer.parseInt(pd.getString("EndNumber"));
		// 创建时间
		pd.put("CreatedDate",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		
		// 创建者
		 pd.put("CreatedBy", "zzc");
		int j = 0;//用于名称递增
		for (int i = beginNumber; i <= endNumber; i++) {
			j++;
			Visitors v = new Visitors();
			v.setReservationID(i);
			v.setIndustryID(Integer.valueOf(pd.getString("IndustryID")));
			// v.setVisitDate(Tools.str2Date(pd.getString("VisitDate"))); 正式代码
			v.setVisitDate(new Date());// 测试用 待删除
			v.setType("2");// 团体预约用户
			v.setState("1");// 状态到馆
			v.setCreatedDate(new Date());// 创建日期
			v.setRegion(pd.getString("Region"));// 地区
			v.setOrganization(pd.getString("Organization"));// 工作单位
			v.setName(pd.getString("Name")+j);
			list.add(v);
		}
		//dao.batchSave("VisitorsMapper.saveVisitors", list);//由于vertica不支持批量插入，这里改为多次单挑插入		
		for(Visitors v:list){
			String dateNow=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			pd.put("Age", v.getAge());
			pd.put("CreatedBy", "zzc");
			pd.put("CreatedDate", dateNow);
			pd.put("IndustryID", v.getIndustryID());
			pd.put("Mail", v.getMail());
			pd.put("Memo", v.getMemo());
			pd.put("ModifiedBy", "szb");
			pd.put("ModifiedDate",dateNow);
			pd.put("Name", v.getName());
			
			pd.put("OccupationID", v.getOccupationID());
			pd.put("Organization", v.getOrganization());
			pd.put("PositionID", v.getPositionID());
			pd.put("QuestionnaireID", v.getQuestionnaireID());
			pd.put("Region", v.getRegion());
			pd.put("ReservationID", v.getReservationID());
			pd.put("Sex", v.getSex());
			pd.put("SmartBallID", v.getSmartBallID());
			pd.put("State", v.getState());
			pd.put("Type", v.getType());
			pd.put("URL", v.getURL());
			pd.put("VisitDate", v.getVisitDate());
			pd.put("VisitorID", v.getVisitorID());
			dao.save("VisitorsMapper.saveVisitor", pd);
		}
	}

	public void updateVisitorByID(PageData pd) throws Exception {
		// 对页面数据进行封装，如果字段为"",则将改字段置为null
		String industryId = pd.getString("IndustryID");
		String positionId = pd.getString("PositionID");
		String occupationId = pd.getString("OccupationID");
		String age = pd.getString("Age");
		if (Tools.isEmpty(industryId)) {
			pd.put("IndustryID", null);
		}
		if (Tools.isEmpty(positionId)) {
			pd.put("PositionID", null);
		}
		if (Tools.isEmpty(occupationId)) {
			pd.put("OccupationID", null);
		}
		if (Tools.isEmpty(age)) {
			pd.put("Age", null);
		}
		// 保存图片
		Properties prop = new Properties();
		prop.load(VisitorsService.class.getClassLoader().getResourceAsStream(
				"config.properties"));
		VisitorUtil visitorUtil = new VisitorUtil();
		
		String picName = pd.getString("ReservationID");//普通访客照片用预约号码命名
		boolean isPicSaveOK = false;
		if (visitorUtil.isVIP(pd)) {// 如果是vip，如果未拍照，则使用默认照片，并使用Memo命名
			picName=pd.getString("Memo");
			String picData = pd.getString("Pic");
			if (Tools.isEmpty(picData)) {				
				String defaultPicData = prop.getProperty("defaultPicData");
				pd.put("Pic", defaultPicData);
			}
		}
		// 此时pd合法，加入图片URL后即可进行数据更新	
		
		String picPath = prop.getProperty("picPath");
		String picExt = prop.getProperty("imageformat");
		String picFullPath = picPath + picName + "." + picExt;
		pd.put("URL", picFullPath);
		
		isPicSaveOK = visitorUtil.savePic(pd);//保存图片
		if (isPicSaveOK) {
			String dateNow=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			pd.put("ModifiedDate", dateNow);
			pd.put("ModifiedBy", "szb");
			pd.put("VisitDate",
					new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			pd.put("State", 2);
			dao.update("VisitorsMapper.updateVisitorByID", pd);
		} else {
			throw new Exception("保存图片出现错误");
		}
	}

	public void saveVIPVisitor(PageData pd) throws Exception {
		dao.save("VisitorsMapper.saveVisitor", pd);
	}
	
	public void updateVisitorState(PageData pd) throws Exception{
		dao.update("VisitorsMapper.updateVisitorState", pd);
	}
	
	public List<PageData> findIDInformation(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("VisitorsMapper.findIDInformation", pd);
	}
	
	public int findMaxVisitorId(PageData pd) throws Exception{
		return (Integer)dao.findForObject("VisitorsMapper.findMaxVisitorId", pd);
	}
	/*
	 * 修改用户
	 * 
	 * public void editU(PageData pd)throws Exception{
	 * dao.update("UserXMapper.editU", pd); }
	 * 
	 * 换皮肤
	 * 
	 * public void setSKIN(PageData pd)throws Exception{
	 * dao.update("UserXMapper.setSKIN", pd); }
	 * 
	 * 删除用户
	 * 
	 * public void deleteU(PageData pd)throws Exception{
	 * dao.delete("UserXMapper.deleteU", pd); }
	 * 
	 * 批量删除用户
	 * 
	 * public void deleteAllU(String[] USER_IDS)throws Exception{
	 * dao.delete("UserXMapper.deleteAllU", USER_IDS); }
	 */
	/*
	 * 用户列表(用户组)
	 */
	/*
	 * public List<PageData> listPdPageYuyue(Page page)throws Exception{ return
	 * (List<PageData>) dao.findForList("YuyueMapper.getYuyuelistPage", page); }
	 */

	/*
	 * 用户列表(全部)
	 */
	/*
	 * public List<PageData> listAllUser(PageData pd)throws Exception{ return
	 * (List<PageData>) dao.findForList("UserXMapper.listAllUser", pd); }
	 */

	/*
	 * 用户列表(供应商用户)
	 * 
	 * public List<PageData> listGPdPageUser(Page page)throws Exception{ return
	 * (List<PageData>) dao.findForList("UserXMapper.userGlistPage", page); }
	 * 
	 * 保存用户IP
	 * 
	 * public void saveIP(PageData pd)throws Exception{
	 * dao.update("UserXMapper.saveIP", pd); }
	 * 
	 * 
	 * 登录判断
	 * 
	 * public PageData getUserByNameAndPwd(PageData pd)throws Exception{ return
	 * (PageData)dao.findForObject("UserXMapper.getUserInfo", pd); }
	 * 
	 * 跟新登录时间
	 * 
	 * public void updateLastLogin(PageData pd)throws Exception{
	 * dao.update("UserXMapper.updateLastLogin", pd); }
	 * 
	 * 
	 * 通过id获取数据
	 * 
	 * public User getUserAndRoleById(String USER_ID) throws Exception { return
	 * (User) dao.findForObject("UserMapper.getUserAndRoleById", USER_ID); }
	 */

}
