/*
 * Service는 DAO 호출을 담당
 * 1) @Service
 * 2) EmpDAO를 주입
 */

package kr.co.dong.emp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpServiceImpl implements EmpService{
	@Autowired
	private EmpDAO dao;
	
	@Override
	public int empCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.empCount();
	}

}
