package com.zhzg.track;

import java.util.EnumMap;

public interface  ParaEnum {
	enum UserInfo {
		SmartBallID,ReservationID,MAC,startTime,endTime
    }
	public EnumMap<UserInfo, Object> getUserInfoByName(String name);
}
