package kr.co.dong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.co.dong.reply.ReplyDTO;
import kr.co.dong.reply.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	ReplyService service;
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping(value="board/ReplyInsert", method = RequestMethod.POST)
	public int ReplyInsert(ReplyDTO replyDTO) throws Exception{
		return service.ReplyInsert(replyDTO);
	
	}
	
	// ajax 댓글 조회
	@ResponseBody
    @RequestMapping(value = "board/ReplyList", method = RequestMethod.GET)
	public List<ReplyDTO> ReplyList(@RequestParam("bno") int bno) throws Exception {
		
		System.out.println("값은"+bno);
        return service.ReplyList(bno);
    }
	
	// ajax 댓글 수정
	@ResponseBody
	@RequestMapping(value="board/ReplyUpdate", method = RequestMethod.POST)
	public int ReplyUpdate(ReplyDTO replyDTO) throws Exception {
		return service.ReplyUpdate(replyDTO);
	}
	
	   // ajax 댓글 삭제
	   @ResponseBody
	   @RequestMapping(value = "board/ReplyDelete", method = RequestMethod.POST)
	   public int ReplyDelete(@RequestParam("dno") int dno) throws Exception {
	       int result = service.ReplyDelete(dno);
	       return result;
	   }
}
