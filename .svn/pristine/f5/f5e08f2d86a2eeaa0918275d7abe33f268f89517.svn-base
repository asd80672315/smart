package com.zhzg.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.print.attribute.standard.MediaSize.ISO;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;







/**
 * @author HP
 *
 */
public class ReservationUtil {
	private  HashMap<String,String> error=new HashMap<String,String>();
	
	public static final String PageSourceError="页面来源不正确，请重新进入主页选择合适的选项";
	public static final String PhoneNull="手机号不能为空";
	public static final String PhoneFormatError="手机号格式不正确";
	public static final String BookingDateNull="预约日期不能为空";
	public static final String BookingDateBeforCurrent="预约日期应不早于当前日期";
	public static final String BookingDateFormatError="预约日期格式不正确";
	public static final String ReservationNameNull="预约人姓名不能为空";
	public static final String MailFormatError="邮箱格式不正确";
	public static final String AgeNotNumber="年龄必须为数字";
	public static final String AgeOutOfRange="年龄应在1-200之间";
	public static final String GroupNameNull="团队名称不能为空";
	public static final String GroupNumNull="团队人数不能为空";
	public static final String GroupNumNotNumber="团队人数必须为数字";
	public static final String GroupNumOutOfRange="团队人数应在1-100之间";
	public static final String ReservationTypeError="预约类型不合法，请选择合适的预约页面";
	public static final String RegionNull="地区不能为空";
	public static final String IndustryNull="行业不能为空";

	public HashMap<String, String> getError() {
		return error;
	}

	

	/**
	 * 用于数据校验
	 * Type不能为空,State不能为空，ReservationId不能为空,mail格式合法，手机格式合法
	 * @param pd 页面数据
	 * @return 页面数据是否有效
	 */
	public boolean validate(PageData pd){
		
		boolean isOK=true;		
		String phone=pd.getString("Phone");
		String type=pd.getString("Type");
		String state=pd.getString("State");
		String bookingDate=pd.getString("BookingDate");
		String region=pd.getString("Region");
		String industryId=pd.getString("IndustryID");
		
		
		//如果预约有效性不存在，则报错
		if(Tools.isEmpty(state)){
			error.put("init", PageSourceError);
			return false;		
		}
		//如果type不合法，则报错
		if(Tools.isEmpty(type)||(Tools.notEmpty(type)&&!"1".equals(type)&&!"2".equals(type))){
			error.put("init", PageSourceError);
			return false;
		}
		
		//手机号有效性
		if(Tools.isEmpty(phone)){
			error.put("phone", PhoneNull)	;
			isOK=false;
		}else if(Tools.notEmpty(phone)&&!Tools.checkMobileNumber(phone)){
			error.put("phone", PhoneFormatError);
			isOK=false;
		}
		
		//预约日期有效性
		if(Tools.isEmpty(bookingDate)){
			error.put("bookingDate", BookingDateNull)	;
			isOK=false;
		}else if(Tools.notEmpty(bookingDate)){
			try {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				Date bookedDate=sdf.parse(bookingDate);
				Date currentDate=new Date();
				if(bookedDate.before(currentDate)){
					error.put("bookingDate", BookingDateBeforCurrent);
					isOK=false;
				}
			} catch (ParseException e) {
				e.printStackTrace();
				error.put("bookingDate", BookingDateFormatError);
				isOK=false;
			}
		}
		
		//地区有效性
		if(Tools.isEmpty(region)){
			error.put("region", RegionNull);
			isOK=false;
		}
		
		//行业有效性
		if(Tools.isEmpty(industryId)||"0".equals(industryId)){
			error.put("industry", IndustryNull);
			isOK=false;			
		}
		
		
		switch (type) {
		case "1"://个人预约
			String name=pd.getString("Name");
			if(Tools.isEmpty(name)){//个人预约，姓名不能为空
				error.put("name", ReservationNameNull);
			}
			String mail=pd.getString("Mail");
			if(Tools.notEmpty(mail)&&!Tools.checkEmail(mail)){
				error.put("mail", MailFormatError);
				isOK=false;
			}
			String age=pd.getString("Age");
			if(Tools.notEmpty(age)&&!age.matches("\\d+") ){
				error.put("age", AgeNotNumber);	
				isOK=false;
			}else if(Tools.notEmpty(age)&&age.matches("\\d+")){
				if(Integer.valueOf(age)>200||Integer.valueOf(age)<=0){
					error.put("age", AgeOutOfRange);
					isOK=false;
				}
			}			
			break;
		case "2":
			String groupName=pd.getString("GroupName");
			if(Tools.isEmpty(groupName)){
				error.put("groupName", GroupNameNull);
				isOK=false;
			}			
			String groupNumber=pd.getString("GroupNumber");
			if(Tools.isEmpty(groupNumber)){
				error.put("groupNumber", GroupNumNull);
				isOK=false;
			}else if(!groupNumber.matches("\\d+")){
				error.put("groupNumber", GroupNumNotNumber);
				isOK=false;						
			}else if(groupNumber.matches("\\d+")){
				if(Integer.valueOf(groupNumber)>100||Integer.valueOf(groupNumber)<=0){
					error.put("groupNumber", GroupNumOutOfRange);
					isOK=false;
				}
			}
			break;
		default:
			error.put("type", ReservationTypeError);
			isOK=false;
			break;
		}		
		return isOK;
	}
	
	/**
	 * 根据当天预约情况，生成预约号，要使用该方法，需要在调用前在pd中putMaxReservationNum
	 * @param pd 增强后的页面数据
	 * @return 预约号
	 */
	public PageData generateReservationId(PageData pd){
		String reservationId=null;		
		String maxReservationNumber=pd.getString("MaxReservationNum");
		//如果maxReservationNum为空，则返回当天的第一个预约号码
		if(Tools.isEmpty(maxReservationNumber)){
			reservationId= new SimpleDateFormat("yyMMdd").format(new Date())+"0001";
		}else {//否则，取当天最大预约号+1作为本次预约号码
			reservationId=String.format("%1$04d", Integer.valueOf(maxReservationNumber));
		}
		//预约号码放入pd
		pd.put("ReservationID", reservationId);
		// 生成beginNumber和endNumber，并加入到pd
		String beginNumber = reservationId;
		pd.put("BeginNumber", beginNumber);		
		String type=pd.getString("Type");		
		String endNumber=null;
		if("1".equals(type)){
			endNumber=beginNumber;
		}else if("2".equals(type)){			
			endNumber=String.valueOf(Integer.valueOf(beginNumber)+Integer.valueOf(pd.getString("GroupNumber"))-1);
		}
		pd.put("EndNumber", endNumber);
		return pd;
	}


	
}
