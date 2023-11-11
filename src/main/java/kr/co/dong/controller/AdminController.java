package kr.co.dong.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.admin.AdminService;
import kr.co.dong.board.BoardDTO;
import kr.co.dong.book.bookDTO;
import kr.co.dong.help.HelpDTO;
import kr.co.dong.member.MemberDAO;
import kr.co.dong.member.MemberDTO;
import org.springframework.web.servlet.view.RedirectView;
@Controller

public class AdminController {
	private final MemberDAO memberDAO;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	 public AdminController(MemberDAO memberDAO) {
        this.memberDAO = memberDAO;
    }
	
	
	@Autowired
	AdminService service;
	
	//관리자 페이지로 이동하기
	
	@RequestMapping(value = "board/adminHome", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		

		
		return "adminHome";
	}
	
	// 문의사항 답변 작성
		@RequestMapping(value="board/answerContent", method = RequestMethod.POST)
		public String answerContent (HelpDTO helpDTO) throws Exception{
			logger.info("내용 : " + helpDTO);
			logger.info("id 값: " + helpDTO.getId());
			
			int r = service.answerContent(helpDTO);
			
			return "redirect:adminHome"; //
		}
		
	// 문의사항 삭제
			@RequestMapping(value="board/helpDelete", method = RequestMethod.POST)
			public String helpDelete (HelpDTO helpDTO) throws Exception{
				
				int r = service.helpDelete(helpDTO);
				
				return "redirect:adminHelp"; // < 내 문의사항 이동으로 추후 수정
			}
	
			@RequestMapping(value="board/bookDelete", method = RequestMethod.POST)
			public String bookDelete (bookDTO BookDTO) throws Exception{
				
				int r = service.bookDelete(BookDTO);
				
				return "redirect:adminBook"; //
			}
			
	

	 

	 
	 //유저정보 수정 저장
	 @RequestMapping(value = "board/userUpdate", method = RequestMethod.POST)
	 public ModelAndView userUpdate(@ModelAttribute("memberDTO") MemberDTO memberDTO, @RequestParam("id") String id, Model model) {
	     logger.info("내용 : " + memberDTO);

	     // id 값을 memberDTO에 설정
	     memberDTO.setId(id);

	     try {
	         // 수정된 내용을 DB에 반영
	         int result = service.userUpdate(memberDTO);
	         if (result > 0) {
	             RedirectView redirectView = new RedirectView();
	             redirectView.setUrl("userDetail");
	             redirectView.addStaticAttribute("id", memberDTO.getId());
	             return new ModelAndView(redirectView);
	         } else {
	             // 수정 실패 시 에러 메시지를 설정하여 반환
	             model.addAttribute("errorMessage", "회원 정보 수정에 실패했습니다.");
	             return new ModelAndView("redirect:userUpdateview"); // 에러 페이지로 이동
	         }
	     } catch (Exception e) {
	         // 예외 발생 시 에러 메시지를 설정하여 반환
	         model.addAttribute("errorMessage", "오류가 발생했습니다: " + e.getMessage());
	         return new ModelAndView("redirect:userUpdateview"); // 에러 페이지로 이동
	     }
	 }
	 
	// 유저정보 탈퇴하기
	
		@RequestMapping(value="board/userDelete", method = RequestMethod.POST)
		public String userDelete (@RequestParam("id") String id) throws Exception {
		    
		    // 숨김 처리를 위한 업데이트 작업 수행
		    int result = service.userDelete(id);
		    
		    return "redirect:userSerch";
		}
		
		// 유저 삭제하기
				@RequestMapping(value="board/userDrop", method = RequestMethod.POST)
				public String userDrop (@RequestParam("id") String id) throws Exception {
				    
				    int result = service.userDrop(id);
				    
				    return "redirect:userSerch";
				}
		
		// 유저 휴면해제하기
		@RequestMapping(value="board/userRelease", method = RequestMethod.POST)
		public String userRelease (@RequestParam("id") String id) throws Exception {
		    
		    int result = service.userRelease(id);
		    
		    return "redirect:userSerch";
		}		
		
		// 도서관리 페이지 이동
		@RequestMapping(value = "board/adminBook", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView adminBook(
		    @RequestParam(defaultValue = "1") int page,
		    @RequestParam(defaultValue = "10") int pageSize,
		    @RequestParam(defaultValue = "") String sortBy,
		    @RequestParam(defaultValue = "") String keyword,
		    @RequestParam(defaultValue = "") String division
		) throws Exception {
		    ModelAndView mav = new ModelAndView();
		    
		    int totalCount = service.getTotalCount2(keyword); 
		    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		   	    
		    int startIdx = (page - 1) * pageSize;
		    int endIdx = pageSize;

		    List<bookDTO> adminBook = service.getListByRange2(startIdx, endIdx, keyword, sortBy, division);

		    mav.addObject("adminBook", adminBook);
		    mav.addObject("currentPage", page);
		    mav.addObject("totalPages", totalPages);
		    mav.addObject("keyword", keyword);
		    mav.setViewName("adminBook");
		    
		    System.out.println("정렬"+sortBy);
		    
		    return mav;
		}

		// 문의사항 관리 페이지
		@RequestMapping(value="board/userHelp", method = RequestMethod.GET)
		public String userHelp() {
			
			return "userHelp";
		}
		
		// 도서추가 페이지
				@RequestMapping(value="board/bookInsertview", method = RequestMethod.GET)
				public String bookInsertview() {
					
					return "bookInsertview";
				}
		
		
		// 유저관리리스트 검색 및 정렬 및 페이징
		@RequestMapping(value = "board/userSerch", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView userSerch(
		    @RequestParam(defaultValue = "1") int page,
		    @RequestParam(defaultValue = "10") int pageSize,
		    @RequestParam(defaultValue = "") String sortBy,
		    @RequestParam(defaultValue = "") String keyword,
		    @RequestParam(defaultValue = "") String division
		) throws Exception {
		    ModelAndView mav = new ModelAndView();
		    
		    int totalCount = service.getTotalCount(keyword); // 검색어를 사용하여 전체 회원 수 계산
		    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		    
		    if (page < 1) {
		        page = 1;
		    } else if (page > totalPages) {
		        page = totalPages;
		    }
		    
		    int startIdx = (page - 1) * pageSize;
		    int endIdx = pageSize;

		    List<MemberDTO> userList = service.getListByRange(startIdx, endIdx, keyword, sortBy,division);

		    mav.addObject("userList", userList);
		    mav.addObject("currentPage", page);
		    mav.addObject("totalPages", totalPages);
		    mav.addObject("keyword", keyword);
		    mav.setViewName("userList");
		    
		    System.out.println("정렬"+sortBy);
		    System.out.println("검색어"+keyword);
		    System.out.println("조건"+division);
		    
		    return mav;
		}
		
		// 게시판관리리스트 검색 및 정렬 및 페이징
				@RequestMapping(value = "board/adminBoard", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView adminBoard(
				    @RequestParam(defaultValue = "1") int page,
				    @RequestParam(defaultValue = "10") int pageSize,
				    @RequestParam(defaultValue = "") String sortBy,
				    @RequestParam(defaultValue = "") String keyword,
				    @RequestParam(defaultValue = "") String division
				) throws Exception {
				    ModelAndView mav = new ModelAndView();
				    
				    int totalCount = service.getTotalCount1(keyword);
				    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
				    
				    
				    int startIdx = (page - 1) * pageSize;
				    int endIdx = pageSize;

				    List<BoardDTO> adminBoard = service.getListByRange1(startIdx, endIdx, keyword, sortBy, division);

				    mav.addObject("adminBoard", adminBoard);
				    mav.addObject("currentPage", page);
				    mav.addObject("totalPages", totalPages);
				    mav.addObject("keyword", keyword);
				    mav.setViewName("adminBoard");
				    
				    System.out.println("페이지수"+totalCount);
				    System.out.println("토탈페이지"+totalPages);
				    System.out.println("페이지"+page);
				    System.out.println("정렬"+sortBy);
				    
				    return mav;
				}
			
		
		 // 유저정보수정 폼
		 
		 @RequestMapping(value="board/userUpdateview", method= RequestMethod.GET)
			public String userUpdateview(@RequestParam("id") String id, Model model) throws Exception {
				MemberDTO userDetail = service.userDetail(id);
				model.addAttribute("userDetail",userDetail);
				
				return "userUpdateview";
			}
		 
			// 유저정보상세 조회 폼
		 @RequestMapping(value = "board/userDetail", method = RequestMethod.GET, name = "userDetail")
		    public String userDetail(@RequestParam("id") String id, Model model) throws Exception {
		        MemberDTO userDetail = service.userDetail(id);
		        model.addAttribute("userDetail", userDetail);
		        return "userDetail";

		 }
		 
}

