package calendar.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import calendar.service.CalendarService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {
	
	@Resource(name = "calendarMapper")
	private CalendarMapper calendarMapper;

	@Override
	public List<Map<String, Object>> selectCalenderList(Map<String, Object> map) throws Exception {
		
		return calendarMapper.selectCalenderList(map);
	}

	@Override
	public List<Map<String, Object>> selectDetail(String no) throws Exception {
		// TODO Auto-generated method stub
		return calendarMapper.selectDetail(no);
	}

	@Override
	public int writeAll(Map<String, Object> params) {
		// TODO Auto-generated method stub
		try {
			return calendarMapper.writeAll(params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}

	@Override
	public HashMap<String, Object> selectLast(int tempMember) throws Exception {
		// TODO Auto-generated method stub
		return calendarMapper.selectLast(tempMember);
	}

	@Override
	public int insertImage(Map<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return calendarMapper.insertImage(params);
	}

	// 0525 여림 추가
	@Override
	public int updatePtHit(Map<String, Object> map) throws Exception {
		
		return calendarMapper.updatePtHit(map);
	}

	// 0525 여림 추가
	@Override
	public Map<String, Object> selectCalenderDetailInfo(Map<String, Object> map) throws Exception {
		
		return calendarMapper.selectCalenderDetailInfo(map);
	}

	@Override
	public void updateptLike(Map<String, Object> map) throws Exception {
		calendarMapper.updateptLike(map);
		
	}

	@Override
	public void insetPostLikemap(Map<String, Object> map) throws Exception {
		calendarMapper.insetPostLikemap(map);
		
	}

	@Override
	public int selectPostLikeCount(Map<String, Object> map) throws Exception {	
		return calendarMapper.selectPostLikeCount(map);
	}

	@Override
	public EgovMap selectMember(Map<String, Object> paramMap) throws Exception {	
		return calendarMapper.selectMember(paramMap);
	}

	


}
