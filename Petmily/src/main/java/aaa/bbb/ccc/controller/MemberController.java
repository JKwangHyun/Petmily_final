package aaa.bbb.ccc.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import aaa.bbb.ccc.util.AdoptionService;
import aaa.bbb.ccc.util.MemberService;
import aaa.bbb.ccc.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService mDao ;

	@Autowired
	private AdoptionService aDao ;
	
	@RequestMapping(value="/")
	public ModelAndView home(HttpServletRequest request,MemberVO mvo,ModelAndView mav,@RequestParam Map<String,Object> map) {
		
		List<Map<String,Object>> list = aDao.adoptionList(map);
		mav.addObject("list",list);
		mav.setViewName("test1");
		return mav;
	}
	
	@RequestMapping(value="/home")
	public ModelAndView home1(HttpServletRequest request,MemberVO mvo,ModelAndView mav,@RequestParam Map<String,Object> map) {
		
		List<Map<String,Object>> list = aDao.adoptionList(map);
		mav.addObject("list",list);
		mav.setViewName("test1");
		return mav;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mav, MemberVO mvo)  
			throws ServletException, IOException {
		mvo = mDao.memberDetail(mvo);
		HttpSession session = request.getSession() ;
		session.setAttribute("Login", mvo);
		
		mav.addObject("idcheck", mvo);
		mav.setViewName("member/logincheck");
		return mav;
	} // login	
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mav)  
			throws ServletException, IOException {
		HttpSession session = request.getSession() ;
		session.invalidate();
		
		mav.setViewName("redirect:home");
		return mav;
	} // logout
	
	@RequestMapping(value="/idcheck")
	public ModelAndView joinCheck(HttpServletRequest request, ModelAndView mav, MemberVO mvo)  
			throws ServletException, IOException {
		mvo = mDao.idcheck(mvo);

		mav.addObject("idcheck", mvo);
		mav.setViewName("member/idcheck");
		return mav;
	} // idcheck
	
	@RequestMapping(value="/findID")
	public ModelAndView findID(HttpServletRequest request, ModelAndView mav, MemberVO mvo)  
			throws ServletException, IOException {
		mvo = mDao.findId(mvo);

		mav.addObject("findId", mvo);
		mav.setViewName("member/findId");
		return mav;
	} 
	
	@RequestMapping(value="/findPW")
	public ModelAndView findPW(HttpServletRequest request, ModelAndView mav, MemberVO mvo)  
			throws ServletException, IOException {
		mvo = mDao.findPw(mvo);
		
		mav.addObject("findPw", mvo);
		mav.setViewName("member/findPw");
		return mav;
	} 
	
	@RequestMapping(value="/newPW")
	public ModelAndView newPW(HttpServletRequest request,ModelAndView mav, MemberVO mvo)  
			throws ServletException, IOException {
		mDao.newPw(mvo);
		
		mav.setViewName("redirect:home");
		return mav;
	}
	
	@RequestMapping(value="/myPage")
	public ModelAndView myPage(HttpServletRequest request,ModelAndView mav,@RequestParam Map<String,Object> map) {
		
		List<Map<String,Object>> myAlist = aDao.myAlist(map);
		mav.addObject("list",myAlist);
		
		mav.setViewName("member/myPage");
		return mav;
	}
	
	@RequestMapping(value="/memberDeleteForm")
	public String memberDeleteForm(HttpServletRequest request,MemberVO mvo) {
		return "member/memberDeleteForm";
	}
	
	@RequestMapping(value="/updateForm")
	public ModelAndView updateForm(HttpServletRequest request,MemberVO mvo,ModelAndView mav) {
		
		HttpSession session = request.getSession();
		mvo = (MemberVO)session.getAttribute("Login");
	   
		String detail = mvo.getDetail();
		int index = detail.indexOf("-");
		String detail1 = detail.substring(0,index);
		String detail2 = detail.substring(index+1);
		  
		mav.addObject("detail1",detail1);
		mav.addObject("detail2",detail2);
		mav.setViewName("member/updateForm");
		return mav;
	 }//updateForm
	
	@RequestMapping(value="/memberjoin")
	public ModelAndView memberjoin(HttpServletRequest request,ModelAndView mav,MemberVO mvo) {
		
		mDao.memberInsert(mvo);
		mav.setViewName("test1");
		return mav;
	}//memberJoin
	
	@RequestMapping(value="/mdelete")
	public ModelAndView mdelete(HttpServletRequest request, ModelAndView mav,MemberVO mvo)  
			throws ServletException, IOException {
		HttpSession session = request.getSession() ;
		mvo = (MemberVO)session.getAttribute("Login");
		
		int result = mDao.memberDelete(mvo);
		if(result>0) {
			session.invalidate();
			mav.setViewName("redirect:home");
		}
		return mav;
	} // logout
	
	@RequestMapping(value="/memberUpdate")
	public ModelAndView memberUpdate(HttpServletRequest request, ModelAndView mav,MemberVO mvo)  
			throws ServletException, IOException {
		
		String pw="";
		
		if(mvo.getPw()!=null) {
			pw = mvo.getPw();
			
		}
		String exp = mvo.getExp();
		String detail1 = mvo.getDetail1();
		String detail2 = mvo.getDetail2();
		
		HttpSession session = request.getSession() ;
		mvo = (MemberVO)session.getAttribute("Login");

		if(pw=="") {
			pw = mvo.getPw();
		}
		
		mvo.setPw(pw);
		mvo.setExp(exp);
		mvo.setDetail1(detail1);
		mvo.setDetail2(detail2);
		
		int result =mDao.memberUpdate(mvo);
		
		if(result>0) {
		mvo = mDao.idcheck(mvo);
		mav.setViewName("member/myPage");
		session.invalidate();
		HttpSession session2 = request.getSession() ;
		session2.setAttribute("Login", mvo);
		}
		return mav;
	} // logout
	
	@RequestMapping(value="/imgUpload")
	public ModelAndView imgUpload(HttpServletRequest request, ModelAndView mav,MemberVO mvo)  
			throws ServletException, IOException {
		
		MultipartFile uploadfilef = mvo.getUploadfilef(); 
		String fname1, fname2 = "NoImage" ;
		
		if (!uploadfilef.isEmpty()) {
			fname1="C:/Users/장광현/git/Petmily02/Petmily/src/main/webapp/resources/img/"+uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(fname1)); 
			fname2="resources/img/"+uploadfilef.getOriginalFilename();
		}
		
		mvo.setMyimage(fname2);
		mDao.imgUpdate(mvo);
		String img = mvo.getMyimage();
		HttpSession session = request.getSession() ;
		mvo = (MemberVO)session.getAttribute("Login");
		mvo.setMyimage(img);
		session.setAttribute("Login", mvo);
		
		mav.setViewName("member/myImage");
		
		return mav;
	} // logout
	
	@RequestMapping(value="/hospitalList")
	public void hospitalList (HttpServletResponse response,HttpServletRequest request) throws IOException {
			request.setCharacterEncoding("utf-8");
	        response.setContentType("text/html; charset=utf-8"); 
			
			String addr ="https://openapi.gg.go.kr/Animalhosptl?KEY=";
		    String key = "4e8fbc01934d4249acc925456b0b8e9b";
		    String parameter = "";
	     
	     	String SIGUN_NM = URLEncoder.encode(request.getParameter("sigun_nm"), "utf-8");

	     	PrintWriter out = response.getWriter();
	        parameter = parameter + "&" + "SIGUN_NM="+SIGUN_NM;      //JSP에서 받아올 contentid, contentTypeid
	        parameter = parameter + "&" + "Type=json";
	        
	        addr = addr + key + parameter ;
	        URL url = new URL(addr);
	        
	        System.out.println(url);
	        
	        InputStream in = url.openStream();                            //URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기
	        
	        ByteArrayOutputStream bos1 = new ByteArrayOutputStream();        //InputStream의 데이터들을 바이트 배열로 저장하기 위해
	        in = IOUtils.toInputStream(IOUtils.toString(in), "UTF-8");
	        IOUtils.copy(in, bos1);           
	        in.close();
	        bos1.close();
	 
	        String mbos = bos1.toString("UTF-8");
	        
	        byte[] b = mbos.getBytes("UTF-8");
	        String s = new String(b, "UTF-8");        //String으로 풀었다가 byte배열로 했다가 다시 String으로 해서 json에 저장할 배열을 print?? 여긴 잘 모르겠다
	        out.println(s);
	        System.out.println(s);
	        response.setContentType("text/html;charset=UTF-8");
	        JSONObject json = new JSONObject();
	        json.put("data", s);
	        System.out.println(json);
	    }
}