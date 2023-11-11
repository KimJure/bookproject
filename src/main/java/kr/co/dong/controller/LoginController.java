package kr.co.dong.controller;

import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.member.MemberDTO;
import kr.co.dong.member.MemberService;

@Controller


public class LoginController {
   
   @Autowired
   private MemberService service; // MemberService 객체 주입
   
   
   public void MemberDTO() {
        MemberDTO memberDTO = new MemberDTO();
   }
        
   private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
   
//   로그인 폼으로 가는 매핑
   @RequestMapping(value="board/loginForm", method = RequestMethod.GET)
   public String loginForm() {
      
      return "loginForm";
   }
   
   // 로그인 처리
   @RequestMapping(value = "board/login", method = RequestMethod.POST)
   public String login(@RequestParam String id, @RequestParam String pw, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes re) throws Exception {
       Map<String, Object> map = new HashMap<>();
       map.put("id", id);
       map.put("pw", pw);
       
       Map<String, Object> result = service.login(map);
       if (result == null) {
           // 로그인 실패 처리
    	    re.addFlashAttribute("loginErrorMessage", "로그인에 실패했습니다. 올바른 ID와 비밀번호를 입력하세요.");
    	    return "redirect:/board/loginForm";
       }
           
       int authority = result.get("authority") != null ? (int) result.get("authority") : 0;
       int state = result.get("state") != null ? (int) result.get("state") : 0;
       
       String redirectPage;
       if (authority == 1) {
           redirectPage = "/";
       } else if (authority == 2) {
           redirectPage = "board/adminHome";
       } else {
           redirectPage = "board/loginForm";
       }
       
       if (state == 3) {
           return "redirect:/board/loginForm";
       } else {
          session.setAttribute("user", result);
          Object user = session.getAttribute("user");
          

           if (user != null) {
               // 세션에 user 속성이 존재하는 경우
               System.out.println("세션에 저장된 user 정보: " + user);
               // 세션에 저장된 값 활용하여 추가적인 작업 수행
               // ...
           } else {
               // 세션에 user 속성이 존재하지 않는 경우
               System.out.println("세션에 user 정보가 없습니다.");
               // 세션이 없는 경우에 대한 처리
               // ...
           }
           
          return "redirect:/" + redirectPage;
       }
   }


   
   @GetMapping(value="board/logOut")
   public String loginOut(HttpSession session) {
      session.invalidate();
      return "redirect:/";
   }
   
}