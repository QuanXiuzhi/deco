package calendar.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("calendarMapper")
public interface CalendarMapper {

	List<Map<String, Object>> selectCalenderList() throws Exception;

	List<Map<String, Object>> selectDetail(String no) throws Exception;

	Object writeAll(Map<String, Object> params) throws Exception;

	HashMap<String, Object> selectLast(int tempMember) throws Exception;

	HashMap<String, Object> insertImage(Map<String, Object> params) throws Exception;

	// 0525 여림추가
	int updatePtHit(Map<String, Object> map) throws Exception;

	Map<String, Object> selectCalenderDetailInfo(Map<String, Object> map) throws Exception;

}
