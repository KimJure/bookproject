package kr.co.dong.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.board.BoardService;
import kr.co.dong.book.bookDTO;
import kr.co.dong.member.MemberDTO;
@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	
	// 문의사항 페이지 이동
			@RequestMapping(value="board/helpBoard", method = RequestMethod.GET)
			public String helpBoard() {
				
				return "helpBoard";
			}
			
	
	// 관리자 글쓰기 페이지 이동
		@RequestMapping(value="board/writingForm", method = RequestMethod.GET)
		public String writingForm() {
			
			return "writingForm";
		}
		
		
		// 유저 게시글 수정 이동
		@RequestMapping(value="board/boardInsertview", method = RequestMethod.GET)
		public String boardInsertview() {
			
			return "boardInsertview";
		}
		
		
		// 게시글 작성
		@RequestMapping(value="board/boardInsert", method = { RequestMethod.GET, RequestMethod.POST })
		public String boardInsert (BoardDTO boardDTO) throws Exception{
			logger.info("내용 : " + boardDTO);
			logger.info("id 값: " + boardDTO.getId());
			
			int r = service.boardInsert(boardDTO);
			
			return "redirect:/board/boardList";
		}
		
		// 게시글 삭제하기
		@RequestMapping(value="board/boardDelete", method = RequestMethod.POST)
		public String boardDelete (@RequestParam("bno") int bno) throws Exception {
		    
		    int result = service.boardDelete(bno);
		    
		    return "redirect:adminBoard";
		}
		
		
		//전체게시글 보기
		@RequestMapping(value = "board/boardList", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView boardList(
		    @RequestParam(defaultValue = "1") int page,
		    @RequestParam(defaultValue = "10") int pageSize,
		    @RequestParam(defaultValue = "joindate") String sortBy,
		    @RequestParam(defaultValue = "") String keyword
		) throws Exception {
		    ModelAndView mav = new ModelAndView();
		    
		    int totalCount = service.getTotalCount(keyword); // 검색어를 사용하여 전체 회원 수 계산
		    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		    
		    
		    
		    int startIdx = (page - 1) * pageSize;
		    int endIdx = pageSize;

		    List<BoardDTO> boardList = service.getListByRange(startIdx, endIdx, keyword, sortBy);

		    mav.addObject("boardList", boardList);
		    mav.addObject("currentPage", page);
		    mav.addObject("totalPages", totalPages);
		    mav.addObject("keyword", keyword);
		    mav.setViewName("boardList");
		    
		    System.out.println("페이지수"+totalCount);
		    System.out.println("페이지수"+totalPages);
		    return mav;
		}
		
		// 게시판 공지사항 보기
				@RequestMapping(value = "board/announcement", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView announcement(
				    @RequestParam(defaultValue = "1") int page,
				    @RequestParam(defaultValue = "10") int pageSize,
				    @RequestParam(defaultValue = "joindate") String sortBy,
				    @RequestParam(defaultValue = "") String keyword
				) throws Exception {
				    ModelAndView mav = new ModelAndView();
				    
				    int totalCount = service.getTotalCount1(keyword); // 검색어를 사용하여 전체 회원 수 계산
				    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
				    
				    
				    
				    int startIdx = (page - 1) * pageSize;
				    int endIdx = pageSize;

				    List<BoardDTO> announcement = service.getListByRange1(startIdx, endIdx, keyword, sortBy);

				    mav.addObject("announcement", announcement);
				    mav.addObject("currentPage", page);
				    mav.addObject("totalPages", totalPages);
				    mav.addObject("keyword", keyword);
				    mav.setViewName("announcement");
				    
				    System.out.println("페이지수"+totalCount);
				    System.out.println("페이지수"+totalPages);
				    return mav;
				}
				
				// 게시판 공지사항 보기
				@RequestMapping(value = "board/freeBoard", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView freeBoard(
				    @RequestParam(defaultValue = "1") int page,
				    @RequestParam(defaultValue = "10") int pageSize,
				    @RequestParam(defaultValue = "joindate") String sortBy,
				    @RequestParam(defaultValue = "") String keyword
				) throws Exception {
				    ModelAndView mav = new ModelAndView();
				    
				    int totalCount = service.getTotalCount2(keyword); // 검색어를 사용하여 전체 회원 수 계산
				    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
				    
				    
				    
				    int startIdx = (page - 1) * pageSize;
				    int endIdx = pageSize;

				    List<BoardDTO> freeBoard = service.getListByRange2(startIdx, endIdx, keyword, sortBy);

				    mav.addObject("freeBoard", freeBoard);
				    mav.addObject("currentPage", page);
				    mav.addObject("totalPages", totalPages);
				    mav.addObject("keyword", keyword);
				    mav.setViewName("freeBoard");
				    
				    System.out.println("페이지수"+totalCount);
				    System.out.println("페이지수"+totalPages);
				    return mav;
				}
				
				// 게시판 공지사항 보기
				@RequestMapping(value = "board/reviewBoard", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView reviewBoard(
				    @RequestParam(defaultValue = "1") int page,
				    @RequestParam(defaultValue = "10") int pageSize,
				    @RequestParam(defaultValue = "joindate") String sortBy,
				    @RequestParam(defaultValue = "") String keyword
				) throws Exception {
				    ModelAndView mav = new ModelAndView();
				    
				    int totalCount = service.getTotalCount3(keyword); // 검색어를 사용하여 전체 회원 수 계산
				    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
				    
				    
				    
				    int startIdx = (page - 1) * pageSize;
				    int endIdx = pageSize;

				    List<BoardDTO> reviewBoard = service.getListByRange3(startIdx, endIdx, keyword, sortBy);

				    mav.addObject("reviewBoard", reviewBoard);
				    mav.addObject("currentPage", page);
				    mav.addObject("totalPages", totalPages);
				    mav.addObject("keyword", keyword);
				    mav.setViewName("reviewBoard");
				    
				    System.out.println("페이지수"+totalCount);
				    System.out.println("페이지수"+totalPages);
				    return mav;
				}
		
		// 게시글상세 조회 폼
		 @RequestMapping(value = "board/boardDetail", method = RequestMethod.GET, name = "userDetail")
		    public String boardDetail(@RequestParam("bno") int bno, Model model) throws Exception {
		        BoardDTO boardDetail = service.boardDetail(bno);
		        model.addAttribute("boardDetail", boardDetail);
		        
		        service.viewcntUp(bno);
		        
		        return "boardDetail";

		 }
		 
		 @PostMapping("board/updateLikeCount")
		 public ResponseEntity<Integer> updateLikeCount(@RequestBody BoardDTO requestData) {
		     // 요청에서 필요한 데이터 추출
		     int bno = requestData.getBno();
		     boolean isLiked = requestData.isLiked();
		     int likecnt = requestData.getLikecnt();
		     
		     // 좋아요 수 업데이트 로직 수행
		     if (isLiked) {
		    	    service.updateLikeCount(bno, true);
		    	    likecnt++;
		    	} else {
		    	    service.downLikeCount(bno, false);
		    	    likecnt--;
		    	}
		     
		     System.out.println(bno);
		     System.out.println(isLiked);
		     System.out.println(likecnt);
		     
		     
		     return ResponseEntity.ok(likecnt);
		 }
		 
		// 게시글 수정 폼
		@RequestMapping(value="board/boardUpdateview", method= RequestMethod.GET)
		public String boardUpdateview(@RequestParam("bno") int bno, Model model) throws Exception {
			BoardDTO boardDetail = service.boardDetail(bno);
			model.addAttribute("boardDetail",boardDetail);
			
			return "boardUpdateview";
		}
		
		
		// 게시글 정보 수정		
		@RequestMapping(value="board/boardUpdate", method= RequestMethod.POST)
		public ModelAndView boardUpdate (BoardDTO boardDTO) throws Exception{
			
			int r = service.boardUpdate(boardDTO);
			
			
			 ModelAndView modelAndView = new ModelAndView();
			    modelAndView.addObject("bno", boardDTO.getBno());
			    modelAndView.setViewName("redirect:/board/boardDetail");
			    return modelAndView;
			}
		 

		 
	

}
