/* Controller의 역할
 * 1)요청한 정보를 매핑.
 * 2)해당 서비스 호출.
 * 3)결과값을 모델에 저장후, view에 리턴
 * 
 * - Controller는 Service를 호출
 * - @Controller
 */
package kr.co.dong.emp;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmpController {
	@Inject
	private EmpService service;
	
	//@RequestMapping -> @GetMapping / @PostMapping
	@RequestMapping(value="empCount")
	public String empCount(Model model) throws Exception {
		int cnt = service.empCount();
		model.addAttribute("cnt",cnt);
		return "home";
	}
}
