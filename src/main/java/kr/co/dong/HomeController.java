package kr.co.dong;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   //인스턴스화 사용하는법 : 강한결합
//   HomeService homeService = new HomeService();
   //참조형으로 사용하는법
   @Inject   //@Autowired(어노테이션) : spring 전용
   HomeService homeService;
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
       logger.info("Welcome home! The client locale is {}.", locale);

       // 데이터베이스 연결 정보
       String url = "jdbc:mysql://localhost:3306/project?";
       String username = "root";
       String password = "12345";

       try {
           // JDBC 드라이버 로드
           Class.forName("com.mysql.jdbc.Driver");
           // 데이터베이스 연결
           Connection connection = DriverManager.getConnection(url, username, password);
           
           // 데이터베이스 쿼리 실행
           Statement statement = connection.createStatement();
           ResultSet resultSet = statement.executeQuery("SELECT SUM(bookmax) AS total_count FROM book;");
           
           int totalBookCount = 0;
           
           if (resultSet.next()) {
               totalBookCount = resultSet.getInt(1);
           }
           
           // member 테이블의 전체 데이터 개수 구하기
           ResultSet memberResultSet = statement.executeQuery("SELECT COUNT(*) FROM member");
           
           int totalMemberCount = 0;
           
           if (memberResultSet.next()) {
               totalMemberCount = memberResultSet.getInt(1);
           }
           
           // mypage_book 테이블에서 rentalcnt가 1인 데이터 개수 구하기
           ResultSet rentalResultSet = statement.executeQuery("SELECT COUNT(*) AS count FROM mypage_book WHERE rentalcnt = 1");
           
           int rentalCount = 0;
           
           if (rentalResultSet.next()) {
               rentalCount = rentalResultSet.getInt("count");
           }
           
           // 연결 해제
           resultSet.close();
           statement.close();
           connection.close();
           
           Date date = new Date();
           DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

           String formattedDate = dateFormat.format(date);

           model.addAttribute("serverTime", formattedDate);
           model.addAttribute("totalBookCount", totalBookCount);
           model.addAttribute("totalMemberCount", totalMemberCount);
           model.addAttribute("rentalCount", rentalCount);

           return "home";
       } catch (Exception e) {
           e.printStackTrace();
           return "error"; // 에러 페이지로 리디렉션 또는 에러 처리
       }
   }
   
   @RequestMapping(value= "/main", method= RequestMethod.GET)
   public ModelAndView main() {
      //정보를 전송하는 model과 view 페이지를 설정하는 클래스
      ModelAndView mav = new ModelAndView();
      //Service호출 - 기능을 수행한다.
      String name = homeService.testM();
      mav.addObject("name", name);   //정보저장
      mav.setViewName("main");      //view
      return mav;
      
   }
   
   
//   public String main(Model model) {
//      logger.info("메인입니다.");
//      model.addAttribute("name","홍길동");
//      return "main";
//   }
   
   
}