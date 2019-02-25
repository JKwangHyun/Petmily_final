package aaa.bbb.ccc.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import aaa.bbb.ccc.util.BoardService;
import aaa.bbb.ccc.vo.MemberVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService nDao ;
	
	@RequestMapping(value="/sharingInfo")
	public String sharingInfo() {
		return "board/sharingInfo";
	}
	
	// Info Insert
	@RequestMapping(value="/infoInsert")
	public ModelAndView infoInsert(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map)
					throws ServletException, IOException {
		
		nDao.infoInsert(map);
		mav.setViewName("redirect:infoList");
		return mav ;
	}
	
	// Info List
	@RequestMapping(value="/infoList")
	public ModelAndView infoList(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map)
					throws ServletException, IOException {
		int totalCount = nDao.infoPageCount();
		int cPage=1 ;
		if (request.getParameter("currPage")!=null) {
			cPage=Integer.parseInt(request.getParameter("currPage"));    
		}
			
		int perPage = 5;
				
		int skip = 0 ;
		if (cPage>1) {
			skip = (cPage-1)*perPage ;
		}
		int fno = skip+1 ;        
		int lno = skip+perPage ;  

		map.put("fno", fno);
		map.put("lno", lno);
		List<Map<Integer,Object>> infoList =  nDao.infoList(map);
				
		int totalPage = totalCount / perPage ;
		if (totalCount % perPage !=0) totalPage++ ;
				
		mav.addObject("infoList", infoList);
		mav.addObject("totalPage", totalPage);
		mav.addObject("currPage", cPage);
		mav.setViewName("board/sharingInfo");
		return mav ;
	}
	
	// Info Detail
	@RequestMapping(value="/infoDetail")
	public ModelAndView infoDetail(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map)
					throws ServletException, IOException {
		Map<Object,Object> infoDetail = nDao.infoDetail(map);
		mav.addObject("infoDetail", infoDetail);
		mav.setViewName("board/sharingInfo_Detail");
		return mav;
	}
	
	// InfoRely Insert
	@RequestMapping(value="/infoReplyInsert")
	public ModelAndView infoRelyInsert(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map,RedirectAttributes redirectAttributes)
					throws ServletException, IOException {
		int step = Integer.valueOf((String)map.get("step"));
		int indent = Integer.valueOf((String)map.get("indent"));
		int root1 = 0;
		if(map.get("seq")!=null) {
			root1 = Integer.valueOf((String)map.get("seq"));
		}
		map.put("root1", root1);
		map.put("step", ++step);
		map.put("indent", ++indent);
		nDao.infoReplyInsert(map);
		
		redirectAttributes.addAttribute("rootKey",map.get("root"));
		
		if(map.get("seq")!=null) {
			mav.setViewName("redirect:infoRReplyList");
			redirectAttributes.addAttribute("root1Key",root1);
		}else {
			mav.setViewName("redirect:infoReplyList");
		}
		return mav ;
	}
	
	// InfoReply List
	@RequestMapping(value="/infoReplyList")
	public ModelAndView infoReplyList(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map, @RequestParam(value = "rootKey",defaultValue = "defalutValue") String root)
					throws ServletException, IOException {
		if(!root.equals("defalutValue")) 
			map.put("root",root);
		
		List<Map<Integer,Object>> infoReplyList =  nDao.infoReplyList(map);
		
		mav.addObject("infoReplyList", infoReplyList);
		mav.setViewName("board/infoReplyList");
		return mav ;
	}
	
	// InfoRReply List
	@RequestMapping(value="/infoRReplyList")
	public ModelAndView infoRReplyList(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map,@RequestParam(value = "rootKey",defaultValue = "defalutValue") String root,@RequestParam(value = "root1Key",defaultValue = "defalutValue") String root1)
					throws ServletException, IOException {
		if(!root1.equals("defalutValue")) 
			map.put("root1",root1);
		else
			map.put("root1", map.get("seq"));
		
		if(!root.equals("defalutValue")) 
			map.put("root",root);
		
		List<Map<Integer,Object>> infoRReplyList =  nDao.infoRReplyList(map);
		
		mav.addObject("infoRReplyList", infoRReplyList);
		mav.setViewName("board/infoRReplyList");
		return mav ;
	}
	
	// Info Delete
	@RequestMapping(value="/infoDelete")
	public ModelAndView infoDelete(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map)
					throws ServletException, IOException {
		nDao.infoDelete(map);
		mav.setViewName("redirect:infoList");
		return mav ;
	}
	
	// Info Update
	@RequestMapping(value="/infoUpdate")
	public ModelAndView infoUpdate(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map)
					throws ServletException, IOException {
		nDao.infoUpdate(map);
		mav.setViewName("redirect:infoList");
		return mav ;
	}
	
	@RequestMapping(value="/noticeInsert")
	   public ModelAndView noticeInsert(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 nDao.nInsert(map);
		 mav.setViewName("redirect:noticeList");
	      return mav;
	   }
	
	@RequestMapping(value="/noticeList")
	   public ModelAndView noticeList(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 int totalCount = nDao.totalCount();
		 
		 int cPage=1;
		 if(request.getParameter("currPage")!=null) {
			 cPage = Integer.parseInt(request.getParameter("currPage"));
		 }
		 
		 int perPage = 10;
		 int skip = 0;
		 
		 if(cPage>1) {
			 skip = (cPage-1)*perPage;
		 }
		 int fno = skip+1;
		 int lno = skip+perPage;
		 
		 map.put("fno",fno);
		 map.put("lno",lno);
		 
		 List<Map<String,Object>> noticeList = nDao.noticeList(map);
		 
		 int totalPage = totalCount / perPage;
		 if(totalCount % perPage != 0) totalPage++;
		 
		 mav.addObject("notice",noticeList);
		 mav.addObject("totalPage", totalPage);
		 mav.addObject("currPage", cPage);
		mav.setViewName("board/noticeList");
	      return mav;
	   }

	@RequestMapping(value="/noticeDetail")
	   public ModelAndView noticeDetail(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav,MemberVO mvo)
			  throws ServletException, IOException{
		
		HttpSession session = request.getSession();
		mvo = (MemberVO)session.getAttribute("Login");
		if(mvo!=null) {
			if(!mvo.getId().equals("admin"))
				nDao.countUp(map);
		}else nDao.countUp(map);
		
		Map<String,Object> detail = nDao.noticeDetail(map);
		mav.addObject("detail",detail);
		
		if (mvo!=null) {
			if (mvo.getId().equals("admin")) 
				mav.setViewName("board/noticeDetailA");
			else 
				mav.setViewName("board/noticeDetail");
		}   else
			mav.setViewName("board/noticeDetail");
		 
	      return mav;
	   }
	
	@RequestMapping(value="/noticeUpdate")
	   public ModelAndView noticeUpdate(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 nDao.noticeUpdate(map);
		 mav.setViewName("redirect:noticeList");
	      return mav;
	   }
	
	@RequestMapping(value="/noticeDelete")
	   public ModelAndView noticeDelete(@RequestParam Map<String,Object> map,HttpServletRequest request, ModelAndView mav)
			  throws ServletException, IOException{
		
		 nDao.noticeDelete(map);
		 mav.setViewName("redirect:noticeList");
	      return mav;
	   }

}