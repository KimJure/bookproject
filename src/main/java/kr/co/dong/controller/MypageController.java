package kr.co.dong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.book.bookDTO;
import kr.co.dong.help.HelpDTO;
import kr.co.dong.member.MemberDTO;
import kr.co.dong.mypage.MypageDTO;
import kr.co.dong.mypage.MypageService;
import kr.co.dong.reply.ReplyDTO;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MypageService service;
	
	//대여
	@ResponseBody
	@RequestMapping(value = "rental", method = { RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=UTF-8")
	public ModelAndView rental(HttpServletRequest request, HttpSession session,
							    @RequestParam(defaultValue = "1") int page,
							    @RequestParam(defaultValue = "10") int pageSize,
							    @RequestParam(defaultValue = "default") String sortBy,
							    @RequestParam(defaultValue = "") String keyword
							) throws Exception {
	    ModelAndView mav = new ModelAndView();
	    
	    Map user    = (Map)session.getAttribute("user");
	    String id = (String) user.get("id");
	    System.out.println("세션에 저장되어 있는 변수: " + id);
	
	    int totalCount = service.getTotalCount1(id);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        
        
        int startIdx = (page - 1) * pageSize;
        int endIdx = pageSize;

	    List<MypageDTO> rental = service.getListByRange1(startIdx, endIdx, keyword, sortBy, id);

	    for (MypageDTO rentalItem : rental) {
	        rentalItem.checkOverdue();
	        int overdue = rentalItem.getOverdue();
	        String status = overdue == 1 ? "연체중" : "-";
	        rentalItem.setStatus(status);
	    }

	    mav.addObject("rental", rental);
	    mav.addObject("currentPage", page);
        mav.addObject("totalPages", totalPages);
        mav.addObject("keyword", keyword);
	    mav.setViewName("rental");
	    
	    System.out.println("페이지수"+totalCount);
	    System.out.println("페이지수"+totalPages);
	    return mav;
	}
	
	//반납버튼 클릭
	@ResponseBody
	@RequestMapping(value="returngo", method= RequestMethod.POST)
	public int returngo(MypageDTO MypageDTO) {
		return service.returngo(MypageDTO);
	}
	
	@ResponseBody
	@RequestMapping(value="returnbook", method= RequestMethod.POST)
	public int returnbook(bookDTO BookDTO) {
		return service.returnbook(BookDTO);
	}
	
	//반납
	@ResponseBody
	@RequestMapping(value="returnlist", method= { RequestMethod.GET, RequestMethod.POST }, produces = "application/text; charset=UTF-8")
	public ModelAndView returnlist(HttpServletRequest request, HttpSession session,
	           @RequestParam(defaultValue = "1") int page,
	           @RequestParam(defaultValue = "10") int pageSize,
	           @RequestParam(defaultValue = "default") String sortBy,
	           @RequestParam(defaultValue = "") String keyword
	       ) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Map user    = (Map)session.getAttribute("user");
	    String id = (String) user.get("id");
	    System.out.println("세션에 저장되어 있는 변수: " + id);
		
		int totalCount = service.getTotalCount(id);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        
        int startIdx = (page - 1) * pageSize;
        int endIdx = pageSize;
		
		List<MypageDTO> returnlist = service.getListByRange(startIdx, endIdx, keyword, sortBy, id);
		
		mav.addObject("returnlist", returnlist);
		mav.addObject("currentPage", page);
        mav.addObject("totalPages", totalPages);
        mav.addObject("keyword", keyword);
		mav.setViewName("returnlist");
		
		System.out.println("페이지수"+totalCount);
		System.out.println("페이지수"+totalPages);
		return mav;
	}
	
	//회원탈퇴창
	@RequestMapping(value="myDelete", method=RequestMethod.GET)
	public String myDelete() {
		return "myDelete";
	}
	
	//회원탈퇴 클릭
	@ResponseBody
	@RequestMapping(value="myDelete", method= RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public int myDelete(HttpServletRequest request, HttpSession session, MemberDTO MemberDTO) {
		Map user = (Map)session.getAttribute("user");
	    String id = (String) user.get("id");
	    System.out.println("세션에 저장되어 있는 변수: " + id);
	   
	    MemberDTO.setId(id);
		return service.myDelete(MemberDTO);
	}
	
	//내정보수정 페이지
	@RequestMapping(value="myUpdate", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/text; charset=UTF-8")
	   public String myUpdate(HttpServletRequest request, HttpSession session, Model model) {
			Map user = (Map)session.getAttribute("user");
			String id = (String) user.get("id");
		    System.out.println("세션에 저장되어 있는 변수: " + id);
		
			MemberDTO MemberDTO = service.memberDetail(id);
			model.addAttribute("MemberDTO", MemberDTO);
	      return "myUpdate";
	   }
	
	    //정보수정 클릭
		@RequestMapping(value="myUpdate", method=RequestMethod.POST)
		public String myUpdate(MemberDTO MemberDTO) {
			logger.info("myUpdate:"+MemberDTO);
			service.myUpdate(MemberDTO);
			
			return "redirect:rental";
		}
	
		//내게시글
		@ResponseBody
    	@RequestMapping(value="myBoard", method= { RequestMethod.GET, RequestMethod.POST }, produces = "application/text; charset=UTF-8")
    	public ModelAndView myBoard(HttpServletRequest request, HttpSession session,
							    		@RequestParam(defaultValue = "1") int page,
							  		    @RequestParam(defaultValue = "10") int pageSize,
							  		    @RequestParam(defaultValue = "default") String sortBy,
							  		    @RequestParam(defaultValue = "") String keyword
							  		) throws Exception {
			    		ModelAndView mav = new ModelAndView();
			    		
			    		Map user    = (Map)session.getAttribute("user");
			    	    String id = (String) user.get("id");
			    	    System.out.println("세션에 저장되어 있는 변수: " + id);
			    		
				    	  int totalCount = service.getTotalCount2(id);
				          int totalPages = (int) Math.ceil((double) totalCount / pageSize);
				          
				          int startIdx = (page - 1) * pageSize;
				          int endIdx = pageSize;
				
				    		
				    	  List<BoardDTO> myBoard = service.getListByRange2(startIdx, endIdx, keyword, sortBy, id);
				    	  mav.addObject("myBoard", myBoard);
				    	  mav.addObject("currentPage", page);
				          mav.addObject("totalPages", totalPages);
				          mav.addObject("keyword", keyword);
				    	  mav.setViewName("myBoard");
				    		
				    	  System.out.println("페이지수"+totalCount);
				          System.out.println("sortBy"+sortBy);
				    	  return mav;
				    	}
		
		//연장버튼 클릭
		@ResponseBody
		@RequestMapping(value="extendDate", method= RequestMethod.POST)
		public int extendDate(MypageDTO MypageDTO) {
			return service.extendDate(MypageDTO);
		}
		
		//내댓글
		@ResponseBody
		@RequestMapping(value="myReply", method= { RequestMethod.GET, RequestMethod.POST }, produces = "application/text; charset=UTF-8")
		public ModelAndView myReply(HttpServletRequest request, HttpSession session,
									@RequestParam(defaultValue = "1") int page,
								    @RequestParam(defaultValue = "10") int pageSize,
								    @RequestParam(defaultValue = "default") String sortBy,
								    @RequestParam(defaultValue = "") String keyword
								) throws Exception {
			ModelAndView mav = new ModelAndView();
			
			Map user    = (Map)session.getAttribute("user");
		    String id = (String) user.get("id");
		    System.out.println("세션에 저장되어 있는 변수: " + id);
			
			int totalCount = service.getTotalCount3(id);
	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	        
	        int startIdx = (page - 1) * pageSize;
	        int endIdx = pageSize;

			
			List<ReplyDTO> myReply = service.getListByRange3(startIdx, endIdx, keyword, sortBy, id);
			mav.addObject("myReply", myReply);
			mav.addObject("currentPage", page);
	        mav.addObject("totalPages", totalPages);
	        mav.addObject("keyword", keyword);
			mav.setViewName("myReply");
			
			System.out.println("페이지수"+totalCount);
	        System.out.println("sortBy"+sortBy);
			return mav;
		}
		
		
		   //내문의내역
	       @ResponseBody
		   @RequestMapping(value="myHelplist", method= { RequestMethod.GET, RequestMethod.POST }, produces = "application/text; charset=UTF-8")
		   public ModelAndView myHelplist(HttpServletRequest request, HttpSession session,
			           @RequestParam(defaultValue = "1") int page,
			           @RequestParam(defaultValue = "10") int pageSize,
			           @RequestParam(defaultValue = "default") String sortBy,
			           @RequestParam(defaultValue = "") String keyword
			       ) throws Exception {
				ModelAndView mav = new ModelAndView();
				
				Map user    = (Map)session.getAttribute("user");
			    String id = (String) user.get("id");
			    System.out.println("세션에 저장되어 있는 변수: " + id);
				
				int totalCount = service.getTotalCount4(id);
		        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		     
		           
		           int startIdx = (page - 1) * pageSize;
		           int endIdx = pageSize;
				
				List<HelpDTO> myHelplist = service.getListByRange4(startIdx, endIdx, keyword, sortBy, id);
				
				mav.addObject("myHelplist", myHelplist);
				mav.addObject("currentPage", page);
		        mav.addObject("totalPages", totalPages);
		        mav.addObject("keyword", keyword);
				mav.setViewName("myHelplist");
				
				System.out.println("페이지수"+totalCount);
		        System.out.println("sortBy"+sortBy);
				return mav;
			}
			
			//문의내역 상세 페이지 이동
		    @RequestMapping(value="helpDetail", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
		    public String helpDetail(HttpServletRequest request, HttpSession session,
		    						@RequestParam("hno") int hno, Model model) {
		    	Map user = (Map)session.getAttribute("user");
			    String id = (String) user.get("id");
			    System.out.println("세션에 저장되어 있는 변수: " + id);
			    
		    	HelpDTO helpDetail = service.helpDetail(hno, id);
				model.addAttribute("helpDetail", helpDetail);
				return "helpDetail";
		    }



}