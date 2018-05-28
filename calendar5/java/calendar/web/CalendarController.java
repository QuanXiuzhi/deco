package calendar.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import calendar.service.CalendarService;

@Controller
public class CalendarController {

	private static final String UPLOAD_PATH = "C:\\tmp1";
	
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
	public String calendar(HttpServletRequest request, ModelMap model) throws Exception {
		List<Map<String, Object>> map = calendarService.selectCalenderList();
		model.addAttribute("map", map);

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null || id.equals("")) {
			return "redirect:modalLogin.do";
		}

		return "calendar";
	}

	// 0525 여림 수정
	@RequestMapping("view_hs.do")
	public String popup(ModelMap model, @RequestParam Map<String, Object> map) throws Exception { // 리퀘스트파람 맵으로 변경.
		int hit = calendarService.updatePtHit(map); // mvc하기(쿼리까지) 젤위에 위치해야 조회수가 올라가고 화면에 띄워서 조회수가 올란한 후에 봄.

		Map<String, Object> detailInfo = calendarService.selectCalenderDetailInfo(map); // map으로 보내고

		model.addAttribute("detailInfo", detailInfo);

		System.out.println(detailInfo);

		return "view_hs";
	}

	// 0528 문기 화면 추가
	@RequestMapping("search.do")
	public String search(ModelMap model) throws Exception { // 리퀘스트파람 맵으로 변경.

		return "search";
	}

	/*
	 * @RequestMapping("titles.do") public String titles() throws Exception {
	 * 
	 * return "titles"; }
	 */
	@RequestMapping("editor.do")
	public String editor() throws Exception {

		return "editor";
	}

	// 수지야 바탕화면 오른쪽 하단에 메모장 있음~~ 그거 보고 참고해~~~~~ 낼봐~~
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String plus(@RequestParam(value = "title", required = true) String title,
			//@RequestParam(value = "mbNo", required = true) String mbNo, 
			@RequestParam(value = "date", required = true) String date,
			//@RequestParam(value = "show", required = true) String show,
			MultipartHttpServletRequest imgFiles,//=============>이미지, 동영상 업로드용 리퀘스트임 (사진여러개 받을수 잇음), 리퀘스트파람으로 받으면 파일 1개만 받을수 잇음.
			ModelMap modelMap) {
		
		//파일 업로드---------------------------------------------------
		//지금으로써는 딱히 필요 없음  : result
		String result = "";
		ArrayList<String> names = new ArrayList<String>();
		
		Iterator<String> it = imgFiles.getFileNames();  	 // 겟 네임즈 처럼 화면에서 보내온 파일이름들을 다 받아서 it에 넣어줌
		
		while (it.hasNext()) {
			String key = (String) it.next();   		 // it들어있는 파일이름들을 key에 넣어줌
		
			MultipartFile f = imgFiles.getFile(key);  // key의 값을 뽑아서 변수 value에 넣어줌.
			
			System.out.println("파일 업로드");
			System.out.println("파일 이름 : " + f.getOriginalFilename());
			names.add(f.getOriginalFilename());
			System.out.println("파일 크기 : " + f.getSize());
			
	        result += saveFile(f);
		}
		System.out.println(names);
		/*	
	 	for(MultipartFile f : files) {
			
			System.out.println("파일 업로드");
			System.out.println("파일 이름 : " + f.getOriginalFilename());
			names.add(f.getOriginalFilename());
			System.out.println("파일 크기 : " + f.getSize());
			
	        result += saveFile(f);
	    }
		*/

		
		/*
		System.out.println("파일 업로드");
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		String name = file.getOriginalFilename();
		System.out.println("파일 크기 : " + file.getSize());
		
        try(
                // 맥일 경우 
                //FileOutputStream fos = new FileOutputStream("/tmp/" + file.getOriginalFilename());
                // 윈도우일 경우
                FileOutputStream fos = new FileOutputStream("c:/tmp/" + file.getOriginalFilename());
                InputStream is = file.getInputStream();
        ){
        	    int readCount = 0;
        	    byte[] buffer = new byte[1024];
            while((readCount = is.read(buffer)) != -1){
                fos.write(buffer,0,readCount);
            }
        }catch(Exception ex){
            throw new RuntimeException("file Save Error");
        }
        */
        //---------------------------------------------------------
		
		//db로 
		int tempMember = 1;
		int tempShow = 1;
	

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("title", title);
		params.put("mbNo", tempMember);
		params.put("date", date);
		params.put("show", tempShow);
		

		//mapper를 통해 sql.xml로
		//sql : writeAll
		try {
			calendarService.writeAll(params);
			
			HashMap<String, Object> map = calendarService.selectLast(tempMember);
			//System.out.println(map);
			//System.out.println(map.get("MAX(PT_NO)"));

			params.put("ptNo", map.get("MAX(PT_NO)"));
			for(String name : names) {
				params.put("name", name);
				
				calendarService.insertImage(params);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		//jsp로
		modelMap.addAttribute("member", tempMember);

		return "calendar";
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

}
