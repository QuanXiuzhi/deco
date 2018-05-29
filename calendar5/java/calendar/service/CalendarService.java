package calendar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CalendarService {

	List<Map<String, Object>> selectCalenderList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectDetail(String no) throws Exception;

	int writeAll(Map<String, Object> params) throws Exception;//(insert)Error : unsupported return type

	HashMap<String, Object> selectLast(int tempMember) throws Exception;

	int insertImage(Map<String, Object> params) throws Exception;//(insert)Error : unsupported return type

	// 0525 여림 추가
	int updatePtHit(Map<String, Object> map) throws Exception;

	// 0525 여림 추가
	Map<String, Object> selectCalenderDetailInfo(Map<String, Object> map) throws Exception;

	void updateptLike(Map<String, Object> map) throws Exception;

	void insetPostLikemap(Map<String, Object> map) throws Exception;

	int selectPostLikeCount(Map<String, Object> map) throws Exception;

	EgovMap selectMember(Map<String, Object> paramMap) throws Exception;




}
