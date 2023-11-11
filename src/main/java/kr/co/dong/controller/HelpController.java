package kr.co.dong.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.help.HelpDTO;
import kr.co.dong.help.HelpService;
@Controller
public class HelpController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	HelpService service;
	
	// 문의사항 글 작성
	@RequestMapping(value="board/helpRegister", method = RequestMethod.POST)
	public String helpRegister (HelpDTO helpDTO) throws Exception{
		
		int r = service.helpRegister(helpDTO);
		
		return "redirect:adminHome"; // < 내 문의사항 이동으로 추후 수정
	}
	
	//문의사항 리스트 보기
			@RequestMapping(value = "board/adminHelp", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView adminHelp(
			    @RequestParam(defaultValue = "1") int page,
			    @RequestParam(defaultValue = "10") int pageSize,
			    @RequestParam(defaultValue = "default") String sortBy,
			    @RequestParam(defaultValue = "") String keyword
			) throws Exception {
			    ModelAndView mav = new ModelAndView();
			    
			    int totalCount = service.getTotalCount(keyword); // 검색어를 사용하여 전체 회원 수 계산
			    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
			    
			    
			    switch (sortBy) {
			    case "id":
			        sortBy = "id";
			        break;
			    case "title":
			        sortBy = "title";
			        break;
			    case "idDesc":
			        sortBy = "idDesc";
			        break;
			    case "titleDesc":
			        sortBy = "titleDesc";
			        break;
			    case "regdateAsc":
			        sortBy = "hdateAsc";
			        break;
			    case "regdateDesc":
			        sortBy = "hdateDesc";
			        break;
			    case "default":
			        sortBy = "default";
			        break;
			    case "wating":
			        sortBy = "wating";
			        break;
			    case "complete":
			        sortBy = "complete";
			        break;
			    default:
			        sortBy = "hdate";
			        break;
			}
			    
			    int startIdx = (page - 1) * pageSize;
			    int endIdx = pageSize;

			    List<HelpDTO> adminHelp = service.getListByRange(startIdx, endIdx, keyword, sortBy);

			    mav.addObject("adminHelp", adminHelp);
			    mav.addObject("currentPage", page);
			    mav.addObject("totalPages", totalPages);
			    mav.addObject("keyword", keyword);
			    mav.setViewName("adminHelp");
			    
			    System.out.println("페이지수"+totalCount);
			    System.out.println("sortBy"+sortBy);
			    return mav;
			}
			
			//문의사항 답변 페이지 이동
			@RequestMapping(value="board/helpAnswer", method= RequestMethod.GET)
			public String helpAnswer(@RequestParam("hno") int hno, Model model) {
				HelpDTO helpAnswer = service.helpAnswer(hno);
				model.addAttribute("helpAnswer",helpAnswer);
				
				return "helpAnswer";
			}
}
