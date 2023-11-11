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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.book.bookDTO;
import kr.co.dong.book.bookService;
import kr.co.dong.book.booksearch;
import kr.co.dong.book.page;
import kr.co.dong.mypage.MypageDTO;

@Controller
public class bookController {
   private static final Logger logger = LoggerFactory.getLogger(bookController.class);
   @Autowired
   private bookService service;
   @RequestMapping(value="book/home", method = RequestMethod.GET)
   public String home() throws Exception{
      return "home";
   }
   
   //인기도서 조회
    @RequestMapping(value="book/bestlist", method= RequestMethod.GET)
    public ModelAndView bestlist() throws Exception {
       ModelAndView mav = new ModelAndView();
       
       List<bookDTO> bestlist= service.bestlist();
       mav.addObject("bestlist", bestlist);
       mav.setViewName("bestlist");
       return mav;
    }
   //신간도서 이동
   @RequestMapping(value="book/newlist", method = RequestMethod.GET)
   public ModelAndView newlist() throws Exception {
      ModelAndView mav = new ModelAndView();
      
      List<bookDTO> newlist = service.newlist();
      mav.addObject("newlist", newlist);
      mav.setViewName("newlist");
   return mav;
   }
   //국내도서
   @RequestMapping(value="book/origin1list", method= RequestMethod.GET)
   public String origin1(Model model,@RequestParam("num")int num,
          @RequestParam(value="searchtype",required = false,defaultValue = "bookname")String searchtype,
          @RequestParam(value="keyword",required = false,defaultValue = "")String keyword)throws Exception {
      
      page page = new page();
      
      page.setNum(num);
      page.setCount(service.origin1cnt(searchtype, keyword));  
      
      page.setsearchtype(searchtype);
      page.setkeyword(keyword);
      
      List<bookDTO> list = null;
      list = service.origin1list(page.getDisplayPost(), page.getPostNum()
            ,searchtype,keyword);
      
      
      model.addAttribute("origin1list",list);
      
      model.addAttribute("page", page);
      
      model.addAttribute("select", num);
      
      return "origin1list";
    }
   //국외도서
   @RequestMapping(value="book/origin2list", method= RequestMethod.GET)
   public String origin2(Model model,@RequestParam("num")int num,
          @RequestParam(value="searchtype",required = false,defaultValue = "bookname")String searchtype,
          @RequestParam(value="keyword",required = false,defaultValue = "")String keyword)throws Exception {
      
      page page = new page();
      
      page.setNum(num);
      page.setCount(service.origin2cnt(searchtype, keyword));  
      
      page.setsearchtype(searchtype);
      page.setkeyword(keyword);
      
      List<bookDTO> list = null;
      list = service.origin2list(page.getDisplayPost(), page.getPostNum()
            ,searchtype,keyword);
      
      
      model.addAttribute("origin2list",list);
      
      model.addAttribute("page", page);
      
      model.addAttribute("select", num);
      
      return "origin2list";
   }
   //도서상세
   @RequestMapping(value="book/bookdetail", method = RequestMethod.GET)
   public String bookdetail(@RequestParam("booknum")int booknum, Model model) throws Exception {
      bookDTO book = service.bookdetail(booknum);
      model.addAttribute("book", book);
      
      return "bookdetail";
   }
   //도서대여
   @ResponseBody
   @RequestMapping(value="book/bookdetail1", method = RequestMethod.POST)
      public int rental(bookDTO bookDTO, MypageDTO mypageDTO) throws Exception{
            service.rentalinsert(mypageDTO);
      return service.rental(bookDTO);
   }
   
   
   //도서검색
   @RequestMapping(value="book/booksearch", method = RequestMethod.GET)
    public String searchpage(Model model,@RequestParam("num")int num,
          @RequestParam(value="searchtype",required = false,defaultValue = "bookname")String searchtype,
          @RequestParam(value="keyword",required = false,defaultValue = "")String keyword)throws Exception {
      
      page page = new page();
      
      page.setNum(num);
      page.setCount(service.searchcnt(searchtype,keyword));  
      
      page.setsearchtype(searchtype);
      page.setkeyword(keyword);
      
      List<bookDTO> list = null;
      list = service.search(page.getDisplayPost(), page.getPostNum()
            ,searchtype,keyword);
      
      
      model.addAttribute("alllist",list);
      
      model.addAttribute("page", page);
      
      model.addAttribute("select", num);
      
      return "booksearch";
      
   }
   //장르별
   @RequestMapping(value="book/genrelist", method = RequestMethod.GET)
    public String genrelist(Model model,@RequestParam("num")int num,
          @RequestParam(value="searchtype",required = false,defaultValue = "bookname")String searchtype,
          @RequestParam(value="keyword",required = false,defaultValue = "")String keyword)throws Exception {
      
      page page = new page();
      
      page.setNum(num);
      page.setCount(service.searchcnt(searchtype,keyword));  
      
      page.setsearchtype(searchtype);
      page.setkeyword(keyword);
      
      List<bookDTO> list = null;
      list = service.genrelist(page.getDisplayPost(), page.getPostNum()
            ,searchtype,keyword);
      
      
      model.addAttribute("genrelist",list);
      
      model.addAttribute("page", page);
      
      model.addAttribute("select", num);
      
      return "genrelist";
      
   }
   
   // 도서추가
    @RequestMapping(value="board/bookInsert", method = RequestMethod.POST)
    public String bookInsert (bookDTO BookDTO) throws Exception{
       
       int r = service.bookInsert(BookDTO);
       
       System.out.println("r"+r);
       
       return "redirect:adminBook";
    }
    
    //도서 상세 조회

     @RequestMapping(value = "board/adminbookdetail", method = RequestMethod.GET, name = "bookDetail")
        public String bookDetail(@RequestParam("booknum") String booknum, Model model) throws Exception {
           bookDTO bookDetail = service.bookDetail(booknum);
            model.addAttribute("bookDetail", bookDetail);
            return "adminbookdetail";

     }
     
       // 도서 수정 폼
       @RequestMapping(value="board/bookUpdateview", method= RequestMethod.GET)
       public String bookUpdateview(@RequestParam("booknum") String booknum, Model model) throws Exception {
          bookDTO bookDetail = service.bookDetail(booknum);
          model.addAttribute("bookDetail",bookDetail);
          
          return "bookUpdateview";
       }
       
       // 도서 정보 수정      
       @RequestMapping(value="board/bookUpdate", method= RequestMethod.POST)
       public ModelAndView bookUpdate (bookDTO BookDTO) throws Exception{
          
          int r = service.bookUpdate(BookDTO);
          
          
           ModelAndView modelAndView = new ModelAndView();
              modelAndView.addObject("booknum", BookDTO.getBooknum());
              modelAndView.setViewName("redirect:/board/bookDetail");
              return modelAndView;
          }
}
            
            
            