package com.zhzg.entity.system;
/**
 * 
* 类名称：Revervations.java
* 类描述： 
* @author ZZC
* 作者单位： 
* 联系方式：
* 创建时间：2016年7月15日
* @version 1.0
 */
import java.util.Date;


public class Reservation {
	private Integer ReservationID;    //预约ID 
	private String Type         ;     //预约类型  
	private String BeginNumber  ;     //起始预约号
	private String EndNumber    ;     //终止预约号    
	private Date BookingDate  ;       //预计参观日期  
	private String State        ;     //预约有效标志  
	private String Name         ;     //姓名          
	private Integer Sex          ;    //性别          
	private Integer Age          ;    //年龄          
	private Integer OccupationID ;    //职业ID        
	private String PositionID   ;     //职务ID        
	private String Organization ;     //工作单位      
	private String Mail         ;     //邮箱          
	private String Region       ;     //地区          
	private String Phone        ;     //联系电话      
	private String GroupName    ;     //团体名称      
	private Integer GroupNumber  ;    //团体人数      
	private Integer IndustryID   ;    //团体所属行业ID
	private String Memo         ;     //备注               
	private String CreatedBy    ;     //创建人     
	private String CreatedDate  ;     //创建时间   
	private String ModifiedBy   ;     //修改人     
	private Date ModifiedDate ;       //修改时间   
	                                          
	
	//get set方法
	public Integer getReservationID() {
		return ReservationID;
	}
	public void setReservationID(Integer reservationID) {
		ReservationID = reservationID;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getBeginNumber() {
		return BeginNumber;
	}
	public void setBeginNumber(String beginNumber) {
		BeginNumber = beginNumber;
	}
	public String getEndNumber() {
		return EndNumber;
	}
	public void setEndNumber(String endNumber) {
		EndNumber = endNumber;
	}
	public Date getBookingDate() {
		return BookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		BookingDate = bookingDate;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public Integer getSex() {
		return Sex;
	}
	public void setSex(Integer sex) {
		Sex = sex;
	}
	public Integer getAge() {
		return Age;
	}
	public void setAge(Integer age) {
		Age = age;
	}
	public Integer getOccupationID() {
		return OccupationID;
	}
	public void setOccupationID(Integer occupationID) {
		OccupationID = occupationID;
	}
	public String getPositionID() {
		return PositionID;
	}
	public void setPositionID(String positionID) {
		PositionID = positionID;
	}
	public String getOrganization() {
		return Organization;
	}
	public void setOrganization(String organization) {
		Organization = organization;
	}
	public String getMail() {
		return Mail;
	}
	public void setMail(String mail) {
		Mail = mail;
	}
	public String getRegion() {
		return Region;
	}
	public void setRegion(String region) {
		Region = region;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getGroupName() {
		return GroupName;
	}
	public void setGroupName(String groupName) {
		GroupName = groupName;
	}
	public Integer getGroupNumber() {
		return GroupNumber;
	}
	public void setGroupNumber(Integer groupNumber) {
		GroupNumber = groupNumber;
	}
	public Integer getIndustryID() {
		return IndustryID;
	}
	public void setIndustryID(Integer industryID) {
		IndustryID = industryID;
	}
	public String getMemo() {
		return Memo;
	}
	public void setMemo(String memo) {
		Memo = memo;
	}
	public String getCreatedBy() {
		return CreatedBy;
	}
	public void setCreatedBy(String createdBy) {
		CreatedBy = createdBy;
	}
	public String getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(String createdDate) {
		CreatedDate = createdDate;
	}
	public String getModifiedBy() {
		return ModifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		ModifiedBy = modifiedBy;
	}
	public Date getModifiedDate() {
		return ModifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		ModifiedDate = modifiedDate;
	}
	
	
}
