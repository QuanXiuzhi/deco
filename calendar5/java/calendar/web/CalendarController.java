package calendar.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import calendar.service.CalendarService;
import calendar5.java.JsonUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CalendarController {

	private static final String SAVE_PATH = "/upload";
	private static final String PREFIX_URL = "/upload/";

	private static final String UPLOAD_PATH = "/upload";
	
	@Resource(name = "calendarService")
	private CalendarService calendarService;

	// 0525 여림추가
	@RequestMapping("main.do")
	public String main(ModelMap model) throws Exception {

		return "mainPage";
	}

	@RequestMapping(value = "modalLogin.do", method = RequestMethod.GET)
	public String modalLogin(ModelMap model) throws Exception {

		return "modalLogin";
	}

	@RequestMapping(value = "modalLogin.do", method = RequestMethod.POST)
	public String modalLogin(HttpServletRequest request, @RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {
		String id = (String) map.get("username");

		if (id == null || id.equals("")) {
			return "modalLogin";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);

			return "redirect:main.do";
		}

	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		session.setAttribute("id", "");

		return "redirect:main.do";
	}

	@RequestMapping("register.do")
	public String register(ModelMap model) throws Exception {

		return "register";
	}
	// 0525 여림추가 여기까지

	// 0525 여림 수정
	@RequestMapping("calendar.do")
	public String calendar(HttpServletRequest request,
			@RequestParam Map<String, Object> paramMap,
			ModelMap model) throws Exception {
		//id 세션 
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		paramMap.put("id", id);
		
		List<Map<String, Object>> map = calendarService.selectCalenderList(paramMap);
		model.addAttribute("map", map);

		

		if (id == null || id.equals("")) {
			return "redirect:modalLogin.do";
		}

		return "calendar";
	}

	// 0525 여림 수정
	@RequestMapping("view_hs.do")
	public String view_hs(HttpServletRequest request, 
						ModelMap model,
						@RequestParam Map<String, Object> map) throws Exception { // 리퀘스트파람 맵으로 변경.
		int hit = calendarService.updatePtHit(map); // mvc하기(쿼리까지) 젤위에 위치해야 조회수가 올라가고 화면에 띄워서 조회수가 올란한 후에 봄.

	
		
		Map<String, Object> detailInfo = calendarService.selectCalenderDetailInfo(map); // map으로 보내고

		model.addAttribute("detailInfo", detailInfo);
		//System.out.println(detailInfo);

		//id 세션 
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null || id.equals("")) {
			return "redirect:modalLogin.do";
		}

		return "view_hs";
	}
	
	
	
	@RequestMapping(value = "view_hs2.do")
	public void view_hs2(@RequestParam Map<String, Object> map,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception { 
		System.out.println(map);
		
		HashMap<String, Object> hashMap	= new HashMap<>();
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		try {
			
			if (id == null || id == "") {
				hashMap.put("result", "01");
				hashMap.put("msg", "비회원은 좋아요 할 수 없습니다.");
			} else {
				map.put("id", id);
				
				int count = calendarService.selectPostLikeCount(map);
				
				if (count > 0) {
					hashMap.put("result", "02");
					hashMap.put("msg", "이미 해당 게시물에 좋아요를 했습니다.");
				} else {
					calendarService.updateptLike(map);
					calendarService.insetPostLikemap(map);
					
					hashMap.put("mapKey", map);
					hashMap.put("result", "SUCCESS");
				}
			}
		} catch(Exception e) {
			hashMap.put("result", "03");
			hashMap.put("msg", "오류가 발생하였습니다. 다시 시도해 주시기 바랍니다.");
		}
		
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.write(JsonUtil.HashMapToJson(hashMap));
		
	}

	// 0528 문기 화면 추가
	@RequestMapping("search.do")
	public String search(ModelMap model) throws Exception { // 리퀘스트파람 맵으로 변경.

		return "search";
	}


	@RequestMapping("editor.do")
	public String editor( HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception {

		Map<String, Object> detailInfo = new HashMap<String, Object>();
		if(map.get("No")!=null) {
			System.out.println("No" + map.get("No"));
			detailInfo = calendarService.selectCalenderDetailInfo(map); // map으로 보내고

		}
		model.addAttribute("detailInfo", detailInfo);
		
		//id 세션 
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null || id.equals("")) {
			return "redirect:modalLogin.do";
		}		
				
		return "editor";
	}

	//0528  수지 수정 
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String plus( HttpServletRequest request,
			@RequestParam(value = "title", required = false) String title,
			//@RequestParam(value = "mbNo", required = true) String mbNo, 
			@RequestParam(value = "date", required = true) String date,
			@RequestParam(value = "show", required = true) String show,
			@RequestParam(value = "weather", required = false) String weather, //날씨
			@RequestParam(value = "place", required = false) String place, //장소
			@RequestParam(value = "tag", required = false) String tag, //태그
			@RequestParam(value = "price", required = false) String price, //비용
			@RequestParam(value = "contents", required = false) String contents, //내용
			//@RequestParam(required=false) ArrayList<MultipartFile> files,
			MultipartHttpServletRequest imgFiles,//=============>이미지, 동영상 업로드용 리퀘스트임 (사진여러개 받을수 잇음), 리퀘스트파람으로 받으면 파일 1개만 받을수 잇음.
			ModelMap modelMap) throws Exception {
		
		//id 세션 
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null || id.equals("")) {
			return "redirect:modalLogin.do";
		}		
				
		//파일 업로드---------------------------------------------------
		//지금으로써는 딱히 필요 없음  : result
		//String result = "";
		ArrayList<String> names = new ArrayList<String>();
		
		Iterator<String> it = imgFiles.getFileNames();  	 // 겟 네임즈 처럼 화면에서 보내온 파일이름들을 다 받아서 it에 넣어줌

		while (it.hasNext()) {
			String key = (String) it.next();   		 // it들어있는 파일이름들을 key에 넣어줌
			System.out.println("key : "+ key);
			
			
			List<MultipartFile> f = imgFiles.getFiles(key);  // key의 값을 뽑아서 변수 value에 넣어줌.
			
			for (MultipartFile multipartFile : f) {
				
				System.out.println("파일 업로드");
				System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());
				System.out.println("파일 크기 : " + multipartFile.getSize());
				names.add(saveFile(multipartFile));//multipartFile.getOriginalFilename());
				//result += saveFile(multipartFile);
			}
			
		}
		System.out.println(names);

		//-------------------------------------------------db로 
		//세션의 id를 이용해서 멤버 전체 정보 뽑아옴
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("id", id);
		
		EgovMap memberMap = calendarService.selectMember(paramMap);

		
		int mbNo = Integer.parseInt(memberMap.get("mbNo").toString());
		//int tempShow = 1;
	
		//db로 넘어갈 데이터들 정리
		Map<String, Object> params = new HashMap<String, Object>();
		
		Calendar calendar = Calendar.getInstance();
		if(title.equals("")) {
			title += (calendar.get(Calendar.MONTH)+1)+"월 "+calendar.get(Calendar.DATE)+"일 생성된 글";
		}
/*	    title += calendar.get(Calendar.YEAR);
	    fileName += calendar.get(Calendar.MONTH);
	    fileName += calendar.get(Calendar.DATE);
	    fileName += calendar.get(Calendar.HOUR);
	    fileName += calendar.get(Calendar.MINUTE);
	    fileName += calendar.get(Calendar.SECOND);
	    fileName += calendar.get(Calendar.MILLISECOND);
*/
   
		params.put("title", title);
		params.put("mbNo", mbNo);
		params.put("date", date);
		params.put("show", show);
		params.put("weather", weather);
		params.put("place", place);
		params.put("tag", tag);
		params.put("price", price);
		params.put("contents", contents);
		

		//mapper를 통해 sql.xml로
		//sql : writeAll
		try {
			//이미지 제외한 내용 ->post 테이블로
			calendarService.writeAll(params);
			
			//pt_no가져오기
			HashMap<String, Object> map = calendarService.selectLast(mbNo);
			params.put("ptNo", map.get("PT_NO"));
			
			
			for(String name : names) {
				params.put("name", name);
				params.put("imgUrl", PREFIX_URL+name);
				
				calendarService.insertImage(params);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		//jsp로
		modelMap.addAttribute("member", mbNo);

		return "redirect:calendar.do";
	}
	
	
	private String saveFile(MultipartFile file) {
	    // 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();

	    // 저장할 File 객체를 생성(껍데기 파일)ㄴ
	    File saveFile = new File(UPLOAD_PATH, saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	} // end saveFile
	
	@RequestMapping("photoTest.do")
	public String photoTest() throws Exception {

		return "photoTest";
	}

}
