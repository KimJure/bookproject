package kr.co.dong.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public Map login(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return dao.login(map);
	}

	@Override
	public int joinMember(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return dao.joinMember(memberDTO);
	}

	@Override
	  public boolean checkDuplicateId(String id) {
	    int count = dao.checkDuplicateId(id);
	    return count > 0;
	  }

}
