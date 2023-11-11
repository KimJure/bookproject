package kr.co.dong.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dong.book.bookDTO;
import kr.co.dong.member.MemberDTO;
import kr.co.dong.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//회원가입
	@RequestMapping(value="board/joinMember", method = RequestMethod.POST)
	public String joinMember (MemberDTO memberDTO) throws Exception{
		
		int r = service.joinMember(memberDTO);
		
		
		return "redirect:adminHome";
	}
	
	// 회원가입 페이지
	@RequestMapping(value="board/joinMemberview", method = RequestMethod.GET)
	public String joinMemberview() {
		
		return "joinMemberview";
	}
	
	// 중복검사 기능
	
	 @PostMapping("board/checkDuplicateId")
	  public ResponseEntity<?> checkDuplicateId(@RequestBody MemberDTO memberDTO) {
	    String id = memberDTO.getId();
	    boolean checkDuplicateId = service.checkDuplicateId(id);
	    return ResponseEntity.status(HttpStatus.OK).body(checkDuplicateId);
	  }

}
