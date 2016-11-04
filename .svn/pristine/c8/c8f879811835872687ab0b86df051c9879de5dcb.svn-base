package com.zhzg.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;

import com.hp.hpl.sparta.xpath.ThisNodeTest;
import com.zhzg.service.VisitorsService;

public class VisitorUtil {

	public static final String ConfigFileReadError = "配置文件读取错误，请联系工作人员";
	public static final String ReservationIdNull = "预约号不能为空";
	public static final String VisitorTypeError = "嘉宾类型不合法，请重新输入预约号码";
	public static final String StateAlreadyInError = "您当前已经是<b>在馆</b>状态，请不要重复取智慧球";
	public static final String StateAlreadyOutError = "您当前已经是<b>离馆</b>状态，若再次参观，请去前台进行参观登记";
	public static final String StateIllegalError = "您当前无法取智慧球，请去前台进行参观登记";
	public static final String VisitIdNull = "您还未进行登记，请到前台进行登记";
	public static final String PicNull = "未进行图像采集，请点击<b>拍照</b>进行图像采集";
	public static final String MailFormatError = "邮箱格式不正确";
	public static final String AgeNotNumber = "年龄必须为数字";
	public static final String AgeOutOfRange = "年龄应在1-200之间";
	public static final String PhoneFormatError = "手机号格式不正确";
	public static final String NameNull = "姓名不能为空";
	public static final String RegionNull = "地区不能为空";
	public static final String IndustryNull = "行业不能为空";

	private HashMap<String, String> error = new HashMap<String, String>();
	private static String vipReservationID;
	private static Properties prop = new Properties();
	static {

		try {
			InputStream in = VisitorUtil.class.getClassLoader()
					.getResourceAsStream("config.properties");
			System.out.println(in);
			if (in != null) {
				prop.load(in);
			} else {
				throw new Exception(ConfigFileReadError);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		vipReservationID = prop.getProperty("VIP");

	}

	public HashMap<String, String> getError() {
		return error;
	}

	/**
	 * 用于数据校验
	 * 
	 * @param pd
	 *            页面数据
	 * @return 页面数据是否有效
	 * @throws IOException
	 */
	public boolean validate(PageData pd) {
		boolean isOK = true;
		String type = pd.getString("Type");
		String state = pd.getString("State");
		String picContent = pd.getString("Pic");
		String reservationID = pd.getString("ReservationID");
		String visitorID = pd.getString("VisitorID");
		String age = pd.getString("Age");
		String mail = pd.getString("Mail");
		String phone = pd.getString("Phone");
		String name = pd.getString("Name");
		String region = pd.getString("Region");
		String industryId = pd.getString("IndustryID");

		if (vipReservationID == null) {
			error.put("init", ConfigFileReadError);
			return false;
		}

		if (reservationID == null) {
			error.put("reservationid", ReservationIdNull);
			isOK = false;
		}

		// 如果当前用户为VIP用户，则不作任何校验，直接返回true
		if (reservationID.equals(vipReservationID)) {
			return true;
		}

		// 如果type不合法，则报错
		if (Tools.isEmpty(type)
				|| (Tools.notEmpty(type) && !"1".equals(type) && !"2"
						.equals(type))) {
			error.put("type", VisitorTypeError);
			isOK = false;
		}

		// 如果在馆状态不合法，则报错
		if (Tools.isEmpty(state)
				|| (Tools.notEmpty(state) && !"1".equals(state))) {
			if ("2".equals(state)) {
				error.put("state", StateAlreadyInError);
				isOK = false;
			} else if ("3".equals(state)) {
				error.put("state", StateAlreadyOutError);
				isOK = false;
			} else {
				error.put("state", StateIllegalError);
				isOK = false;
			}
		}

		// 如果姓名为空，则报错
		if (Tools.isEmpty(name)) {
			error.put("name", NameNull);
			isOK = false;
		}

		// 如果visitorid为空，则报错
		if (Tools.isEmpty(visitorID)) {
			error.put("visitorid", VisitIdNull);
			isOK = false;
		}

		// 如果图片内容为空，则报错
		if (Tools.isEmpty(picContent)) {
			error.put("pic", PicNull);
			isOK = false;
		}

		// 年龄校验
		if (Tools.notEmpty(age) && !age.matches("\\d+")) {
			error.put("age", AgeNotNumber);
			isOK = false;
		} else if (Tools.notEmpty(age) && age.matches("\\d+")) {
			if (Integer.valueOf(age) > 200 || Integer.valueOf(age) <= 0) {
				error.put("age", AgeOutOfRange);
				isOK = false;
			}
		}

		// 邮箱验证
		if (Tools.notEmpty(mail) && !Tools.checkEmail(mail)) {
			error.put("mail", MailFormatError);
			isOK = false;
		}

		// 手机验证
		if (Tools.notEmpty(phone) && !Tools.checkMobileNumber(phone)) {
			error.put("phone", PhoneFormatError);
			isOK = false;
		}

		// 地区有效性
		if (Tools.isEmpty(region)) {
			error.put("region", RegionNull);
			isOK = false;
		}

		// 行业有效性
		if (Tools.isEmpty(industryId)||"0".equals(industryId)) {
			error.put("industry", IndustryNull);
			isOK = false;
		}

		return isOK;
	}

	public boolean savePic(PageData pd) throws IOException {
		String data = pd.getString("Pic");
		String filePath = pd.getString("URL");
		Base64 base64 = new Base64();
		byte[] b = null;
		try {
			b = base64.decode(data.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		File file = new File(filePath);
		try {
			FileUtils.writeByteArrayToFile(file, b);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean isVIP(PageData pd) {
		String reservationID = pd.getString("ReservationID");
		if (Tools.isEmpty(vipReservationID)) {
			error.put("init", ConfigFileReadError);
			return false;
		}

		if (Tools.isEmpty(reservationID)) {
			error.put("reservationid", ReservationIdNull);
			return false;
		}

		if (reservationID.equals(vipReservationID)) {
			return true;
		}
		return false;
	}

	public PageData generateVIPData(PageData pd) throws IOException {

		pd.put("Name", "VIP");
		pd.put("Type", "3");
		pd.put("State", "1");
		pd.put("CreatedDate",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		pd.put("VisitDate",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		pd.put("Memo", UuidUtil.get32UUID());// VIP照片用Memo命名
		return pd;

	}

}
