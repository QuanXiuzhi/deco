package calendar.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("calendarMapper")
public interface CalendarMapper {

	List<Map<String, Object>> selectCalenderList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectDetail(String no) throws Exception;

	int writeAll(Map<String, Object> params) throws Exception;

	HashMap<String, Object> selectLast(int tempMember) throws Exception;

	int insertImage(Map<String, Object> params) throws Exception;

	// 0525 여림추가
	int updatePtHit(Map<String, Object> map) throws Exception;

	Map<String, Object> selectCalenderDetailInfo(Map<String, Object> map) throws Exception;

	void updateptLike(Map<String, Object> map) throws Exception;

	void insetPostLikemap(Map<String, Object> map) throws Exception;

	int selectPostLikeCount(Map<String, Object> map) throws Exception;

	EgovMap selectMember(Map<String, Object> paramMap) throws Exception;

	

}
